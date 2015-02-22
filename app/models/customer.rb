class Customer < ActiveRecord::Base

 validates :first_name, presence: true, length: { minimum: 2 }
 validates :last_name, presence:true, length: {minimum: 2}

 def address
	"#{street} #{zip} #{city}"
 end

end
