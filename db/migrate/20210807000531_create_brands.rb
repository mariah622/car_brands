class CreateBrands < ActiveRecord::Migration[6.1]
  def change
    create_table :brands do |t|
      t.string :name
      t.integer :year_created

      t.timestamps
    end
  end
end
