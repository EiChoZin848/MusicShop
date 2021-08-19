class CreateLineItems < ActiveRecord::Migration
  def self.up
    create_table :line_items do |t|
      t.references :instrument, :foreign_key => true
      t.belongs_to :cart, :foreign_key => true

      t.timestamps
    end
  end

  def self.down
    drop_table :line_items
  end
end
