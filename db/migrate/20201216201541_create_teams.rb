class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|
      t.string :city
      t.string :name
      t.string :coach
      t.integer :user_id
      t.integer :league_id

      t.timestamps
    end
  end
end