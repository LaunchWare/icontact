module IContact
  class Contact
    include IContact::Model

    key_attribute :contact_id
    attribute :email, :type => String
    attribute :first_name, :type => String
    attribute :last_name, :type => String
    attribute :suffix, :type => String
    attribute :street, :type => String
    attribute :street2, :type => String
    attribute :city, :type => String
    attribute :state, :type => String
    attribute :postalCode, :type => String
    attribute :phone, :type => String
    attribute :fax, :type => String
    attribute :business, :type => String

    def destroy
      if persisted?
        connection.post(path("#{self.class.resource_name.demodulize.pluralize}/#{self.attributes[self.class.key_attr.to_s]}"), {:status => 'deleted'}.to_json)
      end
    end

    class << self
      def unlisted(options = {})
        parse(get({:unlisted => true}.merge(options)))
      end
    end
  end
end

