class Contact < ActiveRecord::Base

 validates :title, 
   :length => { :in => 4..30, :message => " ERROR, title must have between 4 and 30 characters" }

end
