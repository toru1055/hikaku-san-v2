require 'uri'

class Column < ApplicationRecord
  belongs_to :type
  belongs_to :table
  has_many :elements, :dependent => :destroy

  def reference_host
    begin
      uri = URI.parse(reference_url)
      return uri.host
    rescue => ex
      return nil
    end
  end
end
