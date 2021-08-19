class CreateInstruments < ActiveRecord::Migration
  def self.up
    create_table :instruments do |t|
      t.string :brand
      t.string :model
      t.text :description
      t.string :condition
      t.string :finish
      t.string :title
      t.decimal :price, :precision => 5, :scale => 2, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :instruments
  end
end
