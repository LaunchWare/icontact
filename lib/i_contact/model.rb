require 'active_support/concern'
require 'active_support/core_ext/class/attribute.rb'
require 'active_support/core_ext/object/blank.rb'

module IContact
  module Model
    extend ActiveSupport::Concern
    extend ActiveModel::Naming

    included do
      include ActiveModel::Conversion
      include ActiveModel::Validations
      include ActiveAttr::TypecastedAttributes
      include ActiveAttr::MassAssignment

      class_attribute :key_attr
      class_attribute :resource_name_attr
    end

    module ClassMethods
      def key_attribute(key, type = Integer)
        self.key_attr = key
        attribute key, :type => type
      end

      def resource_name(name)
        self.resource_name_attr = name
      end

      def resource_name
        self.resource_name_attr || name.demodulize.downcase
      end

      def connection
        IContact.connection
      end

      def path(suffix)
        "#{IContact.url}#{suffix}"
      end

      def get(additional_args = {})
        connection.get path(self.resource_name.pluralize),
          additional_args
      end

      def parse(resp)
        resp = IContact::Response.new(resp)
        if !resp.valid?
        else
          if resource_resp = resp.parsed_response[resource_name.pluralize]
            if resource_resp.kind_of?(Array)
              resource_resp.inject([]) do |arr, attribute_hash|
                arr << new(deserialize_attributes(attribute_hash))
                arr
              end
            end
          end
        end
      end

      def deserialize_attributes(attribute_hash)
        attribute_hash.inject({}) do |hsh, key_pair|
          hsh[key_pair[0].underscore] = key_pair[1]
          hsh
        end
      end
    end #end ClassMethods

    def save
      if valid?
        if !persisted?
          raw_resp = connection.post(path(self.class.resource_name.demodulize.pluralize),
            serialized_attributes.to_json)
          response = IContact::Response.new(raw_resp)
          if response.valid?
            self.attributes = response.parsed_response
            true
          else
            @errors = response.errors
            false
          end
        else

        end
      end
    end

    def save!
      unless save
        raise IContact::InvalidResource,  @errors.join(', ')
      end
      self
    end

    def destroy
      if persisted?
        connection.delete(path("#{self.class.resource_name.demodulize.pluralize}/#{self.attributes[self.class.key_attr]}"))
      end
    end

    def serialized_attributes
      result = attributes.inject({}) do |hsh, keypair|
        hsh[keypair[0]] = keypair[1] unless keypair[1].nil?
        hsh
      end

      if !persisted?
        [result]
      else
        result
      end
    end

    def persisted?
      self.class.key_attr && self.attributes[self.class.key_attr.to_s].present?
    end

    protected
    def path(suffix)
      self.class.path(suffix)
    end

    def connection
      self.class.connection
    end
  end
end

