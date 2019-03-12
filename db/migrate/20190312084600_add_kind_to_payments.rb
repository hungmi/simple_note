class AddKindToPayments < ActiveRecord::Migration[6.0]
  def change
    add_column :payments, :kind, :integer
    add_index :payments, :kind
  end
end
