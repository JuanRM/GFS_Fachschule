class Offer < ActiveRecord::Base

  belongs_to :principal, :foreign_key=>'principal_id'

  has_attached_file :document
validates_attachment :document, :content_type => { :content_type => %w(application/doc application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document application/vnd.oasis.opendocument.text application/x-vnd.oasis.opendocument.text) }
validates_attachment_content_type :document, :content_type => ['application/txt', 'text/plain',
'application/pdf', 'application/msword',
'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
'application/vnd.oasis.opendocument.text',
'application/x-vnd.oasis.opendocument.text',
'application/rtf', 'application/x-rtf', 'text/rtf', 
'text/richtext', 'application/doc', 'application/docx', 'application/x-soffice', 'application/octet-stream']

 validates :title, 
   :length => { :minimum => 3, :message => " ERROR, title must have more than 3 characters" }

end

