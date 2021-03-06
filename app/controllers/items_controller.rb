class ItemsController < ApplicationController
  http_basic_authenticate_with name: ENV['BASIC_AUTH_NAME'], password: ENV['BASIC_AUTH_PASS'] if Rails.env.production?
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save && create_elements(@item)
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params) && update_elements(@item)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    table = @item.table
    @item.destroy
    respond_to do |format|
      format.html { redirect_to table, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name, :title, :description, :price, :main_image, :table_id, :active, :rakuten_url)
    end

    def create_elements(item)
      item.table.columns.each do |column|
        value = params[:item][:column][column.id.to_s]
        element = Element.new(table: item.table, item: item, column: column, value: value)
        if !element.save
          return false
        end
      end
      return true
    end

    def update_elements(item)
      item.table.columns.each do |column|
        value = params[:item][:column][column.id.to_s]
        element = item.elements.where(column_id: column.id).first
        if element == nil
          element = Element.new(table: item.table, item: item, column: column, value: value)
          if !element.save
            return false
          end
        else
          if !element.update(value: value)
            return false
          end
        end
      end
      return true
    end
end
