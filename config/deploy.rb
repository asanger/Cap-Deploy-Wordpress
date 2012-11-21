####################################################################
# A user named "deploy" needs to be added to the server being deployed to.
# This user should have write access to the deploy path.
# This user should also have your key in his authorized_keys file.
####################################################################

# which environment should be the default?
# if you just run 'cap deploy'
set :default_stage, "development"

# development server settings
set :development_server, "development.example.com"	# The server that will be sshed into
set :development_path, "/var/www/html/development.example.com"
set :development_branch, "development"

# staging server settings
set :staging_server, "staging.example.com"	# The server that will be sshed into
set :staging_path, "/opt/sites/staging.example.com"
set :staging_branch, "staging"

# production server settings
set :production_server, "www.example.com"	# The server that will be sshed into
set :production_path, "/var/www/html/www.example.com"
set :production_branch, "master"

# repository settings
set :repository,  "git@github.com:asanger/repo-name.git"

# user on the server to connect and deploy as
# this recipe is setup to use public key authentication
set :user, "deploy"

require 'capistrano'
require 'capistrano/ext/multistage'

##########################################################################
##  don't modify anything below here unless you know what you are doing!  #
###########################################################################

default_run_options[:pty] = true
#ssh_options[:forward_agent] = true
default_environment['PATH'] = '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin'

set :use_sudo, false
set :scm, :git
set :deploy_via, :remote_cache


set :stages, %w(development staging production)

# run our task to symlink shared/system into wp-content/uploads
after 'deploy:update_code', 'deploy:symlink_shared'

# overwrite the default :migrate task or it will
# fail since there are no migrations in wordpress
namespace :deploy do
        # symlink shared/system into wp-content/uploads
        task :symlink_shared do
                run "ln -s #{shared_path}/system #{release_path}/wp-content/uploads"
        end
        task :migrate do
                # don't do anything, it's a wordpress app!
        end
        # override the default so it doesn't create public, tmp, etc
        task :finalize_update do
                # don't do anything, it's a wordpress app!
        end
end
