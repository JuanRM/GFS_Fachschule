class Project < ActiveRecord::Base

 has_many :subprojects, :foreign_key=>'project_id', :dependent=>:destroy

 has_many :photos, :dependent => :destroy


 validates :title1, 
   :length => { :in => 4..25, :message => " ERROR, title1 must be between 4 y 25 characters" }

 validates :title2, 
   :length => { :maximum => 35, :message => " ERROR, title2 must has less than 35 characters" }

end
