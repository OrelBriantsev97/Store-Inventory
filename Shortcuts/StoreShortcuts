import tkinter as tk
import webbrowser
import subprocess

def root_design():
    root=tk.Tk()
    root.title("Store Inventory Shortcuts ")
    root.geometry("600x300")
    root.config(bg="white")
    
    title_label=tk.Label(root,font=("Arial",12),bg="white",text="All IC programs and URLs:")
    title_label.pack()

    button_frame = tk.Frame(root, background="white")
    button_frame.pack()

    buttons = [
        ("Fruit and Vegetables Vendor", lambda: open_url("https://domf5oio6qrcr.cloudfront.net/medialibrary/11499/3b360279-8b43-40f3-9b11-604749128187.jpg")),
        ("Dairy Vendor", lambda: open_url("https://domf5oio6qrcr.cloudfront.net/medialibrary/9685/iStock-544807136.jpg")),
        ("Meat Vendor", lambda: open_url("https://www.safefood.net/getmedia/94101697-3c3f-4fe1-8ae8-5b595d3814ba/medium-rare-steak.jpg?w=2000&h=1333&ext=.jpg&width=1360&resizemode=force")),
        ("Plastic Bags Vendor", lambda: open_url("https://s7d1.scene7.com/is/image/CENODS/09237-cover-plasticbag?$twitter$")),
        ("Drinks Vendor", lambda: open_url("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVgUwxJgqRBQ9vKFDFRw9zKVNrJfTKNK4py0ncsx_deKzoWArsoH4knv9nfuruFm_xoDc&usqp=CAU")),
        ("Store's Instagram", lambda: open_url("https://www.instagram.com/")),
        ("Duplicate Product Number Checker", lambda: run_prog("duplicateProduct.py"))
    ]
    
    row_counter = 0
    column_counter = 0

    for name, command in buttons:
        button = tk.Button(button_frame, text=name, command=command, width=30, height=2, font=("Arial", 12), bg="#FF99CC", fg='black', borderwidth=1)
        button.grid(row=row_counter, column=column_counter, padx=10, pady=10)
        changeOnHover(button, "#FF66B2", "#FF99CC")
        
        column_counter += 1
        if column_counter == 2:
            column_counter = 0
            row_counter += 1
                
    root.mainloop()


def changeOnHover(button, hover, leave):
    button.bind("<Enter>", func=lambda e: button.config(bg=hover))
    button.bind("<Leave>", func=lambda e: button.config(bg=leave))


def open_url(url):
    webbrowser.open(url)


def run_prog(prog):
    subprocess.Popen(prog, shell=True)


root_design()
