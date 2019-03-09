class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.decimal :total, precision: 12, scale: 3, null: false
      t.belongs_to :project, foreign_key: true
			t.belongs_to :notebook, foreign_key: true
			t.belongs_to :periodic_payment, foreign_key: true
			t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
