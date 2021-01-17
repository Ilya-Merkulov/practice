class User < ApplicationRecord
paginates_per 2
has_many :review, as: :commet
has_many :item, dependent: :destroy
has_many :booking
belongs_to :city
scope :ordered_by_created_time, -> { order(created_at: :desc) }
scope :with_city, -> { includes(:city) }
end
