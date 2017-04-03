class Api::V1::UsersController < Api::V1::BaseController
  #  before_action :authenticate_user, except: [:index, :show]
  #  before_action :authorize_user, except: [:index, :show]

   def index
     users = User.all
     render json: topics, status: 200
   end

   def show
     user = User.find(params[:id])
     render json: user, status: 200
   end
 end
