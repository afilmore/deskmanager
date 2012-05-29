/***********************************************************************************************************************
 *      
 *      FindPane.vala
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
public class FindPane : Gtk.ScrolledWindow {

    private Gtk.Entry   _search_entry;
    
    public FindPane () {
        
        Object (hadjustment: null, vadjustment: null);
        
        Gtk.Box box;
        box = new Gtk.Box (Gtk.Orientation.VERTICAL, 0);
        _search_entry = new Gtk.Entry ();
        _search_entry.set_placeholder_text("Search for ...");
        _search_entry.activate.connect( () => {
            this._search ();
        });
        
        box.pack_start (_search_entry, false, false, 0);
        this.add_with_viewport (box);
        
    }
    
    private void _search () {
        
        global_app.search ("/", _search_entry.get_text ());

    }
    
    public static Type register_type () {return typeof (FindPane);}
    
}

