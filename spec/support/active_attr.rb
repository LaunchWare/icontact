#require "active_attr/rspec"

module ActiveAttrMacros
  def has_attr(attr, data_type = nil)

    it do
      #no-op for now :-(
    end
  end
end
RSpec.configure do |config|
  config.extend(ActiveAttrMacros)
end
