Impression.class_eval do 

	def key
		[impressionable_type, impressionable_id].join(" ").parameterize
	end

	def self.for_date(date)
		impressions = Impression.where("DATE(created_at) in (?)", date).all
		pages = {}
		impressions.each do |impression|
      if pages[impression.key]
        pages[impression.key][:count] = pages[impression.key][:count] + 1
        pages[impression.key][:source_info] << impression.source_info
      else
        pages[impression.key] = {count: 1, source_info: [impression.source_info], name: impression.name}
      end
    end
    pages.sort_by { |k, v| v[:count] }.reverse
	end

	def source_info
		{
			referrer: referrer,
			country: GeoIP.new(File.join(File.dirname(__FILE__), "../../vendor/GeoIP.dat")).country(ip_address).country_name
		}
	end

	def name
		impressionable.try(:name)
	end
	
end