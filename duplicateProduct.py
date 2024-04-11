import pyodbc
import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
import tkinter as tk
from tkinter import messagebox

# SQL server information
server = 'DESKTOP-SFTJNP1'

def root_de():
    global job_entry, result_listbox, root,send_button
    # Root window 
    root = tk.Tk()
    root.title("Similar Product Number Search")
    label = tk.Label(root, font=("Arial", 12), bg="#CCE5FF", text="Search Correlation Lot")
    label.pack(pady=10)
    root.geometry("500x600")
    root.configure(bg="#CCE5FF")

    job_entry = tk.Entry(root, font=("Arial", 12))
    job_entry.pack(pady=10)

    search_button = tk.Button(root, font=("Arial", 12), bg="#CCE5FF", text="Search", command=execute_query)
    search_button.pack(pady=10)

    # Create a Listbox to display the results
    result_listbox = tk.Listbox(root, font=("Arial", 12), bg="white", height=10)
    result_listbox.pack(pady=10)

    send_button = tk.Button(root, font=("Arial", 12), bg="#CCE5FF", text="Send Email", command=send_email_de, state=tk.DISABLED)
    send_button.pack(pady=10)
    
    root.protocol("WM_DELETE_WINDOW", closing_app)

    root.mainloop()


def execute_query():
    global new_pro_num
    new_pro_num = job_entry.get()
    if len(new_pro_num) < 8:
        error_message = "Invalid Input\n\n" \
                        "Invalid product number."
        messagebox.showerror("Error", error_message)
        return

    first_4 = new_pro_num[:2]
    last_3 = new_pro_num[-2:]

    cursor = connect_db()
    # Define query
    query = "SELECT TOP 10 ProductNumber FROM dbo.ProductBundle WHERE ProductNumber LIKE ? AND ProductNumber LIKE ? AND ProductType = 'Dairy'"
    param1 = f"{first_4}%"
    param2 = f"%{last_3}"
    cursor.execute(query, (param1,param2))
    results = cursor.fetchall()
    display_results(results)


def display_results(results):
    if len(results) > 0:
        result_listbox.delete(0, tk.END)
        similar_products = [result[0] for result in results]
        for product in similar_products:
            result_listbox.insert(tk.END, product)
        send_button.config(state=tk.NORMAL)
    else:
        result_listbox.delete(0, tk.END)
        error_message = "No Results\n\n" \
                        "No similar Product Numbers were found."
        messagebox.showinfo("Error", error_message)


def connect_db():
    global cursor, conn
    connection_string = f'DRIVER={{ODBC Driver 17 for SQL Server}};SERVER={server};Trusted_Connection=yes;'
    conn = pyodbc.connect(connection_string)
    print("Connected to the database successfully.")
    cursor = conn.cursor()
    return cursor


def send_email_de():
    global email_entry, root
    root_send_email = tk.Tk()
    root_send_email.title("Send Email")
    root_send_email.geometry("300x200")
    root_send_email.configure(bg="#CCE5FF")

    email_title = tk.Label(root_send_email, font=("Arial", 12), bg="#CCE5FF", text="Send Email")
    email_title.pack(pady=10)
    email_entry = tk.Entry(root_send_email, font=("Arial", 12))
    email_entry.pack(pady=10)
    email_entry_button = tk.Button(root_send_email, font=("Arial", 12), bg="#CCE5FF", text="Send", command=send_email)
    email_entry_button.pack(pady=10)

    root_send_email.mainloop()


def send_email():
    gmail_user = 'orelbr6@gmail.com'
    gmail_password = ''

    server = smtplib.SMTP('smtp.gmail.com', 587)
    server.starttls()
    server.login(gmail_user, gmail_password)

    msg = MIMEMultipart()
    msg['From'] = gmail_user
    msg['To'] = email_entry.get()
    msg['CC'] = "orelbr6@gmail.com"
    msg['Subject'] = f"Duplicate Product Number {new_pro_num}"

    body = f"<p>Hello, please change the Product number {new_pro_num}, similar numbers already exist.</p>" \
           f"<p>Best Regards,</p>" \
           f"<p><b>Orel Briantsev</b></p>" \
           f"<p><b>T</b>: 0544272665 | orelbr6@gmail.com</p>"
    msg.attach(MIMEText(body, 'html'))

    server.send_message(msg)
    server.quit()
    root.send_email.destroy()
    root_de()


def closing_app():
    if messagebox.askokcancel("Exit", "Do you really want to exit?"):
        root.destroy()


root_de()
