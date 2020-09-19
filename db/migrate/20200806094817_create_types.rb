class CreateTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :types, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.string :name
      t.integer :brand_id

      t.timestamps
    end
  end
end
