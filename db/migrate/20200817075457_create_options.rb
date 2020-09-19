class CreateOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :options, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.string :name
      t.integer :price

      t.timestamps
    end
  end
end
