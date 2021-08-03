class AddBrandIdToCars < ActiveRecord::Migration[6.1]
  def change
    add_column :cars, :brand_id, :integer
  end
end
