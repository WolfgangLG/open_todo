class Api::V1::UsersController < Api::V1::BaseController
   before_action :authenticated?

   def index
     users = User.all
     render json: users, each_serializer: UserSerializer, status: 200
   end

   def show
     user = User.find(params[:id])
     render json: user, status: 200
   end
 end
