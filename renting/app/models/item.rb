class Item < ApplicationRecord
paginates_per 2
has_many :review, as: :commet
has_many :booking
belongs_to :user

scope :ordered_by_created_time, -> { order(created_at: :desc) }
#belongs_to :city
end
