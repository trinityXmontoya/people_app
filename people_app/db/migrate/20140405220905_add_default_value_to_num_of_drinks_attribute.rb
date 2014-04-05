class AddDefaultValueToNumOfDrinksAttribute < ActiveRecord::Migration
  def change
     change_column :people, :num_of_drinks, :integer, :default =>0
  end
end
