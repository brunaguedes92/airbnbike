class AddFieldToBike < ActiveRecord::Migration[6.0]
  def change
    add_column :bikes, :title, :string
    add_column :bikes, :price, :integer
  end
end
