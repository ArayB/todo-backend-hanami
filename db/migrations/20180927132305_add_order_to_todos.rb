Hanami::Model.migration do
  change do
    alter_table :todos do
      add_column :order, Integer, null: false, default: 0
    end
  end
end
