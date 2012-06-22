module IContact
  class Account < IContact::Model
    key_attribute :account_id

    class << self
      def get
        resp = connection.get("#{IContact.url(false)}a")
        parse(resp)
      end
    end
  end
end
