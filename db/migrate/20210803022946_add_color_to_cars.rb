class AddColorToCars < ActiveRecord::Migration[6.1]
  def change
    add_column :cars, :color, :string
  end
end
