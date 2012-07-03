class CreateDummyRecords < ActiveRecord::Migration
  def change
    create_table :dummy_records do |t|
      t.string :field1
      t.string :field2
      t.integer :id

      t.timestamps
    end
    add_index :dummy_records, :id, :unique => true
  end
end
