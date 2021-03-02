class CreateHouses < ActiveRecord::Migration[5.2]
  def change
    create_table :houses do |t|
      t.string :name
      t.integer :rent
      t.string :adress
      t.integer :age
      t.text :content

      t.timestamps
    end
  end
end
