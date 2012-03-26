/*
 * Application.vala
 * 
 * Copyright 2012 Axel FILMORE <axel.filmore@gmail.com>
 * 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License Version 2.
 * http://www.gnu.org/licenses/gpl-2.0.txt
 * 
 * Purpose: Project Template.
 * 
 */

Application app;

public class Application {
    
    public Dm.Window? window;
    
    public bool run () {
        
        FindPane.register_type ();
        SimpleFolderView.register_type ();
        SearchResults.register_type ();
        TerminalView.register_type ();
        
        window = new Dm.Window ();
        window.create ();
        

        return true;
    }
    
    public Dm.Window? get_window () {return window;}
    
    private static int main (string[] args) {
        
        Gtk.init (ref args);
        
        app = new Application ();
        app.run ();
        
        Gtk.main ();
        return 0;
    }
}

