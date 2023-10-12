class CreateRestaurants < ActiveRecord::Migration[7.0]
  def change
    add_column :restaurants, :phone_number, :string
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :category

      t.timestamps
    end
  end
end
