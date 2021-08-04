class RemoveBrandIdFromCars < ActiveRecord::Migration[6.1]
  def change
    remove_column :cars, :brand_id, :integer
  end
end
