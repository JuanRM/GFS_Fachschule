class ContactsController < ApplicationController

skip_before_action :verify_authenticity_token
 
before_filter :admin, :only => [:edit, :update]


  def edit
      @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])

    respond_to do |format|
      if @contact.update_attributes(contact_params)
        format.html { redirect_to "/index.html#kontakte"}
#        format.html { redirect_to @project, notice: 'Project successfully modificated.' }
        format.json { head :no_content }
      else
        flash.now[:error] = "Something was wrong updating this contact"
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def admin
       redirect_to "/index.html" unless !current_user.nil? && (current_user.id==1 || current_user.id==4)
    end

    def contact_params
      params.require(:contact).permit(:title, :direc1, :direct2, :tel1, :tel2, :fax, :email, :cp, :city)
    end

end
