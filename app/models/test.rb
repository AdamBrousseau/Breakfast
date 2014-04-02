class Test < ActiveRecord::Base
	belongs_to :phr
	default_scope -> { order('created_at DESC') }
	#specify that test is a paperclip file attachment
	has_attached_file :test, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

	validates :date, presence: true
	validates :phr_id, presence: true
	validates :name, presence: true, length: { maximum: 30 }
	validates :comments, length: { maximum: 1000 }
	validates_attachment_content_type :test, :content_type => /\Aimage\/.*\Z/
end
