class AddOtherIdsToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :group_id, :integer
    add_column :products, :usage_id, :integer
    add_column :products, :modelyear_id, :integer
  end
end
