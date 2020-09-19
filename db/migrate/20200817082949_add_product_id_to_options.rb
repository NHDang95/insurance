class AddProductIdToOptions < ActiveRecord::Migration[5.1]
  def change
    add_column :options, :product_id, :integer  	
  end
end
