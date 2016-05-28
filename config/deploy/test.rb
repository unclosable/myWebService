

set :stage, :test

set :profile, "test"

set :deploy_to, "/data/www/messages"

set :server_name, "10.3.47.62"

set :branch, "master"

set :app_pid, "#{shared_path}/tmp/pids/appliction.pid"

server fetch(:server_name), user: 'deploy', roles: %w{web app}
