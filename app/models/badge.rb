class Badge < ApplicationRecord
  has_many :users

  enum type: { all_categories: 0, all_levels: 1, first_try: 2 }
end
