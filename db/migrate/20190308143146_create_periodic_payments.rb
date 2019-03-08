class CreatePeriodicPayments < ActiveRecord::Migration[6.0]
  def change
    create_table :periodic_payments do |t|
      t.decimal :total, precision: 9, scale: 3
      t.date :schedule_on, null: false

      t.timestamps
    end
  end
end
