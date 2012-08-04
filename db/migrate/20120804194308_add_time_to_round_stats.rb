class AddTimeToRoundStats < ActiveRecord::Migration
  def change
    add_column :round_stats, :time, :integer, :default => 0
  end
end
