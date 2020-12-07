class RemoveFieldsFromRents < ActiveRecord::Migration[6.0]
  def change
    remove_column :rents, :user_id
    remove_column :rents, :bike_id
    remove_column :rents, :start_date
    remove_column :rents, :end_date
  end
end
