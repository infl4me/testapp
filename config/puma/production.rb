# frozen_string_literal: true

rails_env = 'production'
environment rails_env

app_dir = '/path/to/my/rails-app' # Update me with your root rails app path

bind "unix://#{app_dir}/puma.sock"
pidfile "#{app_dir}/puma.pid"
state_path "#{app_dir}/puma.state"
directory "#{app_dir}/"

stdout_redirect "#{app_dir}/log/puma.stdout.log", "#{app_dir}/log/puma.stderr.log", true

workers 2
threads 1, 2

activate_control_app "unix://#{app_dir}/pumactl.sock"

prune_bundler
