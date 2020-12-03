class CreateBikes < ActiveRecord::Migration[6.0]
  def change
    create_table :bikes do |t|
      t.string :address
      t.string :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
