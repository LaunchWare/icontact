require 'active_record'
require 'active_record_base_without_table'

module IContact
  class Model < ActiveRecord::BaseWithoutTable
    include IContact::ModelMethods

    def initialize(options = {})
      options = prune_attrs(options)
      super
    end
  end
end

