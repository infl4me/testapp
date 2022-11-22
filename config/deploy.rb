# frozen_string_literal: true

# config valid for current version and patch releases of Capistrano
lock '~> 3.17.1'

set :application, 'testapp'

set :repo_url, 'git@github.com:infl4me/testapp.git'

set :rvm_ruby_version, 'ruby-2.7.6'
set :default_env, { rvm_bin_path: '/usr/share/rvm/bin/rvm' }

set :branch, 'main'

set :master_key_local_path, '/home/udf/projects/testapp/config/master.key'
