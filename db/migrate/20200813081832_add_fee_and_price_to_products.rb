class AddFeeAndPriceToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :fee, :integer
    add_column :products, :price, :integer
  end
end
