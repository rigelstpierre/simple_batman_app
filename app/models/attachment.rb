class Attachment < ActiveRecord::Base
  include Rails.application.routes.url_helpers

  attr_accessible :file, :post_id
  belongs_to :post

  mount_uploader :file, FileUploader

  #one convenient method to pass jq_upload the necessary information
  def to_jq_upload
  {
    "id" => read_attribute(:id),
    "name" => read_attribute(:file),
    "size" => file.size,
    "url" => file.url,
    "delete_url" => attachment_path(:id => id),
    "delete_type" => "DELETE"
   }
  end
end
