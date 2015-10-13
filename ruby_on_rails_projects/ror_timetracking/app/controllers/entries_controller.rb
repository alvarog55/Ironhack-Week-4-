class EntriesController < ApplicationController
	def new
		@project = Project.find(params[:project_id])
		@entry = Entry.new
	end

	def update
		@entry = Entry.find(params[:id])
		project = @entry.project
		if @entry.update(entry_params)
			redirect_to project_path(project)
		else
			render :edit
		end
	end

	def create 
		id = params[:project_id]
		@entry = Entry.new(entry_params)
		@entry.project_id = id

		if @entry.save
			redirect_to project_path(id)
		else
			render :new
		end
	end

	def edit
		@entry = Entry.find(params[:id])
	end

	def destroy
		entry = Entry.find(params[:id])
		entry.destroy
		redirect_to project_path(entry.project)

	end

	private

	def entry_params
		params.require(:entry).permit(:minutes, :hours, :start_date, :comment)
	end
end
