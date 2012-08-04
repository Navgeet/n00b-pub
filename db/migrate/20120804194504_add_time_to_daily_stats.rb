class AddTimeToDailyStats < ActiveRecord::Migration
  def change
    add_column :daily_stats, :time, :integer, :default => 0
  end
end
