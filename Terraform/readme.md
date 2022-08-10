# What are Provisioners?
Provisioners in terraform, allow executing specific actions on a local or a remote server. We can add provisioners to any resource directly.

### The generic provisioners are the ones that are independent of any cloud provider and can be used without them. They are of three types:

file

local-exec

remote-exec

### File Provisioner
The file type allows to transfer or copy the files or directories to the remote host. This provisioner supports ssh or a winrm connection to support the file transferring over the remote servers.

### Remote-exec Provisioner
Remote-exec is a provisioner that allows to execute commands/scripts on the remote server. We can run the scripts that we want to run on the remote instance after its creation. For example, we will upload the jar file of our application on the instance and use ‘remote-exec’ to execute the commands to run that file in the remote system, i.e., ec2 instance.

we will get when we use the ‘terraform apply‘ command on the above configuration file. This shows that the jar file is running effectively on the created instance.

we will use this command.

terraform init

terraform plan

terraform apply

### Local-exec Provisioner
As the name ‘local-exec’ suggests, this allows executing commands/scripts on the local system. This invokes a script or a command on the system on which terraform is running instead of the resource created. This provisioner does not require an ssh or a winrm connection as it runs on local system.

In this we will create one directory.
We will add the some terraform file.
In the above code, we have created an ec2 instance and then used the ‘local-exec’. We have used it to store the private IP of the instance created above. It will store it in a file named local-exec_IPs.txt in the terraform directory on the local system. 

And we will cat the local exec file.

Cat local-exec.txt 