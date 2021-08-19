class AddImageToInstruments < ActiveRecord::Migration
  def self.up
    add_column :instruments, :image, :string
  end

  def self.down
    remove_column :instruments, :image
  end
end
