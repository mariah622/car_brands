class RemoveYearCreatedFromCars < ActiveRecord::Migration[6.1]
  def change
    remove_column :cars, :year_created, :string
  end
end
