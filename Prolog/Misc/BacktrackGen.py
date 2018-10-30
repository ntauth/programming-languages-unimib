#! /usr/bin/env python
import sys
import tkinter as tk
import random as rnd

class TkApplication(tk.Frame):
    def __init__(self, master = None):
        tk.Frame.__init__(self, master)
        self.pack()
        self.createWidgets()
    
    def generate_grid(maxx, maxy):
        out = open('Grid.pl', 'w')
        out.write('%% -*- Mode: Prolog -*-\n\n')

    def generate_OnClick(self):
        self.generate_grid()

    def createWidgets(self):
        self.QUIT = tk.Button(self)
        self.QUIT["text"] = "Exit"
        self.QUIT["fg"]   = "red"
        self.QUIT["command"] =  self.quit

        self.QUIT.pack({"side": "left"})

        self.generate = tk.Button(self)
        self.generate["text"] = "Generate",
        self.generate["command"] = self.generate_OnClick

        self.foo.pack({"side": "right"})

    
if __name__ == '__main__':
    root = tk.Tk()

    tkApp = TkApplication(master = root)

    # Config
    tkApp.master.title('Backtrack Generator for Prolog')
    tkApp.master.minsize(1000, 800)

    tkApp.mainloop()
    root.destroy()
