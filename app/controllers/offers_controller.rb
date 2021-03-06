class OffersController < ApplicationController

skip_before_action :verify_authenticity_token

before_filter :admin, :only => [:destroy, :new, :edit, :update, :create]

before_action :admin, :only => [:destroy, :new, :edit, :update, :create]


  def new
    $principal = Principal.find(params[:id])
    @offer = $principal.offers.new
  end

  def create

    @offer = Offer.new(offer_params)
  #  @id=@offer.principal_id

    respond_to do |format|
      if @offer.save
# REDIRECT IF ID
        if (@offer.principal_id== 1 || @offer.principal_id==2)
           format.html { redirect_to "/#weiterbildung"}
           format.json { head :no_content }
        else
           format.html { redirect_to "/#aktivierung"}
           format.json { head :no_content }
        end
      else
        flash.now[:error] = "Something was wrong creating this offer"
        format.html { render :controller =>'offers', :action=>'new', :id=>$principal }
        format.json { render json: @offer.errors, status: :unprocessable_entity }

      end
    end
  end


  def edit
     @offer = Offer.find(params[:id])
  end


  def update
    @offer = Offer.find(params[:id])

    respond_to do |format|
      if @offer.update_attributes(offer_params)
        if (@offer.principal_id== 1 || @offer.principal_id==2)
           format.html { redirect_to "/#weiterbildung"}
           format.json { head :no_content }
        else
           format.html { redirect_to "/#aktivierung"}
           format.json { head :no_content }
        end
      else
        flash.now[:error] = "Something was wrong updating this offer"
        format.html { render action: "edit" }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @offer = Offer.find(params[:id])
    @idd = @offer.principal_id
    @offer.destroy

    if (@idd== 1 || @idd==2)
        redirect_to "/#weiterbildung"
    else
        redirect_to "/#aktivierung"
    end


  end



  private

  #  before_filter :admin, :only => [:destroy, :new, :edit, :update, :create]

    def admin
       redirect_to "/index.html" unless !current_user.nil? && (current_user.id==1 || current_user.id==4)
    end


    def offer_params
      params.require(:offer).permit(:title, :document, :principal_id)
    end

end
