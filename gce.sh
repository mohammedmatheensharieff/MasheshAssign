#! /bin/bash
var='please enter your choice'
options=("Create ApacheWebServer" "Stop WebServer" "Start WebServer" "Delete WebServer" "List instance" "quit")
select opt in "${options[@]}"
do
        case $opt in
                 "Create ApacheWebServer")
                     echo "Choose 1 to create the instance"
                     gcloud compute instances create apachewebserver --source-instance-template apache2
                     echo "Your instance is deleted"

                     ;;
                 "Stop WebServer")
                       echo "Choose 2 for stop the instance"
                       gcloud compute instances stop apachewebserver
                       echo "Your instance is stopped"
                     ;;
                  "Start WebServer")
                       echo "Choose 3 for starting an instance"
                       gcloud compute instances start apachewebserver
                       echo "You started an instance"
                       ;;
                  "Delete WebServer")
                       echo "Choose 4 for deleting the instance"
                       gcloud compute instances delete apachewebserver
                       echo "You deleted the instance"
                       ;;
                    "List instance")
                       echo "list of instnces "
                       gcloud compute instances list
                       echo "List of instances" 
                       ;;
                       "quit")
                       break
                       ;;
                      *) echo "invalid option";;
           esac
done