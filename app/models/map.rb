class Map < ActiveRecord::Base
  attr_accessible :name, :time
  validates_uniqueness_of :name, :case_sensitive => false

  # This builds up a data string to insert in Map frequency pie chart
  def self.get_pie_chart_data
    pie_data_string = ""
    all_maps = Map.all
    all_maps.each do |map|
      pie_data_string << "['#{map.name}', #{map.time}], "
    end
    return pie_data_string
  end

  def self.current_map_name
    mp = File.read("/home/nav/cs/cstrike/current_map").split(" ")
    map_name = mp[0].downcase
  end

  def self.current_map_time_started
    mp = File.read("/home/nav/cs/cstrike/current_map").split(" ")
    map_time_started = Time.local(mp[4], mp[5], mp[6], mp[1], mp[2], mp[3])
  end
end
