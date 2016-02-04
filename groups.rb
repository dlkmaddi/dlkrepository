
if Chef::Config[:solo]
  Chef::Log.warn('This recipe uses search. Chef Solo does not support search.')
else
  nodes = search(:node, "hostname:[* TO *] AND chef_environment:#{node.chef_environment}")
end



search("groups","*:*").each do |group_data|
   group group_data["id"] do
     gid group_data["gid"]
     members group_data["members"]
    end
end