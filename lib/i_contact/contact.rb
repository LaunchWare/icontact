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

    class << self
      def unlisted
        parse(get(:unlisted => true))
      end
    end
  end
end

