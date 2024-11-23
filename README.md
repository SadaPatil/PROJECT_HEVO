# PROJECT_HEVO
Create new Account in DBT
It will redirect to Complete project setup
In the Connection drop down, click on add new connection
	- It will redirect to new webpage for setting up connection
	- select Snowflake from options
	- provide connection name
	- dbt Cloud will always access your connection from 52.3.77.232, 3.214.191.130, or 34.233.79.135. Make sure to allow inbound traffic from these IPs in your firewall, and include it in any database grants.
	- Provide snowflake account name, database, and warehouse
	- save the details
	- go back to setting up project
You should be able to see connection you created above in the drop down.
It will ask for details to snowflake credentials,
	- Auth method is Username and Password
	- Provide Username, Password.
	- Test connection and save once it's successful
You will be asked to setup a repository
Make sure you setup github access
Select repository ''PROJECT_HEVO'
Select 'start developing in the IDE'
This will pull files from the hit repository.
In the left panel, select Dashboard
Under Deployment Environments, 
	- create environment and follow instructions to add connection and rest of the details. 
	- Save newly created environment
Now from left panel, go to Deploy => Jobs
	- Create job
	- Select 'deploy job'
	- Give it a job name
	- Select environment created above
	- In the execution setting, add commands, dbt build and dbt test
	- save the job
	- Run the job and it should complete successfully.

