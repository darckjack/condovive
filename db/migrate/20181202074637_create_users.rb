class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.integer :role
      t.references :apartment, foreign_key: true

      t.timestamps
    end
  end
end
