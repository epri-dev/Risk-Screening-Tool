# Climate RiSc-Tool

Climate RiSc Tool provides a free, publicly accessible, open-source platform for calculating, understanding, and indentiying climate impacts in power systems. While power system tools struggle to integrate large climate datasets, RiSc provides a fast and approximate method for identifying time periods and events of potential high risk of energy shortfalls across many Global Climate Models (GCMs), Shared Socioeconomic Pathways (SSPs) and with granular time and geospatial resoltions. High-Impact Low Frequency events can be used to facilitate climate-informed integrated system planning and guide resilience and adaptation strategies when properly integrating them in capacity expansion, resource adequacy and production cost models. RiSc also facilitates the understanding of structural system vulnerabilities of plausible future capacity buildout scenarios. It allows to assess how climate change will impact the power system under different horizons and scenarios. 

Climate RiSc was developed as part of the EPRI Resource Adequacy Iniatiave and Climate READi. EPRI plans to support continuing updates and enhancements.

## Getting Started

These instruction will help you to deploy RiSc on a remote/enterpise server and run a demo case. See the Software Manual for more detailed information including screenshots.

### Installation

1. #### Clone/download this repository onto your server.

	Get Git installed on your server.

	Navigate to a folder on your server where you want to place the tool. 

	Enter the following command from a terminal/prompt to 'clone' the repo and download it to your computer:
	```
	git clone  https://github.com/epri-dev/Risk-Screening-Tool.git
	```
	When cloning a repo with 'git clone', if you do not specify a new directory as the last argument (as shown above),
	it will be named `Risk-Screening-Tool`. Alternatively, you can specify this and name it as you please.

	Create the docker volumes in the Risk-Screening-Tool root directory and make sure your files have all permissions:
	```
	cd Risk-Screening-Tool
	mkdir power_systems nc_files risk_result_reports load_profiles risk_models risk_models_xlsx_files power_system_csv_files
	chmod -R a+rwx .
	```

2. #### Pull and load the docker image

	Get docker installed on your server. 
	
	When risctool docker image is provided as .tar file in this repo. run the command: `docker load -i risctool_docker.tar`. 

	If the docker image is provided through a public registry run docker `docker pull risctool:1.0`. If no tag is specified, Docker will pull the latest tag by default.

	Finally verity that the image is loaded `docker images`.

	Note: You might you need must have privileges (e.g., sudo in bash) to run docker commands including pulling and running docker images. 

3. #### Run the application
	
	Docker compose file `deft.yml` contain all the required configuration settings to run the containers. However, to run the tool remotly (otherwise comment this line using #) you will have to modify and specify the mount path in the docker compose backend volumes  `<your_mount_path>/input:/code/share` to your own path. 

	Make sure the .env file is available in the application root directory. DB_PASSWORD and DJANGO_KEY variables should be specify. To create the env file run `nano .env` and then paste 
	```
	DB_PASSWORD=your_secure_db_password_here
	DJANGO_KEY=your_secure_django_secret_key_here
	```

	Note: To generate a strong Django key, you can use `python -c "from django.core.management.utils import get_random_secret_key; print(get_random_secret_key())"`	

	Execute `./up.sh` to run the containers and `./down.sh` to stop and remove them. 
	
	Important: if you are running the application for the first time on your server make sure you create a Django superuser:
	1.  Run the containers `./up.sh` 
	2.  Access deft-backend-1 container `docker exec -it deft-backend-1 bash`
	3.  Navigate to Django directory `cd /code/backend`
	4.  Creare superuser `python manage.py createsuperuser`. 
	5.  Make sure you update the sysconfig.yml file in your root directory to align with the username and passowrd specify in this step.

	Note: If you want to delete exisiting volumes to have a fresh start, including configuration settings from DB/Django run `docker-compose -f deft.yml -p deft down -v --remove-orphans` instead of `./down.sh`.

### Running Your First Case: DEMO

This version comes with a demo datset to test the application. The public input data is specific of the Texas power system. 

1. #### Configuration settings
	Navigate to the `demo` folder. There are two files  `config.yml` and  `sysconfig.yml`. Both are ready to be used when running the tool locally (on your server)

	If you want to run the tool remotely (on your local laptop) in the `config.yml` you need to change `sync_type` from 'local' to 'remote_share'. In addition, in `sysconfig.yml` you need to change the `hostname` and specify the mount path (See step 3 in the installation process). 

	Important: If it's the first time running the demo you need to import the clean initial database. From the project root run: `./db_scripts/import_clean_db.sh` this will import the clean-2024.sql with default configuration values (e.g.,weather variables, etc). Note: Some tables might already exist raising an error message

2. #### Running the tool locally (on your server)

	All input data (Risk-Screening-Tool/demo/input) and configuration settings (Risk-Screening-Tool/demo/config and sysconfig.yml) need to be imported to the docker container. Use `nano` to modify configuration files as required.
	
	To transfer them inside the container run:
	```
	docker cp demo/input/ deft-backend-1:/code/backend/demo/ 
	docker cp demo/config.yml deft-backend-1:/code/backend/demo/ && docker cp demo/sysconfig.yml deft-backend-1:/code/backend/demo/
	```
	Access the docker container running this command `docker exec -it deft-backend-1 bash` and make sure data has been correctly transferred using `cd /backend/demo/ && ls -lp`
	
	To run a case execute `python demo.py` in the /code/backend/demo folder within the container.

	Solution will appear in the container `backend/demo/output` folder. You can export this running `docker cp deft-backend-1:/code/backend/demo/output /home/Risk-Screening-Tool/demo/`

3. #### Running the tool remotely (on your local computer)
	
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
