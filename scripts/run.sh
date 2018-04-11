#!/bin/bash

# Setup Port and Address for Metabase
export MB_JETTY_PORT=17050;
export MB_JETTY_HOST=0.0.0.0;
echo Metabase Server Port and IP Address Set;

# Run Metabase
java -jar ~/metabase.jar &
echo Metabase Started;

# Start nodejs and app
npm start --prefix ~/pharmacy_app/code/server/app.js &
echo Node Started;
