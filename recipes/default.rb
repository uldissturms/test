#
# Cookbook Name:: test
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute

include_recipe 'nodejs'

cookbook_file 'simple.js' do
    path 'srv/simple.js'
end

execute 'node srv/simple.js' do
    not_if 'netstat -l | grep :3000'
end
