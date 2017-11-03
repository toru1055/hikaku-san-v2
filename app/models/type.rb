class Type < ApplicationRecord
  has_many :columns, :dependent => :destroy
end
