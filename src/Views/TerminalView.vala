/*
 * TerminalView.vala
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


public class TerminalView : Gtk.Box, BaseView {
    
    private Vte.Terminal _terminal;
    
    public TerminalView () {
        Object (orientation: Gtk.Orientation.VERTICAL, spacing: 0);
    }
    
    construct {
        
        _terminal = new Vte.Terminal ();
        this.pack_start (_terminal, false, false, 0);
        
    }
    
    public bool create () {
        return true;
    }
    
    
    public static GLib.Type register_type () {return typeof (TerminalView);}

}

