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
        Gtk.Toolbar     _toolbar;
        Gtk.Paned       _hpaned;
        
        // content...
        Gtk.Notebook _side;
        Gtk.Notebook _view;
    
        public Window () {
            this.set_position (Gtk.WindowPosition.CENTER);
            this.destroy.connect (Gtk.main_quit);
        }
        
        public bool create () {
            
            _main_box = new Gtk.Box (Gtk.Orientation.VERTICAL, 0);
            
            _ui_manager = new Gtk.UIManager ();
            
            this._create_menu ();

            _hpaned = new Gtk.Paned (Gtk.Orientation.HORIZONTAL);
            _hpaned.set_position (150);
            _main_box.pack_end (_hpaned, true, true, 0);

            this._create_side ();
            
            this._create_view ();
            
            this._create_statusbar ();
            
            this.add (_main_box);
            
            this.show_all ();

            return true;
        }
        
        private void _create_menu () {
        }
        
        private void _create_side () {    
            
            _side = new Gtk.Notebook ();
            _hpaned.add1 (_side);
            
            // insert a ScrolledWindow
            // insert a view.... treeview... etc....
            
            FindPane finder = Object.new (Type.from_name ("FindPane")) as FindPane;
            finder.create ();
            _side.append_page (finder);
            
        }
        
        private void _create_view () {
            
            _view = new Gtk.Notebook ();
            _hpaned.add2 (_view);
            
            //BaseView view = Object.new (Type.from_name ("SimpleFolderView")) as BaseView;
            TerminalView terminal = Object.new (Type.from_name ("TerminalView")) as TerminalView;
            
            _view.append_page (terminal);
            
            
        }
            
        private void _create_statusbar () {
            
        }
        
        public Gtk.ListStore create_search_results () {
//~             SimpleFolderView view = Object.new (Type.from_name ("SimpleFolderView")) as SimpleFolderView;
//~             _view.append_page (view);
//~             view.show_all ();
            SearchResults view = new SearchResults ();
            _view.append_page (view);
            view.show_all ();
            return view.model;
            
        }
    }
}


