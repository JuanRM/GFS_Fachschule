class Principal < ActiveRecord::Base

  has_many :offers, :foreign_key=>'principal_id'

 validates :title, 
   :length => { :in => 4..40, :message => " ERROR, title must be between 4 y 40 characters" }

end
