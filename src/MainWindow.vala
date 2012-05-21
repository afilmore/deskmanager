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


namespace Dm {
    
    public class Window : Gtk.Window {
        
        Gtk.UIManager   _ui_manager;
        
        Gtk.Box         _main_box;
        Gtk.Paned       _hpaned;
        

        Gtk.Notebook _view;
        Gtk.ListStore _store;
    
        public Window () {
            this.set_position (Gtk.WindowPosition.CENTER);
            this.destroy.connect (Gtk.main_quit);
        }
        
        public bool create () {
            
            _main_box = new Gtk.Box (Gtk.Orientation.VERTICAL, 0);
            
            _ui_manager = new Gtk.UIManager ();
            
            _hpaned = new Gtk.Paned (Gtk.Orientation.HORIZONTAL);
            _hpaned.set_position (150);
            _main_box.pack_end (_hpaned, true, true, 0);

            this._create_view ();
            
            this._create_side ();
            
            this.add (_main_box);
            
            this.show_all ();

            return true;
        }
        
        private void _create_side () {    
            
            
            // insert a ScrolledWindow
            // insert a view.... treeview... etc....
            
            FindPane finder = Object.new (Type.from_name ("FindPane")) as FindPane;
            finder.create ();
            finder.set_model (_store);
            _hpaned.add1 (finder);
            
        }
        
        private void _create_view () {
            
            _view = new Gtk.Notebook ();
            _hpaned.add2 (_view);
            
            _store = app.window.create_search_results ();
        }
            
        public Gtk.ListStore create_search_results () {

            SearchResults view = new SearchResults ();
            _view.append_page (view);
            view.show_all ();
            return view.model;
        }
    }
}


