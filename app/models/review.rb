class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie

	def date_published
      created_at.localtime.strftime("%A, %B %-d, %Y at %l:%M %p")
    end

end
