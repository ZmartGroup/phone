set :repository, "git@github.com:ZmartGroup/phone.git"
set :branch,     "release"

set :scm, :git
set :git_shallow_clone, 1

role :app, "10.0.6.15"

set :user,              "adhearsion"
set :deploy_to,         "/home/adhearsion/apps/phone"

set :keep_releases, 5

default_run_options[:pty] = true
set :use_sudo, false

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    #run "sudo /usr/local/bin/bootup_bluepill phone restart"
  end

  after "deploy", "deploy:cleanup"
end