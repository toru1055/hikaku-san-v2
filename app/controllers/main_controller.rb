class MainController < ApplicationController
  def index
    @tables = Table.where(active: true)
  end

  def product
    table_id = params[:table_id]
    @is_preview = params[:preview] == 'on'
    @table = Table.find(table_id)
    if @table.active? || @is_preview
      @html_title = @table.title + " | "
      @html_meta_desription = @table.description
    else
      render :template => 'main/error'
    end
  end
end
