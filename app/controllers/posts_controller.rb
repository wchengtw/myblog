class PostsController < ApplicationController

before_action :authenticate_user!, only: [:edit, :update, :destroy]

end
