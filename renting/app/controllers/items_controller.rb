class ItemsController < ApplicationController
  def index
      if params[:city].blank?
        #@items = Item.all.ordered_by_created_time
        @items = Item.all.ordered_by_created_time.page(params[:page])
      else
        @city_id = City.find_by(name: params[:city]).id
        @users = User.where(:city_id => @city_id)
          @number = []
          i = 0
          @users.each do |user|
            @number[i] = user.id
            i += 1
          end
        @items = Item.where(user_id: @number).ordered_by_created_time.page(params[:page])
      end



      @user = User.first
      @cities = City.all
  end

  def show
    load_item
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    @item.user = User.first

    @item.save
    redirect_to @item
  end

  def edit
    load_item
  end

  def update
    load_item
      @item.update(item_params)
    redirect_to :item
  end

  def destroy
    load_item
    @item.destroy
    redirect_to :items
  end

private

  def item_params
    params.require(:item).permit(:title, :text, :size)#, :user_id)
  end

  def load_item
    @item = Item.find(params[:id])
  end

end
