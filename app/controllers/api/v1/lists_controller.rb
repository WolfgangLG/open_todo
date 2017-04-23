class Api::V1::ListsController < Api::V1::BaseController
  before_action :authenticated?
  before_action :set_user
  before_action :authorize_user, only: [:update, :destroy]

  def create
    list = @user.lists.new(list_params)
    if list.valid?
      list.save!
      render json: list, status: 200
    else
      render json: { errors: list.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def index
    lists = @user.lists.all
    render json: lists, each_serializer: ListSerializer, status: 200
  end

  def show
    list = List.find(params[:id])
    render json: list, status: 200
  end


  def update
    list = List.find(params[:id])
    if list.update(list_params)
      render json: list
    else
      render json: { errors: list.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
     begin
       list = List.find(params[:id])
       list.destroy
       render json: {}, status: :success
     rescue ActiveRecord::RecordNotFound
       render :json => {}, :status => :not_found
     end
   end

  private

  def authorize_user
    list = List.find(params[:id])
    unless authenticated? == list.user
      render json: { error: "Not Authorized", status: 403 }, status: 403
    end
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def list_params
    params.require(:list).permit(:title, :description, :permission, :user_id)
  end
end
