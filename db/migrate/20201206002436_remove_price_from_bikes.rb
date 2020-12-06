class RemovePriceFromBikes < ActiveRecord::Migration[6.0]
  def change
    remove_column :bikes, :price, :integer
  end
end
