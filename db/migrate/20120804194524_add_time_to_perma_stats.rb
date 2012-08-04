class AddTimeToPermaStats < ActiveRecord::Migration
  def change
    add_column :perma_stats, :time, :float, :default => 0
  end
end
