class Item < ApplicationRecord
  belongs_to :table
  has_many :elements, :dependent => :destroy

  def element_value(column)
    element = elements.where(column_id: column.id).first
    if element
      element.value
    else
      nil
    end
  end

  def formatted_price
    if price != nil && price.integer?
      return price.to_s(:delimited)
    else
      return '---'
    end
  end
end
