import yaml

setup_data = "/root/openstack-configs/setup_data.yaml"
LINE = "alias %s='ssh root@%s'"
from shutil import copyfile
copyfile("/root/.bashrc", "/root/.bashrc.bak")
with open(setup_data, 'r') as stream, open("/root/.bashrc", "a") as bashrc:
	try:
		data =yaml.load(stream)
 		control = data['ROLES']['control']
		compute = data['ROLES']['compute']
		bashrc.write("\n#### Machine aliases \n")
		key =1
		for i in control:
			line = LINE%(key, i)
			print line
			bashrc.write(line+"\n")
			key+=1
		key = 1
		for i in compute:
			line = LINE%('c'+str(key), i)
			print line
			bashrc.write(line+"\n")
			key+=1
	except yaml.YAMLError as exc:
		print(exc)
