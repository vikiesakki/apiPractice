class DepartmentController < ApplicationController

	#http_basic_authenticate_with name: "admin", password: "123"

	def index
		data = Department.all
		render :json => data
	end

	def show
		data = Department.find_by_id(params[:id])
		if data
			render :json => data
		else
			render :json => {errors: "Coudn't find the department"} ,:status=>404
		end
	end

	def create
		data = Department.new(allowed_params)
		if data.save
			render :json => data
		else
			render :json =>{ errors: data.errors } ,:status=>404
		end
	end

	def update
		department = Department.find_by_id(params[:id])
		begin department.update_attributes(allowed_params)
			render :json => department
		rescue
			render :json => department,:status=>404
		end
	end

	def destroy
		department = Department.find_by_id(params[:id])
		if (not department.nil?) and department.destroy
			render :json => {}
		else
			render :json => {},:status=>404
		end
	end

	private 

	def allowed_params
		params.permit(:name,:created_by)
	end

end
