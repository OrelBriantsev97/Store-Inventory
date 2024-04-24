
import pyodbc
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
import logging
import smtplib
import os

server = 'DESKTOP-SFTJNP1'

logging.basicConfig(filename='app.log', level=logging.DEBUG)



def run_query():
    try :
        cursor = connect_db()
        query = "SELECT task_details FROM dbo.Tasks where task_type = 'remove from sale' AND last_update <= DATEADD(MINUTE, -2, GETDATE())"
        cursor.execute(query)
        res = cursor.fetchall()
    
    except pyodbc.Error as e:
        logging.error("An error occurred: %s", str(e), exc_info=True)
        return None
    
    return res
    
        
    

def send_email(result):
    try:
        if result != [] :

            gmail_user = 'orelbr6@gmail.com'
            gmail_password = os.getenv("AppPass")
            port = 587
            server = smtplib.SMTP('smtp.gmail.com', port)
            server.starttls()
            server.login(gmail_user, gmail_password)

            msg = MIMEMultipart()
            msg['From'] = gmail_user
            msg['To'] = "orelbr6@gmail.com"
            msg['CC'] = "orelbr6@gmail.com"
            msg['Subject']="Night Shift Reminder : Remove Products "


            body =(
            f"<p>Please remove the following products from sale : </p>" )
            for item in result:
                string_value = item[0]
                body += f"<p>{string_value}</p>"
        
            msg.attach(MIMEText(body, 'html'))
            server.send_message(msg)
            server.quit()
                
        
    except Exception as e:
        # Log the error
        logging.error("Error sending email: %s", str(e), exc_info=True)
    
def connect_db():
    global cursor, conn
    connection_string = f'DRIVER={{ODBC Driver 17 for SQL Server}};SERVER={server};Trusted_Connection=yes;'
    conn = pyodbc.connect(connection_string)
    cursor = conn.cursor()
    return cursor


def main():
    try:
        result = run_query()
        send_email(result)
    except Exception as e:
        # Log the error
        logging.error("An error occurred in the main function: %s", str(e), exc_info=True)

if __name__ == "__main__":
    main()