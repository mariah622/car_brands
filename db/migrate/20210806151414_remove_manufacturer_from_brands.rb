class RemoveManufacturerFromBrands < ActiveRecord::Migration[6.1]
  def change
    remove_column :brands, :manufacturer, :string
  end
end
