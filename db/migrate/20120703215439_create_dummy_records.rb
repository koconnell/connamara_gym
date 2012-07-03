class CreateDummyRecords < ActiveRecord::Migration
  def change
    create_table :dummy_records do |t|
      t.string :field1
      t.string :field2

      t.timestamps
    end
  end
end
