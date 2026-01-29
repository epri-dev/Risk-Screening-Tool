# Climate RiSc-Tool

Climate RiSc Tool provides a free, publicly accessible, open-source platform for calculating, understanding, and indentiying climate impacts in power systems. While power system tools struggle to integrate large climate datasets, RiSc provides a fast and approximate method for identifying time periods and events of potential high risk of energy shortfalls across many Global Climate Models (GCMs), Shared Socioeconomic Pathways (SSPs) and with granular time and geospatial resoltions. High-Impact Low Frequency events can be used to facilitate climate-informed integrated system planning and guide resilience and adaptation strategies when properly integrating them in capacity expansion, resource adequacy and production cost models. RiSc also facilitates the understanding of structural system vulnerabilities of plausible future capacity buildout scenarios. It allows to assess how climate change will impact the power system under different horizons and scenarios. 

Climate RiSc was developed as part of the EPRI Resource Adequacy Iniatiave and Climate READi. EPRI plans to support continuing updates and enhancements.

## Getting Started

These instruction will help you to deploy RiSc on a remote/enterpise server and run a demo case. See the Software Manual for more detailed information including screenshots.

### WSL/Linux VM Configuration
This set of prerequisites will allow users to set-up a WSL remote connection from their Windows machine. Make sure you have installed:
- VSCode: For more information: https://code.visualstudio.com/
- WSL: Type ‘wsl —install’ via powershell (if not installed already).It will be set to WSL 2 by default. For more information: https://learn.microsoft.com/en-us/windows/wsl/install. Then, install WSL extension in VSCode. 
- Windows 11

Note: User can decide to set-up an on-premise VM to handle powerful simulation with RiSc Tool. On-premise VMs should work on internal networks preventing data to be exposed outside of their network.

1. #### Create a new distro and connect to it:
   - Go to WSL extension (Remote Explorer) and add a new distro (WSL target menu; click on "+"): Install Ubuntu 24.04. Note: Users can use another distribution environment (i.e., SUSE Linux Enterprise 16)
   - Create you user account (user and password)
   - In WSL target menu, you should see your Ubuntu distro and connect to it ("Connect in Current Window", click on "->"). This will open a new window, you are now under your newly created Linux environment. 
	
2. ####	Create a project and clone RiSc Tool
   - Get sudo rights typing `sudo su` this will ask for user account credentials created in step 1.
   - Create a working directory within your Linux terminal (you should have been able to connect to your distro) where you want to clone your repo: `mkdir RiSc_demo`
3. #### Install docker
   ```
   sudo apt-get update
   sudo apt-get install -y docker.io
   sudo apt-get install docker-compose -y
   ```
   make sure installation is succesful typing: `docker --version`
   
### RiSc Tool Installation

1. #### Clone/download this repository onto your server.

	Make sure Git is installed on your server.

	Navigate to a folder on your server where you want to place the tool (Go to Step 2 in WSL Configuration). 

	Enter the following command from a terminal/prompt to 'clone' the repo and download it to your computer:
	```
	git clone  https://github.com/epri-dev/Risk-Screening-Tool.git
	```
	When cloning a repo with 'git clone', if you do not specify a new directory as the last argument (as shown above),
	it will be named `Risk-Screening-Tool`. Alternatively, you can specify this and name it as you please.

	Make sure the docker image file (.tar file) is correctly cloned. As it is a large file (~125MB), you need to handle correctly LFS in Git. Otherwise, you can download the file manually by clicking in "Dowload raw file" here https://github.com/epri-dev/Risk-Screening-Tool/blob/main/risctool_docker.tar. If you are using WSL this can be transfer easily to the VM typing `\\wsl$` in your file explorer. Then navigate to the folder where you clone your RiSc repository within you Linux distribution. In case you decided to set-up your own Linux VM (no WSL), set-up a mount correctly between your Linux VM and Windows to transfer files.   

	Create the docker volumes in the Risk-Screening-Tool root directory and make sure your files have all permissions:
	```
	cd Risk-Screening-Tool
	mkdir power_systems nc_files risk_result_reports load_profiles risk_models risk_models_xlsx_files power_system_csv_files
	chmod -R a+rwx .
	```

2. #### Pull and load the docker image

	Get docker installed on your server (Go to Step 3 in WSL Configuration). 
	
	When risctool docker image is provided as .tar file (Go to previous Step), run the command: `docker load -i risctool_docker.tar`. 

	If the docker image is provided through a registry:
		1. login into docker registry: `docker login <registry-name>.azurecr.io`. It will ask you yto introduce registry credentials. 
   		2. run `docker pull <registry>.azurecr.io/<repository>:<tag>`.
  		3. verify that the image is loaded `docker images`.
	Note: You need to have sudo privileges (type `sudo su`) to run docker commands including pulling and running docker images. 

4. #### Run the application
	
	Docker compose file `deft.yml` contain all the required configuration settings to run the containers. However, to run the tool remotly (otherwise comment this line using #) you will have to modify and specify the mount path in the docker compose backend volumes  `<your_mount_path>/input:/code/share` to your own path. 

	Make sure the .env file is available in the application root directory. DB_PASSWORD and DJANGO_KEY variables should be specify. To create the env file run `nano .env` and then paste 
	```
	DB_PASSWORD=your_secure_db_password_here
	DJANGO_KEY=your_secure_django_secret_key_here
	```
    Note: You can also transfer .env file from windows using `\\wsl$` or a mount (Go to Section RiSc Tool Installation, Step 1)

    Important: Make sure you update the sysconfig.yml file in your working directory `demo/input/` to align with the username and passowrd specify in this step.

    In your terminal use `tmux` instead of linux `bash` to work with multiple bash sessions. Execute `./up.sh` to run the containers and `./down.sh` to stop and remove them. Then, create a new bash session `ctrl + b + c` to keep executing commands (while RiSc Tool is up and running). To switch across bash session use `ctrl + b + number of the session (0, 1, 2,...)`

   	Note: If you want to delete exisiting configuration to have a fresh start, including configuration settings from DB/Django run `docker-compose -f deft.yml -p deft down -v --remove-orphans` instead of `./down.sh`.

    You can create your own Django superuser:
	1.  Access deft-backend-1 container `docker exec -it deft-backend-1 bash`
	2.  Navigate to Django directory `cd /code/backend`
	3.  Creare superuser `python manage.py createsuperuser`.
	4.  To generate a strong Django key, you can use `python -c "from django.core.management.utils import get_random_secret_key; print(get_random_secret_key())"`

### Running Your First Case: DEMO

This version comes with a demo datset to test the application. The public input data is specific of the Texas power system. 

1. #### Configuration settings
	Navigate to the `demo` folder. There are two files  `config.yml` and  `sysconfig.yml`. Both are ready to be used when running the tool locally (on your server)

	If you want to run the tool remotely (on your local laptop) in the `config.yml` you need to change `sync_type` from 'local' to 'remote_share'. In addition, in `sysconfig.yml` you need to change the `hostname` and specify the mount path (See step 3 in the installation process). 

	Important: If it's the first time running the demo you need to import the clean initial database. From the project root run: `./db_scripts/import_clean_db.sh` this will import the clean-2024.sql with default configuration values (e.g.,weather variables, etc). Note: Some tables might already exist raising an error message

2. #### Running the tool locally (on your VM)

	All input data (Risk-Screening-Tool/demo/input) and configuration settings (Risk-Screening-Tool/demo/config and sysconfig.yml) need to be imported to the docker container. Use `nano` to modify configuration files as required.
	
	To transfer them inside the container run:
	```
	docker cp demo/input/ deft_backend_1:/code/backend/demo/ 
	docker cp demo/config.yml deft_backend_1:/code/backend/demo/ && docker cp demo/sysconfig.yml deft_backend_1:/code/backend/demo/
	```
	Access the docker container running this command `docker exec -it deft_backend_1 bash` and make sure data has been correctly transferred using `cd /backend/demo/ && ls -lp`
	
	To run a case execute `python demo.py` in the /code/backend/demo folder within the container.

	Solution will appear in the container `backend/demo/output` folder. You can export this running `docker cp deft_backend_1:/code/backend/demo/output /home/Risk-Screening-Tool/demo/`

3. #### Running the tool remotely (from your local computer)
	
	After changing configuration settings accordingly as decribed in step 1 and configure the mount (heavy files are transferred through this channel).
	
	Then, run the python demo.py script on your local machine:  `python demo.py` 

	Note: remember to set-up the mount path as volume in the deft.yml file (docker-compose file)

## Deployment

The application is designed to run on enterprise environments where deployment is secure and not publicly exposed to the internet. A docker-proxy set-up to encript http requests through https is recommended. 

## Versioning

This is version 0.1 (1/1/2025)

## Authors

* **Amir Cicak**
* **Juan Carlos Martin**
* **Eamonn Lannoye**

## Contributing
Pull requests are welcome. For major changes, please contact the team to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

This project is licensed under the BSD (3-clause) License - see [LICENSE.txt](./LICENSE.txt).
