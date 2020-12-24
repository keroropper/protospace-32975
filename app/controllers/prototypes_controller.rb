class PrototypesController < ApplicationController

before_action :set_prototype, only: [:edit, :show, :update, :destroy]
before_action :authenticate_user!, except: [:show, :index]
# before_action :move_to_index, expect: :index, only: :edit

def index
  @prototypes = Prototype.includes(:user).order("created_at DESC")
end

def new
  @prototype = Prototype.new
end

def create
  @prototype = Prototype.new(prototype_params)
  if @prototype.save
     redirect_to root_path
  else
    render :new
  end
end

def show
  @comment = Comment.new
  @comments = @prototype.comments.includes(:user) #投稿に紐づく全てのコメントを代入
end

def edit
  @prototype = Prototype.find(params[:id])
  
  unless @prototype
    redirect_to action: :index
  end
end

def update
  if @prototype.update(prototype_params)
    redirect_to prototype_path(@prototype.id)
  else
    render :edit
  end
end

def destroy
  if @prototype.destroy
    redirect_to root_path
  end
end
 

private

def prototype_params
  params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
end

def set_prototype
  @prototype = Prototype.find(params[:id])
end



end
