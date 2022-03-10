class Badge < ApplicationRecord
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  enum type: { all_categories: 0, all_levels: 1, first_try: 2 }
end
