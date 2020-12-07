class AddOrderRefToRents < ActiveRecord::Migration[6.0]
  def change
    add_reference :rents, :order, null: false, foreign_key: true
  end
end
