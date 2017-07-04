 
Swagger::Docs::Config.register_apis({
  "1.0" => {
    # the extension used for the API
    # the output location where your .json files are written to
    :api_file_path => "public/api/",
    :base_path => "http://localhost:3000/api",
    :clean_directory => true,
    # if you want to delete all .json files at each generation
    # Ability to setup base controller for each api version. Api::V1::SomeController for example.
    # add custom attributes to api-docs
    :attributes => {
      :info => {
        "title" => "Api Practice Sample App",
        "description" => "This is a sample description.",
      }
    }
  }
})