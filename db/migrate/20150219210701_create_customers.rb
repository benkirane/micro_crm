class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email
      t.string :street
      t.string :zip
      t.string :city

      t.timestamps null: false
    end
  end
end
