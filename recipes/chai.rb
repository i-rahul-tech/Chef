package 'apache2' do
        action :install
end
service 'apache2' do
        action [ :enable, :start]
end
file '/etc/motd' do
        content "this is the testfile for chef-apache
        HOSTNAME: #{node['hostname']}
        IPADDRESS: #{node['ipaddress']}
        Memory: #{node['memory']['total']}
        CPU: #{node['cpu']['0']['mhz']}"
end 
 
template '/etc/motd' do
	source 'motd.erb'
	action :create
	variables(
		'name': 'rahul',
		'Project': 'techX'
	)
end
