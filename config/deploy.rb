set :application, "trajet_colle"
set :scm, :git
set :repository,  "git@github.com:zeke/trajet_colle.git"
set :user, "root"
# set :scm_passphrase, "secret"
set :deploy_to, "/var/www/#{application}"
set :use_sudo, false
set :branch, "master"
set :deploy_via, :remote_cache

ssh_options[:forward_agent] = true
default_run_options[:pty] = true

role :app, "209.20.73.226"
role :web, "209.20.73.226"
role :db,  "209.20.73.226", :primary => true

namespace :deploy do
  desc "Restarting passenger with restart.txt"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "chmod 0777 #{current_path}/tmp"
    # run "mkdir -p #{current_path}/log"
    # run "touch #{current_path}/log/production.log"
    # run "chmod 0666 #{current_path}/log/production.log"
    run "export LD_LIBRARY_PATH=/usr/local/lib"

    %w{files}.each do |share|
      run "rm -rf #{release_path}/public/#{share}"
      run "mkdir -p #{shared_path}/system/#{share}"
      run "chmod 0777 #{shared_path}/system/#{share}"
      run "ln -nfs #{shared_path}/system/#{share} #{release_path}/public/#{share}"
    end
    
    run "touch #{current_path}/tmp/restart.txt"
  end

  [:start, :stop].each do |t|
    desc "#{t} task is a no-op with passenger"
    task t, :roles => :app do ; end
  end
  
  task :after_update_code do
     run "cp #{shared_path}/secrets.rb #{release_path}/config/secrets.rb"
  end
  
  task :tail_log, :roles => :app do
    sudo "tail -f #{shared_path}/log/#{rails_env}.log"
  end
  
end