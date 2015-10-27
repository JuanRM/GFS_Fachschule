class TextsController < ApplicationController

  skip_before_action :verify_authenticity_token

  before_action :set_text, only: [:edit, :update]

  before_action :admin, :only => [:edit, :update]

 
  # GET /texts/1/edit
  def edit
  end


  # PATCH/PUT /texts/1
  # PATCH/PUT /texts/1.json
  def update
    respond_to do |format|
      if @text.update(text_params)
        if @text.id == 2
          format.html { redirect_to "/#aktivierung" }
        else 
          if @text.id==3
            format.html { redirect_to "/#partners" }
          else
            if @text.id==4 || @text.id==5 
               format.html { redirect_to "/#impressum" }
            else
               format.html { redirect_to "/" }
            end
          end
        end
        format.json { render :show, status: :ok, location: @text }
      else
        format.html { render :edit }
        format.json { render json: @text.errors, status: :unprocessable_entity }
      end
    end
  end


  private

    def admin
       redirect_to "/index.html" unless !current_user.nil? && (current_user.id==1 || current_user.id==4)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_text
      @text = Text.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def text_params
      params.require(:text).permit(:text)
    end
end
