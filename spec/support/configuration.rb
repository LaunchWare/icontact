IContact.configure do |config|
  config.mode = :sandbox
  config.app_id = ENV["icontact_app_id"]
  config.user_name = ENV["icontact_user_name"]
  config.password = ENV["icontact_password"]
  config.account_id = ENV["icontact_account_id"]
  config.client_folder_id = ENV["icontact_client_folder_id"]
end

