ip="#{staging_server}"
set :deploy_to, "#{staging_path}"
set :branch, "#{staging_branch}"

role :web, ip
