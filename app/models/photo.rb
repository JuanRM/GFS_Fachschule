class Photo < ActiveRecord::Base

 belongs_to :project

 has_attached_file :image, :styles => { :medium => "425x425>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

#  has_attached_file :image,
#    :path => ":rails_root/public/images/:id/:filename",
#    :url  => "/images/:id/:filename"

#  do_not_validate_attachment_file_type :photo

end
