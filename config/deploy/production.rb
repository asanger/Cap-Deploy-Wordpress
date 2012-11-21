ip="#{production_server}"
set :deploy_to, "#{production_path}"
set :branch, "#{production_branch}"

role :web, ip
