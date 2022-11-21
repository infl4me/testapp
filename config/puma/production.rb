# frozen_string_literal: true

rails_env = 'production'
environment rails_env

app_dir = '/var/www/testapp'

bind "unix://#{app_dir}/shared/puma.sock"
pidfile "#{app_dir}/shared/puma.pid"
state_path "#{app_dir}/shared/puma.state"
directory "#{app_dir}/current/"

stdout_redirect "#{app_dir}/shared/log/puma.stdout.log", "#{app_dir}/shared/log/puma.stderr.log", true

workers 2
threads 1, 2

activate_control_app "unix://#{app_dir}/shared/pumactl.sock"

prune_bundler
