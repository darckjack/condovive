class CreateFees < ActiveRecord::Migration[5.2]
  def change
    create_table :fees do |t|
      t.integer :amount
      t.datetime :date
      t.references :apartment, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :paid

      t.timestamps
    end
  end
end
