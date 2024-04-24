# Store-Inventory
This repo contains programs adapted from projects I've developed at my current job. The code has been modified to remove proprietary or sensitive information

## Store Inventory Shortcuts

This tool provides quick access to essential resources and software applications used daily in my job.

### Features:
- Access URLs for vendors supplying fruits, vegetables, dairy products, meat, plastic bags, and beverages.
- Launch the Duplicate Product Number Checker tool to identify and resolve duplicate product numbers efficiently.


### Modification:
The code has been modified to remove proprietary or sensitive information and adapt it for presentation on GitHub. 



## Similar Product Number Search Tool

This Python script provides a simple graphical user interface (GUI) tool for searching similar product numbers in a SQL database and sending email notifications. It's designed to help users identify and manage duplicate product numbers efficiently.

### Features:
- **Search Functionality**: Users can search for similar product numbers by entering a partial number into the input field and clicking the "Search" button.
- **Email Notification**: Once similar product numbers are found, users can click the "Send Email" button to send a notification email to the designated recipient.
- **Interactive GUI**: The application features a user-friendly graphical interface built using the Tkinter library.

### Usage:
1. **Search for Similar Product Numbers**:
   - Enter a partial product number into the search field.
   - Click the "Search" button to find similar product numbers in the database.
   - Results will be displayed in the listbox.
  
2. **Send Email Notification**:
   - After finding similar product numbers, click the "Send Email" button.
   - Enter the recipient's email address in the provided field.
   - Click the "Send" button to send an email notification containing the relevant information.


## Product Remove Reminder

This Python script automates querying a SQL database for specific tasks and sending email notifications. It's designed to assist with task management and ensure timely notifications when certain conditions are met.

### Features:
- **Task Query Functionality**: Fetches tasks details from a SQL database based on specific criteria - tasks that need to be removed from sale
- **Email Notification**: Sends email alerts to night shift when tasks meet the defined conditions.
- **Error Logging**: Records errors and other significant events in a designated log file for easy troubleshooting.

### Usage:
1. **Run a Query for Tasks**:
   - Connect to your SQL database using the `connect_db()` function.
   - Use `run_query()` to retrieve tasks that need attention.
   - The result is a list of tasks that nneds to be removed from sale

2. **Send Email Notifications**:
   - Set up Gmail SMTP with your email and app password.
   - Use `send_email()` to send task details to the designated email recipient.





