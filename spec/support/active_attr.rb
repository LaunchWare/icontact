require "active_attr/rspec"

module ActiveAttrMacros
  def has_attr(attr, data_type = nil)

    it do
      if data_type
        should have_attribute(attr).of_type(data_type)
      else
        should have_attribute(attr)
      end
    end
  end
end
RSpec.configure do |config|
  config.extend(ActiveAttrMacros)
end
