class SubprojectsController < ApplicationController

skip_before_action :verify_authenticity_token
 
before_filter :admin, :only => [:destroy, :new, :edit, :update, :create]

before_action :admin, :only => [:destroy, :new, :edit, :update, :create]


  def show
     @subproject = Subproject.find(params[:id])
     @projects = Project.all
     @photos = Picture.where(subproject_id: @subproject.id)#.order("num ASC, id ASC")
#     @photomax = Picture.where(subproject_id: @subproject.id).maximum("num")
#     @last=@photomax

  end


  def new
    $project = Project.find(params[:id])
    @subproject = $project.subprojects.new

  end


  def create
    @subproject = Subproject.new(subproject_params)

    respond_to do |format|
      if @subproject.save

        if params[:images]
          #===== The magic is here ;)
          params[:images].each { |image|
            @subproject.pictures.create(image: image)
          }
        end 
#####################################
        format.html { redirect_to @subproject }
        format.json { render :show, status: :created, location: @subproject }
      else
        flash.now[:error] = "Something was wrong creating this subproject"
        format.html { render :controller =>'subprojects', :action=>'new', :id=>$project}
        format.json { render json: @subproject.errors, status: :unprocessable_entity }
      end
    end
  end


  def edit
    @subproject = Subproject.find(params[:id])
    @photos = Picture.where(subproject_id: @subproject.id)#.order("num ASC, id ASC")
#    @photomax = Picture.where(subproject_id: @subproject.id).maximum("num")
  end


  def update
    @subproject = Subproject.find(params[:id])

    respond_to do |format|
      if @subproject.update_attributes(subproject_params)


        if params[:images]
          #===== The magic is here ;)
          params[:images].each { |image|
            @subproject.pictures.create(image: image)
          }
        end 

########################################################
        format.html { redirect_to @subproject }
        format.json { head :no_content }

      else
        flash.now[:error] = "Something was wrong updating this subproject"
        format.html { render action: "edit" }
        format.json { render json: @subproject.errors, status: :unprocessable_entity }
#########################################################
      end
    end
  end


  def destroy
    @subproject = Subproject.find(params[:id])
    @subproject.destroy

    redirect_to "/index.html#projekte"
  end


  def deletepicture
    @photo = Picture.find(params[:id])
    @idd = @photo.subproject_id
    @photo.destroy

    redirect_to :action=>"edit", :id=>@idd
#turbolinks: false
#:turbolinks=>false
  end


 private

    def admin
       redirect_to "/index.html" unless !current_user.nil? && (current_user.id==1 || current_user.id==4)
    end

    def subproject_params
      params.require(:subproject).permit(:project_id, :title1, :title2, :content)
#      params.require(:subproject).permit(:project_id, :title1, :title2, :content, :photo)
    end

end
