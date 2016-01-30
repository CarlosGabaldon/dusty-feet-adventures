module ActiveRecord
  module ConnectionAdapters # :nodoc:
    module SchemaStatements
      include ActiveRecord::Migration::JoinTable

    def add_reference(table_name, ref_name, options = {})
      polymorphic = options.delete(:polymorphic)
      index_options = options.delete(:index)
      type = options.delete(:type) || :integer
      foreign_key_options = options.delete(:foreign_key)
      if polymorphic && foreign_key_options
        raise ArgumentError, "Cannot add a foreign key to a polymorphic relation"
      end
      add_column(table_name, "#{ref_name}_id", type, options)
      add_column(table_name, "#{ref_name}_type", :string, polymorphic.is_a?(Hash) ? polymorphic : options) if polymorphic
      add_index(table_name, polymorphic ? %w[type id].map{ |t| "#{ref_name}_#{t}" } : "#{ref_name}_id", index_options.is_a?(Hash) ? index_options : {}) if index_options
      if foreign_key_options
        to_table = Base.pluralize_table_names ? ref_name.to_s.pluralize : ref_name
        add_foreign_key(table_name, to_table, foreign_key_options.is_a?(Hash) ? foreign_key_options : {})
      end
    end
      alias :add_belongs_to :add_reference

    end
  end
end
