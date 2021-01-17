class Review < ApplicationRecord
belongs_to :commet, polymorphic: true
end
