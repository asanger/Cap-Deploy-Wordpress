ip="#{development_server}"
set :deploy_to, "#{development_path}"
set :branch, "#{development_branch}"

role :web, ip
