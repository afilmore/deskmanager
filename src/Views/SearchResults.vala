/*
 * SearchResults.vala
 * 
 * Copyright 2012 Axel FILMORE <axel.filmore@gmail.com>
 * 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License Version 2.
 * http://www.gnu.org/licenses/gpl-2.0.txt
 * 
 * Purpose: 
 * 
 */


public class SearchResults : SimpleFolderView {
    
    
    public SearchResults () {
        _view.row_activated.connect(on_tree_clicked);
    }
    
    
    public bool create () {
        return true;
    }
    
    public void on_tree_clicked (Gtk.TreeView widget, Gtk.TreePath path, Gtk.TreeViewColumn column) {
        
        Value val;
        Gtk.TreeIter iter;
        model.get_iter(out iter, path);
        model.get_value(iter, Column.COL_FILE_NAME, out val);
        string filename = val.get_string();
        
        stdout.printf ("%s\n", filename);
        
        AppInfo app = AppInfo.create_from_commandline(@"xdg-open '$filename'", null, 0);
        app.launch(null, null);
        
    }
    
    public static GLib.Type register_type () {return typeof (SearchResults);}

}

