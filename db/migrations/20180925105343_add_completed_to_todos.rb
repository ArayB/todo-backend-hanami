Hanami::Model.migration do
  change do
    alter_table :todos do
      add_column :completed, TrueClass, null: false, default: false
    end
  end
end
