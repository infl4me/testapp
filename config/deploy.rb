# frozen_string_literal: true

# config valid for current version and patch releases of Capistrano
lock '~> 3.17.1'

set :application, 'testapp'
# set :repo_url, 'git@example.com:me/my_repo.git'

set :repo_url, 'git@github.com:infl4me/testapp.git'

set :rvm_ruby_version, 'ruby-2.7.6'
set :default_env, { rvm_bin_path: '/usr/share/rvm/bin/rvm' }

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
set :branch, 'main'

set :master_key_local_path, '/home/udf/projects/testapp/config/master.key'

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", 'config/master.key'

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "tmp/webpacker", "public/system", "vendor", "storage"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure

namespace :puma do
  desc 'Restart puma'
  # task :restart, roles: :app do
  #   run "cd #{current_path} && bundle exec pumactl -S /home/deploy/apps/marytrufel/current/tmp/pids/puma.state -P /home/deploy/apps/marytrufel/current/tmp/pids/puma.pid restart"
  # end

  # task :phased_restart, roles: :app do
  #   run "cd #{current_path} && /usr/share/rvm/wrappers/ruby-2.7.6/puma -C /var/www/testapp/current/config/puma/production.rb phased-restart"
  # end

  task :phased_restart do
    on roles(:all) do |_host|
      run "cd #{current_path} && /usr/share/rvm/wrappers/ruby-2.7.6/puma -C /var/www/testapp/current/config/puma/production.rb phased-restart"
    end
  end

  after 'deploy:restart', 'puma:phased_restart'
end

# keep only the last 5 releases
# after 'deploy:restart', 'deploy:cleanup'
