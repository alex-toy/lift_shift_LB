"###############################################################"
"Now running : " + $MyInvocation.MyCommand.Path
"###############################################################"

################################################################
"COPY APPLICATION FILES TO BOTH THE VMs :"

#copy a basic Flask app from local machine to the VM
scp -r ./${application_path} ${VM1AdminUsername}@${IP1}:/home/${VM1AdminUsername}/${application_path}
scp -r ./${application_path} ${VM2AdminUsername}@${IP2}:/home/${VM2AdminUsername}/${application_path}



"Commands to connect to the VMs :"
"VM1 :"
"ssh ${VM1AdminUsername}@${IP1}"
"VM2 :"
"ssh ${VM2AdminUsername}@${IP2}"