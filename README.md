Lift and Shift Migration with Load Balancer
=
In this project, we will be migrating a web application to 2 virtual machine instances and using an application gateway for routing requests.

In order to execute the bellow instructions, you only need to run *commands\Configs\config.ps1*. All the resources will automatically be deployed for you.

NOT WORKING 502 ERROR!!!

1. Create the Azure Resource Group
    - name: vm-xxx-rg (where xxx is a random number)
    - location: closest region
2. Virtual Network is shared between the 2 VMs and application gateway:
    - A virtual network with address prefix: 10.0.0.0/16
    - 2 subnet prefix:
        - application gateway subnet address prefix: 10.0.1.0/24
        - backend for VM subnet address prefix: 10.0.2.0/24
3. Create 2 virtual machines with the following conditions:
    - names: vm1 and vm2
    - image: UbuntuLTS
    - admin username: book_admin
4. Use the content in cloud-init.txt for the cloud init custom data which will install prerequistes
    - VM Size: costing less than $10 or sku Standard_B1ls
    - Each VM will have a public IP address to allow ssh communication for deployment
5. For each Virtual Machine, deploy content to the Website using SCP at following directory /home/book_admin/web:
    - e.g: scp -r ./web/ <**adminUsername**>@<**vmIpAddress**>:/home/<**adminUsername**>/web
6. Create an application gateway:
    - Name: ag-xxx (xxx should match the number set in your resource group to stay organized)
    - Tier: Standard_v2
    - Minimum Scale unit: 2
7. Create a public IP address. Use the Virtual Network created for the VMs
8. On the frontend settings, create a public IP
On the backend settings, add the 2 virtual machines created in Step 2
Configure routing rules to allow HTTP/port 80 communication to the backend
Get the Application Gateway IP Address to browse the application
Cleanup and delete resources
Be sure to cleanup and delete resources to avoid recurring charges

