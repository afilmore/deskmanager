/***********************************************************************************************************************
 *      
 *      Application.vala
 * 
 *      Copyright 2012 Axel FILMORE <axel.filmore@gmail.com>
 * 
 *      This program is free software; you can redistribute it and/or modify
 *      it under the terms of the GNU General Public License Version 2.
 *      http://www.gnu.org/licenses/gpl-2.0.txt
 * 
 *      Purpose:
 * 
 * 
 *  
 **********************************************************************************************************************/
Application global_app;

public class Application {
    
    private Manager.Window? _window;
    
    public bool run () {
        
        _window = new Manager.Window ();
        
        return true;
    }
    
    public void search (string directory, string expression) {
        
        _window.create_search (directory, expression);
    }
    
    private static int main (string[] args) {
        
        Gtk.init (ref args);
        
        global_app = new Application ();
        global_app.run ();
        
        Gtk.main ();
        return 0;
    }
}



