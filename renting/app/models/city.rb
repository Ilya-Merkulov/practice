class City < ApplicationRecord
has_many :user, dependent: :nullify
end
