require 'mechanize'

module Commuter

	module Mapper

	  def self::map(start, dest)
		map_url = "http://maps.google.com/maps?saddr=#{start}&daddr=#{dest}"
		agent = Mechanize.new
		page = agent.get(map_url)
		times = []
		page.search("div.altroute-info span:last-child").each do |span|
			times << span.inner_html
		end
		times
	  end

	end

end