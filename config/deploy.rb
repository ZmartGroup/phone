#require "rvm/capistrano"
require 'bundler/capistrano'

set :repository, "git@github.com:ZmartGroup/phone.git"
set :branch,     "release"

set :scm, :git
set :git_shallow_clone, 1

role :app, "10.0.6.15"

set :user,              "adhearsion"
set :deploy_to,         "/home/adhearsion/apps/phone"

set :keep_releases, 5

set :asterisk_sound_dir, "/usr/local/asterisk/var/lib/asterisk/sounds"

default_run_options[:pty] = true
set :use_sudo, false

set :bundle_flags, "--deployment --quiet --binstubs --shebang ruby-local-exec"

set :default_environment, {
  'PATH' => "$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH"
}

set :bluepill, "/usr/sbin/bluepill"

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "sudo #{bluepill} adhearsion restart"
  end

  task :symlink_sound_files do
    run "cd #{current_path}; rake symlink_sound_files[#{current_path}/res/sounds,#{asterisk_sound_dir}]"
  end

  after 'deploy', 'deploy:symlink_sound_files'
  after 'deploy', 'deploy:cleanup'
end