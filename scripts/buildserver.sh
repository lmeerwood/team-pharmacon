#!/usr/bin/env bash

case $1 in
    start-webserver)
        # Checkout Branch
        cd ~/pharmacy_app
        git checkout master -f
        echo Checked out into Master

        #Start Web Server
        cd ~/pharmacy_app/code/server
        npm start &
        echo Web Server Started
    ;;
    stop-webserver)
        #Kill the node module to stop the web server
        pkill -f 'node'
        echo "Web Server has been stopped!"
    ;;

    start-metabase)
        # Setup Port and Address for Metabase
        export MB_JETTY_PORT=17050
        export MB_JETTY_HOST=0.0.0.0
        echo Metabase Server Port and IP Address Set

        # Run Metabase
        java -jar ~/metabase.jar &
        wait
        echo Metabase Started
    ;;

    stop-metabase)
        #Kill the metabase java jar file
        pkill -f 'java -jar'
        echo "Metabase has been stopped!"
    ;;

    build-server)
        echo "Building and starting The Web Server!"
        cd ~

        #creating aliases
        echo "alias pharmacon='cd ~/pharmacy_app/scripts && ./buildserver.sh'" >> ~/.bashrc
        source ~/.bashrc

        #Change into the application folder and checkout appropriate branch
        cd ~/pharmacy_app
        git checkout master -f

        #Change into the server folder and then npm install all the packages
        cd ~/pharmacy_app/code/server
        npm install
        wait
        cd ~
        echo "The web Server has been built successfully!"
    ;;
    
    *)
        echo "You need to give a parameter to the command, the available parameters are:"
        echo "build-server: This will install and setup the server, should only be run once!"
        echo "start-webserver: This will start the webserver, which is the front end for the application!"
        echo "start-metabase: This will start metabase, which is the reporting application"
        echo "stop-webserver: This will stop the webserver"
        echo "stop-metabase: This will stop the webserver"
        echo ""
        echo "An example usage is: "
        echo "pharmacon start-webserver"
    ;;
esac