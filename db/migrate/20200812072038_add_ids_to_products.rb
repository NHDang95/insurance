class AddIdsToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :user_id, :integer
    add_column :products, :brand_id, :integer
    add_column :products, :type_id, :integer
  end
end
