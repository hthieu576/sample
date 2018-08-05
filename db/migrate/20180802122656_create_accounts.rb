class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.references :user, foreign_key: true, index: true
      t.string :name
      t.integer :balance
    end
  end
end
