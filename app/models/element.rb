class Element < ApplicationRecord
  belongs_to :table
  belongs_to :item
  belongs_to :column
end
