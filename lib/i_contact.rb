require "i_contact/version"
require "i_contact/configuration"
require "i_contact/contact"

module IContact
  def self.configure(&block)
    @configuration = IContact::Configuration.new(&block) if block_given?
  end

  def self.configuration
    @configuration
  end

  def self.configuration=(configuration)
    @configuration = configuration
  end
end

