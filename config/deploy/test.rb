set :stage, :test

set :profile, "test"

set :deploy_to, "/mnt/myWebService"

set :server_name, "139.129.12.185"

set :branch, "master"

set :app_pid, "#{shared_path}/tmp/pids/appliction.pid"

server fetch(:server_name), user: 'root', roles: %w{web app}
