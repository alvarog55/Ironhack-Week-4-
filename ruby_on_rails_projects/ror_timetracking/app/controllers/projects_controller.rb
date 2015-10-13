class ProjectsController < ApplicationController
	def index
		@projects = Project.last_updated(10)
	end

	def create 
		@project = Project.new(project_params)
		if @project.save
			flash[:notice] = "Project created succesfully"
			redirect_to project_path(@project)
		else
			render :new
		end
	end

	def update
		@project = Project.find(params[:id])
		if @project.update(project_params)
			flash[:notice] = "Project edited succesfully"
			redirect_to project_path(@project)
		else
			render :edit
		end
	end

	def edit
		@project = Project.find(params[:id])
	end

	def new
		@project = Project.new
		render :new
	end

	def destroy
		project = Project.find(params[:id])
		project.destroy
		redirect_to projects_path
	end

	def show
		id = params[:id]
		@project = Project.find(id)

		if @project.nil?
			render :no_project_found
		else
			@entries = @project.entries
			render :show
		end	
	end
	def project_params
		params.require(:project).permit(:title, :description)
	end
end
