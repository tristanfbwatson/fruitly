class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.integer :price_in_pence
      t.integer :previous_price_in_pence

      t.timestamps
    end
  end
end
