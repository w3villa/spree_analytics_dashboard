Spree::TaxonsController.class_eval do

	after_filter :log_impression, only: [:show]

	private

		def log_impression
			impressionist(@taxon)
		end
	
end