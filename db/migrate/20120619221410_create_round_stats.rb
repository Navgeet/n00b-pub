class CreateRoundStats < ActiveRecord::Migration
  def change
    create_table :round_stats do |t|
      t.string :name
      t.string :setinfo_pass
      t.integer :kills
      t.integer :deaths
      t.integer :hits
      t.integer :shots
      t.integer :headshots
    end
  end
end
