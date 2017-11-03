class Table < ApplicationRecord
  has_many :columns, :dependent => :destroy
  has_many :items, :dependent => :destroy
  has_many :elements, :dependent => :destroy
end
