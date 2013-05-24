module ApplicationHelper

	def quid(num)
		number_to_currency (num / 100.00), unit: "&pound"

	end



end
