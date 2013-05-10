class CreateSuppliers < ActiveRecord::Migration
  def self.up
    create_table :suppliers do |t|
      t.string :company
      t.string :name
      t.string :email
      t.string :telephone
      t.string :fax

      t.timestamps
    end
  end

  def self.down
    drop_table :suppliers
  end
end
