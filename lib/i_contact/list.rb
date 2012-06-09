module IContact
  class List
    include IContact::Model

    key_attribute :list_id
    attribute :name, :type => String
    attribute :description, :type => String
    attribute :publicname, :type => String
  end
end

