class AddYearCreatedToBrands < ActiveRecord::Migration[6.1]
  def change
    add_column :brands, :year_created, :integer
  end
end
