class RemoveUserIdFromCars < ActiveRecord::Migration[6.1]
  def change
    remove_column :cars, :user_id, :integer
  end
end
