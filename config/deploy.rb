set :application,   'v8logic'
set :scm,           'git'
set :repository,    'git@github.com:veader/V8Logic-Website.git'
set :deploy_to,     "/var/www/#{application}"
set :user,          'web'
set :keep_releases, 3
set :use_sudo,      false
set :deploy_via,    :copy
set :port,          22

role :web,          'v8logic.com'

after 'deploy:symlink', :symlink_clients

# task :symlink_betas, :roles => :web do
#   run <<-CMD
#     rm -f #{latest_release}/betas &&
#     ln -nfs #{shared_path}/betas #{latest_release}/betas
#   CMD
# end

task :symlink_clients, :roles => :web do
  run <<-CMD
    rm -f #{latest_release}/clients &&
    ln -nfs #{shared_path}/clients #{latest_release}/clients
  CMD
end

deploy.task :restart, :roles => :web do
  # DO NOTHING
end

deploy.task :finalize_update, :except => { :no_release => true } do
  # DO NOTHING
end
