class ItemsController < ApplicationController
	before_filter :authenticate_user!, only: [:create, :new, :show]
	before_filter :check_if_admin, only: [:edit, :update, :destroy]

  # respond_to :json, :html

	def index
		@items = Item.all
		@search = @items.search(params[:q] || {})
    @items = @search.result.paginate(page: params[:page] || 1, per_page: 10).order(id: :desc)
	end

	def show
    # raise "exception test!"
		@item = Item.find(params[:id])
	rescue ActiveRecord::RecordNotFound
    flash[:danger] = 'Item does not exist!'
    redirect_to items_path
	end

  def edit
    @item = Item.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:danger] = 'Item does not exist!'
    redirect_to items_path
  end

  def update
    @item = Item.find(params[:id])
    if @item.update_attributes(item_params)
      flash[:success] = 'Item updated'
      redirect_to item_path(@item)
    else
      render 'edit'
    end
  end

	def new
    @item = current_user.items.new
    # @item.avatar = params[:file]
  end

  def create
    @item = current_user.items.new(item_params)
    # @item.avatars = params[:item]
    if @item.save
      # @item.avatars[0].url
      # @item.avatars[0].current_path
      # @item.avatars[0].identifier
      redirect_to item_path(@item)
    else
      render 'new'
    end
  end

  def destroy
    # respond_with Item.destroy params[:id]
    # @item = Item.find(params[:id])
    Item.find(params[:id]).destroy
    render json: { success: true }
    # ItemsMailer.item_destroyed(@item).deliver
    # flash[:success] = 'Item deleted'
    # redirect_to items_path
  end

	def upvote
    @item.increment!(:votes_count)
    redirect_to items_path
  end

  def expensive
    @items = Item.where("price > 1000")
    render 'index'
  end

	private

	def item_params
		params.require(:item).permit(:name, :price, :description, {avatars: []})
	end

end
