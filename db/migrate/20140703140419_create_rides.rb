class CreateRides < ActiveRecord::Migration
  def change
    create_table :rides do |t|
      t.string :name
      t.integer :tickets
      t.integer :nausea_rating
      t.integer :happiness_rating
      t.integer :min_height
      t.belongs_to :user
      t.belongs_to :attraction
      t.timestamps null: false
    end
  end
end
