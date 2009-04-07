set :application, "trajet_colle"
set :scm, :git
set :repository,  "git@github.com:zeke/trajet_colle.git"
set :user, "root"
set :deploy_to, "/var/www/#{application}"
set :use_sudo, false
set :branch, "master"
set :deploy_via, :remote_cache

ssh_options[:forward_agent] = true

role :app, "209.20.73.226"
role :web, "209.20.73.226"
role :db,  "209.20.73.226", :primary => true

namespace :deploy do
  desc "Restarting passenger with restart.txt"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "chmod 0777 #{current_path}/tmp"
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
  
  desc "Create a symlink to database.yml and copy in secrets file" 
  task :after_update_code do
    run "cp #{shared_path}/config/secrets.rb #{release_path}/config/initializers/secrets.rb"  
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml" 
  end
  
  
  task :tail_log, :roles => :app do
    sudo "tail -f #{shared_path}/log/#{rails_env}.log"
  end
  
end