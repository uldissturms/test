#
# Cookbook Name:: test
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute

include_recipe 'nodejs'
include_recipe 'supervisor'

cookbook_file 'simple.js' do
    path 'srv/simple.js'
end

package 'nginx'

cookbook_file 'default' do
    path '/etc/nginx/sites-available/default'
    notifies :restart, 'service[nginx]'
end

service 'nginx' do
    action [:start]
end

supervisor_service 'hello-world' do
    command 'node /srv/simple.js'
    action :enable
    autostart true
    autorestart true
end

package 'curl'
package 'net-tools'
