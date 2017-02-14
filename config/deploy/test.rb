set :stage, :test

set :profile, "test"

set :deploy_to, "/opt/myWebService"

set :server_name, "43.241.234.241"

set :branch, "master"

set :app_pid, "#{shared_path}/tmp/pids/appliction.pid"

server fetch(:server_name), user: 'root', roles: %w{web app}
