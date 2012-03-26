/*
 * SimpleFolderView.vala
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

    enum Column {
      COL_FILE_GICON = 0,
      COL_FILE_ICON,
      COL_FILE_NAME,
      COL_FILE_SIZE,
      COL_FILE_DESC,
      COL_FILE_PERM,
      COL_FILE_OWNER,
      COL_FILE_MTIME,
      COL_FILE_INFO,
      N_FOLDER_MODEL_COLS
    }
    

public class SimpleFolderView : Gtk.ScrolledWindow, BaseView {
    
    protected Gtk.TreeView _view;
    public Gtk.ListStore model;
    
    public SimpleFolderView () {
        Object (hadjustment: null, vadjustment: null);
    }
    
    construct {
        
        /* exo treeview permits the column to be the only activable column
         * and permits to activate items with single clic */
        this._view = new Gtk.TreeView ();
        this.model = new Gtk.ListStore (
                                            Column.N_FOLDER_MODEL_COLS,
                                            typeof (string),
                                            typeof (string),
                                            typeof (string),
                                            typeof (string),
                                            typeof (string),
                                            typeof (string),
                                            typeof (string),
                                            typeof (string),
                                            typeof (string)
                                        );
        
        _view.set_model (model);

        _view.set_rules_hint(true);
        
        Gtk.TreeViewColumn col = new Gtk.TreeViewColumn.with_attributes ("Name", new Gtk.CellRendererText (), "text", Column.COL_FILE_NAME);
        col.set_sort_column_id (Column.COL_FILE_NAME);
        col.set_expand (true);
        col.set_resizable (true);
        col.set_sizing (Gtk.TreeViewColumnSizing.FIXED);
        col.set_fixed_width (200);
        _view.append_column (col);

        col = new Gtk.TreeViewColumn.with_attributes ("Description", new Gtk.CellRendererText (), "text", Column.COL_FILE_DESC);
        col.set_resizable (true);
        col.set_sort_column_id (Column.COL_FILE_DESC);
        _view.append_column (col);

        col = new Gtk.TreeViewColumn.with_attributes ("Size", new Gtk.CellRendererText (), "text", Column.COL_FILE_SIZE);
        col.set_sort_column_id (Column.COL_FILE_SIZE);
        col.set_resizable (true);
        _view.append_column (col);

        col = new Gtk.TreeViewColumn.with_attributes ("Modified", new Gtk.CellRendererText (), "text", Column.COL_FILE_MTIME);
        col.set_resizable (true);
        col.set_sort_column_id (Column.COL_FILE_MTIME);
        _view.append_column (col);

        _view.set_search_column (Column.COL_FILE_NAME);

        _view.set_rubber_banding (true);

        this.set_policy (Gtk.PolicyType.AUTOMATIC, Gtk.PolicyType.AUTOMATIC);
        this.add (this._view);


//        _view.row_activated.connect(on_tree_clicked);
        
    }
    
    public bool create () {
        return true;
    }
    
    public bool populate () {
        
        Gtk.TreeIter iter;
        model.append (out iter);
        model.set (iter, Column.COL_FILE_NAME, "file-01.txt", Column.COL_FILE_DESC, "Text File", Column.COL_FILE_SIZE, "42,0 KB", Column.COL_FILE_MTIME, "01/04/1912");

        model.append (out iter);
        model.set (iter, Column.COL_FILE_NAME, "file-02.txt", Column.COL_FILE_DESC, "Text File", Column.COL_FILE_SIZE, "742,0 KB", Column.COL_FILE_MTIME, "01/04/1972");

        model.append (out iter);
        model.set (iter, Column.COL_FILE_NAME, "file-03.txt", Column.COL_FILE_DESC, "Video", Column.COL_FILE_SIZE, "4242,0 KB", Column.COL_FILE_MTIME, "01/04/1912");

        model.append (out iter);
        model.set (iter, Column.COL_FILE_NAME, "file-04.txt", Column.COL_FILE_DESC, "Secret File", Column.COL_FILE_SIZE, "242,0 KB", Column.COL_FILE_MTIME, "01/04/1922");

        model.append (out iter);
        model.set (iter, Column.COL_FILE_NAME, "file-05.txt", Column.COL_FILE_DESC, "Text File", Column.COL_FILE_SIZE, "142,0 KB", Column.COL_FILE_MTIME, "01/04/1952");

        model.append (out iter);
        model.set (iter, Column.COL_FILE_NAME, "file-06.txt", Column.COL_FILE_DESC, "Text File", Column.COL_FILE_SIZE, "42,0 KB", Column.COL_FILE_MTIME, "01/04/1912");

        return true;
    }
    
    public static GLib.Type register_type () {return typeof (SimpleFolderView);}

}

