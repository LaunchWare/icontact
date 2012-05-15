module IContact
  class ClientFolder
    include IContact::Model

    key_attribute :client_folder_id

    class << self
      def get
        resp = connection.get("#{IContact.url(false)}a/#{account_id}/c")
        parse(resp)
      end

      protected
      def account_id
        IContact.configuration.account_id
      end
    end
  end
end
