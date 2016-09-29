class Photo < ActiveRecord::Base
  #include Paperclip::Glue
  attr_accessible :url
  validates :user_id, presence: true
  belongs_to :user
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
#  validates_attachment_presence :image#, content_type: { content_type: "image/jpeg"}
  validates_attachment_presence :image#, content_type: { content_type: "/^image\/(png|gif|jpeg|jpg)/"}
  validates_attachment_content_type :image, content_type: /^image\/(png|gif|jpeg|jpg)/
  default_scope order: 'photos.created_at DESC'
end
