/***********************************************************************************************************************
 * FindPane.vala
 * 
 * Copyright 2012 Axel FILMORE <axel.filmore@gmail.com>
 * 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License Version 2.
 * http://www.gnu.org/licenses/gpl-2.0.txt
 * 
 * Purpose:
 *  
 **********************************************************************************************************************/


public class FindPane : Gtk.ScrolledWindow, BasePane {

    private Gtk.Entry _search_entry;
    Gtk.ListStore store;
    public FindPane () {
        Object (hadjustment: null, vadjustment: null);
    }
    
    construct {
    }
    
    public void set_model (Gtk.ListStore global_store) {
        store = global_store;
    }
    
    public bool create () {
        
        Gtk.Box _box;
        _box = new Gtk.Box (Gtk.Orientation.VERTICAL, 0);
        _search_entry = new Gtk.Entry ();
        _search_entry.set_placeholder_text("Search for ...");
        _search_entry.activate.connect( () => {
            this.search ();
        });
        _box.pack_start (_search_entry, false, false, 0);
        this.add_with_viewport (_box);
        return true;
    }
    
    public void search () {
        stdout.printf ("search\n");
        
        string root_dir = "/home/hotnuma";
        string ex = _search_entry.get_text ();
        
        // create the output view
        //Gtk.ListStore store = app.window.create_search_results ();
        Gtk.TreeIter iter;
        
        string output;
        string errors;
        int exit;
        
        try {
            stdout.printf ("run\n");
            Process.spawn_sync("/", {"find", root_dir, "-name", ex}, {}, SpawnFlags.SEARCH_PATH, null, out output, out errors, out exit);
        } catch (Error e) {
            stdout.printf ("errors\n");
            exit = 1;
            errors = e.message;
        }
        stdout.printf ("%s\n", output);
        if (exit == 0) {
            foreach (string row in output.split("\n")) {
                if (row != "") {
                    store.append(out iter);
                    store.set(iter, Column.COL_FILE_NAME, row);
                }
            }
        }
        stdout.printf ("exit\n");
        
    }
    
    
    public static Type register_type () {return typeof (FindPane);}
    
}

