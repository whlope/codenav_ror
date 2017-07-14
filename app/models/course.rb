class Course < ApplicationRecord
	has_many :task, dependent: :destroy
end
