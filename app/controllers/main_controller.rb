require "browser"

class MainController < ApplicationController
  def index
    @tables = Table.where(active: true)
  end

  def product
    table_id = params[:table_id]
    @is_preview = params[:preview] == 'on'
    @table = Table.find(table_id)
    @active_items = @table.items.where("active = ?", true).order(:id)
    @per_page = 6
    if browser.device.mobile?
      @per_page = 3
    end
    if @table.active? || @is_preview
      @html_title = @table.title + " | "
      @html_meta_desription = @table.description
    else
      render :template => 'main/error'
    end
  end
end
