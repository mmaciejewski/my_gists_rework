class Gist < ActiveRecord::Base

self.per_page = 3

def self.search(search)
	if search
		find(:all, :conditions => ['description LIKE ?',"%#{search}%"])	
	else
		find(:all)
	end
end	


end
