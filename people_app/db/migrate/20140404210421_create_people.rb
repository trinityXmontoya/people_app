class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.date :birthdate
      t.integer :num_of_drinks
      t.string :img_url
      t.boolean :license

      t.timestamps
    end
  end
end
