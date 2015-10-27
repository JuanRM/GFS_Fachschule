class ProjectsController < ApplicationController

skip_before_action :verify_authenticity_token
 
before_filter :admin, :only => [:destroy, :new, :edit, :update, :create]

before_action :admin, :only => [:destroy, :new, :edit, :update, :create]


  def index
     @project = Project.all
  end


  def show
     @project = Project.find(params[:id])
     @projects = Project.all
     @photos = Photo.where(project_id: @project.id)
#     @photomax = Photo.where(project_id: @project.id).maximum("num")
#     @last=@photomax
  end


  def new
     @project = Project.new
  end


  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save

        if params[:images]
          #===== The magic is here ;)
          params[:images].each { |image|
            @project.photos.create(image: image)
          }
        end 
#####################################
# no a "/index.html#projects"
        format.html { redirect_to "/#projekte"}

        format.json { render :show, status: :created, location: @project }
      else
        flash.now[:error] = "Something was wrong creating this project"
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end


  def edit
     @project = Project.find(params[:id])
   #  @photos = Photo.where(project_id: @project.id)
     @photos = Photo.where(project_id: @project.id)#.order("num ASC, id ASC")
 #    @photomax = Photo.where(project_id: @project.id).maximum("num")
  end


  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(project_params)

        if params[:images]
          #===== The magic is here ;)
          params[:images].each { |image|
            @project.photos.create(image: image)
          }
        end 

 #<a href="/index.html/<%=proj.id%>#projekte" class="titleprojectsactiv"><%=proj.title1.upcase%></a>
 #    redirect_to :controller => 'static', :action => 'index', :id => @project.id
#        format.html { redirect_to "/index.html/"@project.id"#projekte"}
        format.html { redirect_to "/#projekte"}
#        format.html { redirect_to @project}
        format.json { head :no_content }
      else

        flash.now[:error] = "Something was wrong updating this project"
        format.html { render action: "edit"}
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    redirect_to "/index.html#projekte"
  end


  def deletephoto
    @photo = Photo.find(params[:id])
    @idd = @photo.project_id
    @photo.destroy

    redirect_to :action=>"edit", :id=>@idd

  end


  private

    def admin
       redirect_to "/index.html" unless !current_user.nil? && (current_user.id==1 || current_user.id==4)
    end

    def project_params
      params.require(:project).permit(:title1, :title2, :content)
    end

end
