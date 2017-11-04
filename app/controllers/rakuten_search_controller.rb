class RakutenSearchController < ApplicationController
  def index
    @table = Table.find(params[:table_id])
    @rws_keyword = params[:keyword]
    @rws_genre_id = params[:genreId]
    @rws_min_price = params[:minPrice]
    @rws_max_price = params[:maxPrice]
    @rws_page = params[:page]
    @r_items = {}
    if @rws_keyword != nil && @rws_keyword.length > 0
      @r_items = RakutenWebService::Ichiba::Product.search(
        keyword: @rws_keyword,
        genreId: @rws_genre_id,
        minPrice: @rws_min_price,
        maxPrice: @rws_max_price,
        hits: 10
      ).page(@rws_page)
    end
    if params[:submit_create] != nil
      puts "======= Create product items ======="
      @r_items.each do |product|
        item = convert_item(product, @table)
        if !item.save
          notice = "Error at creating items."
          break
        end
      end
      notice = "Creating items was succeeded."
    end
  end

  def create
  end

  def convert_item(p, table)
    Item.new(
      name: p.name,
      description: p.caption,
      price: p.used_exclude_sales_min_price,
      main_image: p.medium_image_url.gsub(/\?_ex=128x128$/, '').gsub(/http:/, 'https:'),
      table_id: table.id,
      active: false,
      rakuten_url: p.url_pc
    )
  end


end
