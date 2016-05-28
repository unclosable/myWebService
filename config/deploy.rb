
# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'messages'
set :repo_url, 'git@git.rfdoa.cn:java/messages.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, '/var/www/my_app_name'

# Default value for :scm is :git
set :scm, :git

# Default value for :format is :pretty
set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('node_modules','tmp/pids')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do

  task :restart  do
    invoke :"deploy:stop"
    invoke :"deploy:start"
  end

  task :start  do
    on roles(:web)  do
      within current_path do
        unless test("[ -f #{fetch(:app_pid)} ]")
          info ">>>>> start"
          execute :forever, 'start ./config/test.json'
        else 
          error ">>>>>> already started"
        end 

      end
    end
  end

  task :stop  do
    on roles(:web)  do
      within current_path do
        if test("[ -f #{fetch(:app_pid)} ]")
          info ">>>>> stop"
          execute :forever, 'stop messages'
        end 
      end
    end
  end



end
after "deploy:publishing", "deploy:restart"
