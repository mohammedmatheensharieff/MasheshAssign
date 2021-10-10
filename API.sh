#! /bin/bash
function menu {
    clear
    echo -e "\t\t Main page\n\n"
    echo -e "\t1. Launch the ApacheServer\n"
    echo -e "\t2. List of Instances\n"
    echo -e "\t3. Stop the ApacheServer\n"
    echo -e "\t4. Start the ApacheServer\n"
    echo -e "\t5. Delete the ApacheServer\n"
    echo -e "\t6. Create Bucket and adding content to it\n"
    echo -e "\t7. List of Buckets\n"
    echo -e "\t8. Granting permissions to all the objects in the bucket\n"
    echo -e "\t9. Setting Retention policy\n"
    echo -e "\t10. List of enabled API services\n"
    echo -e "\t11. Enabling CloudTrace API\n"
    echo -e "\t0. Exit\n\n"
    echo -e "Enter option : "
    read option
if [ $option -gt 11 ]
	then
		echo "Invalid choice"
		sleep 3
		clear
		menu
elif [ $option -eq 1 ]
	then
		echo "Option Selected: " $option
		sleep 2 
		gcloud compute instances create apachewebserver --source-instance-template apache2
        echo -e "Successfully Launched ApacheWebServer"
        sleep 5
        menu
elif [ $option -eq 2 ]
    then
        echo "option Selected: " $option
        sleep 2
        echo -e "The List of Instance: \n"
        gcloud compute instances list
        sleep 5
        menu
elif [ $option -eq 3 ]
    then 
        echo "Option Selected: " $option
        sleep 2
        gcloud compute instances stop apachewebserver
        echo -e "ApacheWebServer is Stopped!\n"
        sleep 5
        menu
elif [ $option -eq 4 ]
    then 
        echo "Option Selected: " $option
        sleep 2
        gcloud compute instances start apachewebserver
        echo -e "ApacheWebServer is Bootedup!\n"
        sleep 5
        menu 
elif [ $option -eq 5 ]
    then 
        echo "Option Selected: " $option
        sleep 2
        gcloud compute instances delete apachewebserver
        echo -e "ApacheWebServer is DeletedForever!\n"
        sleep 5
        menu     
elif [ $option -eq 6 ]
    then 
        echo "Option Selected: " $option
        sleep 2
         gsutil mb -c standard -l asia-south1 --retention 30m gs://mohammed-786
        echo -e "Bucket Created\n"
        sleep 10
        echo -e "Adding a basic html"
        gsutil cp -r html gs://mohammed-786
        sleep 10
        echo -e "Content Added"
        sleep 5
        menu
elif [ $option -eq 7 ]
    then 
        echo "Option Selected: " $option
        sleep 2
         gsutil ls
        echo -e "List of Buckets\n"
        sleep 5
        menu   
elif [ $option -eq 8 ]
    then 
        echo "Option Selected: " $option
        sleep 2
        gsutil -m acl ch -R -u AllUsers:R gs://mohammed-786/html
        echo -e "Permissions Granted\n"
        sleep 5
        menu   
elif [ $option -eq 9 ]
    then 
        echo "Option Selected: " $option
        sleep 2
        gsutil retention set 60s gs://mohammed-786
        echo -e "Retention set for 60sec.\n"
        sleep 5
        menu   
elif [ $option -eq 10 ]
    then
        echo "Option Selected: " $option
        sleep 2 
        listAPI
        menu
elif [ $option -eq 11 ]
    then
        echo "Option Selected: " $option
        sleep 2 
        enableAPI
        
fi        
}

function API {
    listAPI
    enableAPI
}

function listAPI {
    echo -e "List of enabled Services : \n"
    gcloud services list --enabled
    sleep 10
    menu
}
function enableAPI {
    echo -e "Enabiling CloudTrace API\n"
    gcloud services enable cloudtrace.googleapis.com
    echo -e "CloudTrace API enabled"
    sleep 10
    menu
}
menu
