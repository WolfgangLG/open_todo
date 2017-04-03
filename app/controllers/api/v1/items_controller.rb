class Api::V1::ItemsController < Api::V1::BaseController
  #  before_action :authenticate_user, except: [:index, :show]
  #  before_action :authorize_user, except: [:index, :show]

   def index
     items = Item.all
     render json: items, status: 200
   end

   def show
     item = Item.find(params[:id])
     render json: item, status: 200
   end
 end
