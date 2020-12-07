class ChangeStatusToStateOnRents < ActiveRecord::Migration[6.0]
  def change
    rename_column :rents, :status, :state
  end
end
