class PalettesController < ApplicationController
    before_action :authorized, only: [:create, :destroy]
  
    def create 
      colors = palette_params[:colors]
      colors = colors.map{|color| Color.find_or_create_by(hex: color)}
      palette = @user.palettes.create(name: palette_params[:name], colorblind_accessible: palette_params[:colorblind_accessible], max_contrast: palette_params[:max_contrast])
      colors.each {|colorObj| palette.colors << colorObj}
      

      if palette.valid?
        render json: palette
      else
        render json: {error: "Looks like you missed a few fields."}
      end
    end
  
    def index
      palettes = Palette.all
    
      render json: palettes
    end
  
    def destroy 
      palette = Palette.find_by(id: params[:id])
      palette.destroy
    end

    private

    def palette_params
      params.permit(
          :name,
          :colorblind_accessible,
          :max_contrast,
          colors: []
      )
    end
end