class UsersController < ApplicationController
  before_action :authorized, only: [:persist, :like_palette, :unlike_palette]

  def index
    users = User.all
  
    render json: users
  end

  def create
    @user = User.create(user_params)

    if @user.valid?
      @token = encode_token(user_id: @user.id)
      render json: { user: UserSerializer.new(@user),  token: @token }, status: :created
    else
      render json: { error: 'Uh oh! Something went wrong.. please try again.' }, status: :not_acceptable
    end
  end

  def login
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      wristband = encode_token({user_id: @user.id})
      render json: { user: UserSerializer.new(@user), token: wristband }, status: :accepted
    else
      render json: {error: "Hm... looks like those credentials don't match."}, status: :unauthorized
    end
  end

  def persist
    wristband = encode_token({user_id: @user.id})
    render json: { user: UserSerializer.new(@user), token: wristband }
  end

  def like_palette
    found_palette = Palette.find(liked_palette_params[:id])

    @user.add_like(found_palette)

    render json: found_palette, status: 200
  end

  def unlike_palette
    found_palette = Palette.find(liked_palette_params[:id])

    @user.remove_like(found_palette)

    render json: found_palette, serializer: UserPalettesSerializer, status: 200
  end

  private
  def user_params
    params.permit(:username, :password)
  end

  def liked_palette_params
    params.permit(:id)
  end

end
