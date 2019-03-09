class CreatePeriodicPayments < ActiveRecord::Migration[6.0]
  def change
    create_table :periodic_payments do |t|
      t.decimal :total, precision: 12, scale: 3, null: false
      t.date :schedule_on, null: false

      t.timestamps
    end
  end
end
