class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.string :name
      t.integer :parent_id
      t.text :description

      t.timestamps
    end
  end
end
