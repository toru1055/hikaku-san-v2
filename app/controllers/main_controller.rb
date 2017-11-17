require "browser"

class MainController < ApplicationController
  def index
    @tables = Table.where(active: true)
    @html_meta_desription = "「比較さん」は、あらゆる製品を比較する、比較情報マガジンです。"
    @html_title_footer = " | あらゆる製品を比較する、比較情報マガジン"
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
      @html_meta_image_src = @table.hero_image
    else
      render :template => 'main/error'
    end
  end
end
