class MainController < ApplicationController
  def index
    @tables = Table.all
  end

  def product
    table_id = params[:table_id]
    @table = Table.find(table_id)
    @html_title = @table.title + " | "
    @html_meta_desription = @table.description
  end
end
