class CreateModelyears < ActiveRecord::Migration[5.1]
  def change
    create_table :modelyears, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.string :name

      t.timestamps
    end
  end
end
