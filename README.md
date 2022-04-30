WELCOME TO OUR ENRICHMENT SHINY DASHBOARD

This Shiny Dashboard has diferent elements:

1. Example_data

A folder to place example data files.

2. Instructions

Folder where we can find different R Markdown files:

- Terms: Shiny terms of use
- Help: some indications in order to help the user 
- About: little review about the lab/group/researcher

The install_packages file contains the needed libraries for the app to work. Those libraries are charged before running the app through help.R file located at the app general folder. Despite this, if any problem persists, you are able to look for the packages and install them from the install_packages file.

3. www

This folder contains a .css file with the stetic page configuration (letter, size, colour, etc.)

4. UI and Server

Exists one UI and one Server for each app tab and all of them are connected to a general UI and a general Server.

The general UI defines the app tabs format and the general Server works as a bridge between the other servers and the UI.

The inputdata UI/Server is designed to charge one file in .csv format (although we can modify it to our desired format) considering the presence of our example_data. That means that if we choose to use our sample data, the app will take the ones we have left in the example_data folder (for this we must enter the file name correctly in the server code), and if we select that we DO NOT want to sample data, the app allows us to upload the data we want.

The UI help, introduction, terms, about have a path to R Markdown files that we find in the instructions folder, in which we can modify the text we want to display on the screen to adjust it to the function of our app.
