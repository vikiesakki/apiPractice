module Api
	class DepartmentController < ActionController::API

		 include Swagger::Docs::ImpotentMethods

		swagger_controller :department, "Department"

		swagger_api :index do 
			summary "This api will give the list of all departments"
			param :query,:page,:integer,:optional,"Page Number" 
			response :unauthorized
			response :not_acceptable
		end

		swagger_api :show do 
			summary "This api will give the list of all departments"
			param :path,:id,:integer,:required,"Department Id" 
			response :unauthorized
			response :not_acceptable
		end

		swagger_api :create do 
			summary "This will create the departments"
			param :form,:name,:string,:required,"Department Name" 
			param :form,:created_by,:string,:required,"Created User Name"
			response :unauthorized
			response :not_acceptable
		end

		swagger_api :update do 
			summary "This will Update the department"
			param :path,:id,:integer,:required,"Department Id"
			param :form,:name,:string,:required,"Department Name" 
			param :form,:created_by,:string,:required,"Created User Name"
			response :unauthorized
			response :not_acceptable
		end

		swagger_api :destroy do 
			summary "This will Delete the department"
			param :path,:id,:integer,:required,"Department Id"
			response :unauthorized
			response :not_acceptable
		end

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
end