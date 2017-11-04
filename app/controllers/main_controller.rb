class MainController < ApplicationController
  def index
    @tables = Table.where(active: true)
  end

  def product
    table_id = params[:table_id]
    @table = Table.find(table_id)
    if @table.active?
      @html_title = @table.title + " | "
      @html_meta_desription = @table.description
    else
      render :template => 'main/error'
    end
  end
end
