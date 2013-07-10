# nginx needs the wav mime type[s] for firefox to recognize them as audio
# audio/x-wav                           wav;
# in 
# /etc/nginx/mime.types


# needed on ubuntu
# not using postgres or sqlite but sick of seeing error messages when the gems install
pkgs = %w(sqlite3 libsqlite3-dev nodejs npm postgresql-server-dev-all )

pkgs.each do |pkg|
  package pkg
end

github_public_key = <<-GITKEY
github.com,207.97.227.239 ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAq2A7hRGmdnm9tUDbO9IDSwBK6TbQa+PXYPCPy6rbTrTtw7PHkccKrpp0yVhp5HdEIcKr6pLlVDBfOLX9QUsyCOV0wzfjIJNlGEYsdlLJizHhbn2mUjvSAHQqZETYP81eFzLQNnPHt4EVVUh7VfDESU84KezmD5QlWpXLmvU31/yMf+Se8xhHTvKSCZIFImWwoG6mbUoWf9nzpIoaSjB+weqqUUmpaaasXVal72J+UX2B+2RPW3RcT0eOzQgqlJL3RKrTJvdsjE3JEAvGq3lGHSZXy28G3skua2SmVi/w4yCE6gbODqnTWlg7+wC604ydGXA8VJiS5ap43JXiUFFAaQ==
GITKEY

bash 'add_github_key' do
  user 'root'
  action :run
  code <<-HEREDOC
    echo "#{github_public_key}" >> /etc/ssh/ssh_known_hosts
  HEREDOC
end
