class Api::V1::UsersController < Api::V1::BaseController
  before_action :authenticated?


  def create
    user = User.new(user_params)
    if user.valid?
      user.save!
      render json: user, status: 200
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def index
    users = User.all
    render json: users, each_serializer: UserSerializer, status: 200
  end

  def show
    user = User.find(params[:id])
    render json: user, status: 200
  end

  def destroy
     begin
       user = User.find(params[:id])
       user.destroy
       render json: {}, status: :success
     rescue ActiveRecord::RecordNotFound
       render :json => {}, :status => :not_found
     end
   end

  private

  def user_params
    params.require(:user).permit(:name, :password_digest, :email)
  end
end
