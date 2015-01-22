require 'capistrano-unicorn'

set :normalize_asset_timestamps, false

role :web, "devlits.com"                          # Your HTTP server, Apache/etc
role :app, "devlits.com"                          # This may be the same as your `Web` server
role :db,  "devlits.com", :primary => true        # This is where Rails migrations will run

set :user, "dev_lits"
set :repository, "https://github.com/cybdoom/lits.git"

set :branch, "stage"
set :deploy_via, :copy
set :git_shallow_clone, 1
set :keep_releases, 3
set :application, "lits"
set :scm, :git
set :deploy_to, "/var/www/devlits.com/devlits.com/docroot"
set :use_sudo, false

default_run_options[:pty] = true
set :rails_env, "staging"

after 'deploy:update_code', 'bundler:bundle_install'

after 'deploy:restart', 'unicorn:reload'    # app IS NOT preloaded
after 'deploy:restart', 'unicorn:restart'   # app preloaded
after 'deploy:restart', 'unicorn:duplicate' # before_fork hook implemented (zero downtime deployments)

namespace :bundler do
  task :bundle_install, :roles => :app do
    run "cd #{current_path} && RAILS_ENV=#{rails_env} bundle install --without test"
  end
end
