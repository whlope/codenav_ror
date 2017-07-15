module ApplicationHelper
	def avatar_url(usr)
		gravatar_id = Digest::MD5::hexdigest(usr.email).downcase
		"https://www.gravatar.com/avatar/#{gravatar_id}.jpg?id=identicon&s=50"
	end
end
