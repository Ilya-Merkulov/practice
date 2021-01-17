class UsersController < ApplicationController

  def index

    if params[:city].blank?
        @users = User.all.ordered_by_created_time.with_city.page(params[:page])
    else
      @city_id = City.find_by(name: params[:city]).id
      @users = User.where(:city_id => @city_id).ordered_by_created_time.with_city.page(params[:page])
        #@users = @users.where(city_id: params[:city_id])
    end

      @cities = City.all
    
  end

  def show
    load_user
     @review = @user.review
  end

  def new
    #load_cities
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to @user
  end

  def edit
    #load_cities
    load_user
  end

  def update
    load_user
    @user.update(user_params)
    redirect_to :user
  end

  def destroy
    load_user
    @user.destroy
    redirect_to :users
  end

private

  def user_params
    params.require(:user).permit(:name, :age, :phone_number, :login, :password, :city_id)
  end

  def load_user
    @user = User.find(params[:id])
  end

  #def load_cities
  #  @cities = City.all
  #end


end
