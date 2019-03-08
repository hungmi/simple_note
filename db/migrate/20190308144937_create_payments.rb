class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.decimal :total, precision: 12, scale: 3

      t.timestamps
    end
  end
end
