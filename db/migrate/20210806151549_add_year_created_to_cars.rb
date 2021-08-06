class AddYearCreatedToCars < ActiveRecord::Migration[6.1]
  def change
    add_column :cars, :year_created, :integer
  end
end
