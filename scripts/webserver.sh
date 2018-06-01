#!/bin/bash

# Checkout Branch
cd ~/pharmacy_app
git checkout dev -f
echo Checked out into dev;

# Start Web Server
cd ~/pharmacy_app/code/server
npm start
echo Web Server Started;


