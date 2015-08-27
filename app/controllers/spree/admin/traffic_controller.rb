module Spree
  module Admin
    class TrafficController < Spree::Admin::BaseController

      def index
      	@pages = Impression.for_date(params[:date] || Date.today)
      end

      def trend
      	date = (params[:date].present? && Date.parse(params[:date])) || Date.today
		    dates = ((date - 30.days)..date).to_a
		    impressions = Impression.select([:created_at]).where(user_id: nil).where("DATE(created_at) in (?)", dates).all
		    arr = []
		    dates.each do |date|
		      arr << impressions.select {|i| i.created_at.to_date == date }.count
		    end
		    render json: {
		      labels: dates.collect { |d| d.strftime("%d-%m") },
		      datasets: [
		        {data: arr}
		      ]
		    }
      end

    end
  end
end
