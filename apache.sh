#! /bin/bash
function menu {
    clear
    echo -e "\t\t Main page\n\n"
    echo -e "\t1. Launch the ApacheServer\n"
    echo -e "\t2. List of Instances\n"
    echo -e "\t3. Stop the ApacheServer\n"
    echo -e "\t4. Start the ApacheServer\n"
    echo -e "\t5. Delete the ApacheServer\n"
    echo -e "\t0. Exit\n\n"
    echo -e "Enter option : "
    read option
if [ $option -gt 5 ]
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
fi        
}
menu