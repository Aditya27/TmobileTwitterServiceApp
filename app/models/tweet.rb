class Tweet < ActiveRecord::Base
	belongs_to :user

	validates :user_id, presence: true
	validates :body, presence: true, length: { maximum: 140 }

	before_create :post_to_twitter

	def post_to_twitter
		user.twitter.update(body)
	end
end
