class AddIdsToTypes < ActiveRecord::Migration[5.1]
  def change
    add_column :types, :group_id, :integer
    add_column :types, :usage_id, :integer
  end
end
