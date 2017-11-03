class MainController < ApplicationController
  def index
  end

  def product
    table_id = params[:table_id]
    @table = Table.find(table_id)
  end
end
