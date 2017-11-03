class Column < ApplicationRecord
  belongs_to :type
  belongs_to :table
  has_many :elements, :dependent => :destroy
end
