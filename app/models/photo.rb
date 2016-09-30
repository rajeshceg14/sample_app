class Photo < ActiveRecord::Base
  MAX_UPLOAD_SIZE = 2
  #include Paperclip::Glue
  attr_accessible :url
  validates :user_id, presence: true
  belongs_to :user
  has_attached_file :image, styles: { medium: "300x300#", thumb: "100x100#" }, default_url: "/images/:style/missing.png"
  validates_attachment_presence :image
  validates_attachment_content_type :image, content_type: /^image\/(png|gif|jpeg|jpg)/
  validates_attachment_size :image, :less_than => MAX_UPLOAD_SIZE.megabytes
  default_scope order: 'photos.created_at DESC'
end
