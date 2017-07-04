require 'rails_helper.rb'

RSpec.describe 'Department API', type: :request do

	let!(:department) { create(:department)}
	let(:department_id) { department.id }
	let(:sample_id) { 100 }
	# before(:each) do 
	# 	http_auth
	# end
	describe 'GET /department' do
		before{ get '/department'}
		it "returns All departments " do 
			expect(json_parser(response.body)).not_to be_empty
		end
		it "returns status code 200" do
			expect(response).to have_http_status(200)
		end
	end

	describe 'GET /department/:id' do
		
		context "When Record Exists" do
			before { get "/department/#{department_id}"}
			it "returns Department for particular id" do
				expect(json_parser(response.body)).not_to be_empty
				expect(json_parser(response.body)['id']).to eq(department_id)
			end
			it "returns status code 200" do 
				expect(response).to have_http_status(200)
			end
		end

		context "When record Not exists" do
			
			before { get "/department/#{sample_id}"}
			it "returns 404 status code" do
				expect(response).to have_http_status(404)
			end
			it "returns not found message" do
				expect(response.body).to match(/Coudn't find the department/)
			end
		end

	end

	describe 'POST /department' do
		let(:department_attribute) {{:name=>'viki',:created_by=>'selvam'}}
		context "When the request is vald" do
			before{ post '/department', params: department_attribute}
			it "creates a Department" do
				expect(json_parser(response.body)['name']).to eq('viki')
			end
			it "returns the code 200" do
				expect(response).to have_http_status(200)
			end
		end
		context "When the invalid Request" do 
			before { post '/department', params: {name: "viki"}}
			it "Returns the status code 404" do 
				expect(response).to have_http_status(404)
			end
			it "returns a validation failure message" do
				expect(json_parser(response.body)['errors']['created_by'].to_s).to match(/can't be blank/)
			end
		end
	end

	describe 'PUT /department/:id' do
		
		context "When successful updation " do 
			before { put "/department/#{department_id}",params:{name: "velan"}}
			it "returns the updated value" do 
				expect(json_parser(response.body)['name']).to eq("velan")
			end

			it "returns the code 204" do
				expect(response).to have_http_status(200)
			end
		end
		context "When the record id not there" do 
			before { put "/department/#{sample_id}",params:{name: "velan"}}

			it "returns the code 404" do
				expect(response).to have_http_status(404)
			end
		end
	end

	describe 'DELETE /department/:id' do
		
		context "When delete the record" do
			before { delete "/department/#{department_id}"}
			it "returns the status code " do 
			 	expect(response).to have_http_status(200)
			end
		end
		context "When id is not found" do
			before { delete "/department/#{sample_id}"}
			it "returns the status code 404 " do 
			 	expect(response).to have_http_status(404)
			end
		end
	end
end