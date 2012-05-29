/***********************************************************************************************************************
 *      
 *      MainWindow.vala
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
namespace Manager {
    
    public class Window : Gtk.Window {
        
        Gtk.UIManager   _ui_manager;
        
        Gtk.Box         _main_box;
        Gtk.Paned       _hpaned;
        

        Gtk.Notebook    _view;
    
        public Window () {
            
            this.set_position (Gtk.WindowPosition.CENTER);
            this.destroy.connect (Gtk.main_quit);
            
            _main_box = new Gtk.Box (Gtk.Orientation.VERTICAL, 0);
            
            _ui_manager = new Gtk.UIManager ();
            
            _hpaned = new Gtk.Paned (Gtk.Orientation.HORIZONTAL);
            _hpaned.set_position (150);
            _main_box.pack_end (_hpaned, true, true, 0);

            _view = new Gtk.Notebook ();
            _hpaned.add2 (_view);
            
            FindPane finder = new FindPane ();
            _hpaned.add1 (finder);
            
            //this.create_search ();
            
            this.add (_main_box);
            
            this.show_all ();

        }
        
        public void create_search (string directory, string expression) {
            
            SearchResults search_results = new SearchResults ();
            _view.append_page (search_results);
            
            search_results.search (directory, expression);
            
            //view.show_all ();
        }
    }
}


