class CreateRoundStats < ActiveRecord::Migration
  def change
    create_table :round_stats do |t|
      t.string :name
      t.string :setinfo_pass
      t.integer :kills    , :default => 0 
      t.integer :deaths   , :default => 0 
      t.integer :hits     , :default => 0 
      t.integer :shots    , :default => 0 
      t.integer :headshots, :default => 0
      t.integer :team   , :default => 3 
    end
  end
end
