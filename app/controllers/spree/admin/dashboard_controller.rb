module Spree
	module Admin
		class DashboardController < Spree::Admin::BaseController

			def index
				
			end

			def data_dashboard
				from = (params[:from].present? && Date.parse(params[:from])) || (Date.today-6.days)
				to = (params[:to].present? && Date.parse(params[:to])) || Date.today
				if from>to
					to = from+6.days
				end
				dates = (from..to).to_a
				#date =  Date.today
				#dates = ((date-6.days)..date).to_a
				orders = Spree::Order.select([:created_at]).where("DATE(created_at) in (?)", dates).all
				arr = []
				dates.each do |date|
					arr << orders.select {|o| o.created_at.to_date == date}.count
				end
				render json: {
					labels: dates.collect { |d| d.strftime("%d-%m-%y") },
				    datasets: [{
				    	data: arr

				    }]
				}
				
			end 

			def data_dashboard_pie
				states = Spree::Address.select(:state_id).group(:state_id).count
				order_count = states.values
				state_names = []
				states.each do |s,c|
					state_names << Spree::State.find(s).name
				end
				render json:{
						labels: state_names,
						datasets:[
							{data: order_count}
						]
						
				}
			end

		end
	end
end