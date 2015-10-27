class PrincipalsController < ApplicationController

  skip_before_action :verify_authenticity_token

  before_action :admin, :only => [:edit, :update]


  def edit
    @principal = Principal.find(params[:id])
  end


  def update
    @principal = Principal.find(params[:id])

    respond_to do |format|
      if @principal.update_attributes(principal_params)
        if (@principal.id== 1 || @principal.id==2)
           format.html { redirect_to "/#weiterbildung"}
           format.json { head :no_content }
        else
           format.html { redirect_to "/#aktivierung"}
           format.json { head :no_content }
        end
      else
        flash.now[:error] = "Something was wrong editing this title"
        format.html { render action: "edit" }
        format.json { render json: @principal.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def admin
       redirect_to "/index.html" unless !current_user.nil? && (current_user.id==1 || current_user.id==4)
    end

    def principal_params
      params.require(:principal).permit(:title, :info)
    end

end
