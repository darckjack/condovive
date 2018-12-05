class CreateApartments < ActiveRecord::Migration[5.2]
  def change
    create_table :apartments do |t|
      t.string :name
      t.integer :apartment_number
      t.references :condo, foreign_key: true

      t.timestamps
    end
  end
end
