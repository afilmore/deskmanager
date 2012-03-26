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

//~ static const string main_menu_xml = """
//~ <menubar>
//~   <menu action="FileMenu">
//~     <menuitem action="New"/>
//~     <menuitem action="Close"/>
//~   </menu>
//~   
//~   <menu action="EditMenu">
//~     <menuitem action="Cut"/>
//~     <menuitem action="Copy"/>
//~     <menuitem action="Paste"/>
//~     <menuitem action="Del"/>
//~     <separator/>
//~     <menuitem action="Rename"/>
//~     <menuitem action="Link"/>
//~     <menuitem action="MoveTo"/>
//~     <menuitem action="CopyTo"/>
//~     <separator/>
//~     <menuitem action="SelAll"/>
//~     <menuitem action="InvSel"/>
//~     <separator/>
//~     <menuitem action="Pref"/>
//~   </menu>
//~   
//~   <menu action="GoMenu">
//~     <menuitem action="Prev"/>
//~     <menuitem action="Next"/>
//~     <menuitem action="Up"/>
//~     <separator/>
//~     <menuitem action="Home"/>
//~     <menuitem action="Desktop"/>
//~     <menuitem action="Computer"/>
//~     <menuitem action="Trash"/>
//~     <menuitem action="Network"/>
//~     <menuitem action="Apps"/>
//~   </menu>
//~   
//~   <menu action="BookmarksMenu">
//~     <menuitem action="AddBookmark"/>
//~   </menu>
//~   
//~   <menu action="ViewMenu">
//~     <menuitem action="ShowHidden"/>
//~     <separator/>
//~     <menuitem action="IconView"/>
//~     <menuitem action="CompactView"/>
//~     <menuitem action="ThumbnailView"/>
//~     <menuitem action="ListView"/>
//~     <separator/>
//~     <menu action="Sort">
//~       <menuitem action="Desc"/>
//~       <menuitem action="Asc"/>
//~       <separator/>
//~       <menuitem action="ByName"/>
//~       <menuitem action="ByMTime"/>
//~     </menu>
//~   </menu>
//~   
//~   <menu action="HelpMenu">
//~     <menuitem action="About"/>
//~   </menu>
//~ </menubar>
//~ 
//~ <toolbar>
//~     <toolitem action="New"/>
//~     <toolitem action="Prev"/>
//~     <toolitem action="Up"/>
//~     <toolitem action="Home"/>
//~     <toolitem action="Go"/>
//~ </toolbar>
//~ 
//~ <popup>
//~   <menu action="CreateNew">
//~     <menuitem action="NewFolder"/>
//~     <menuitem action="NewBlank"/>
//~   </menu>
//~   
//~   <separator/>
//~   
//~   <menuitem action="Paste"/>
//~   
//~   <menu action="Sort">
//~     <menuitem action="Desc"/>
//~     <menuitem action="Asc"/>
//~     <separator/>
//~     <menuitem action="ByName"/>
//~     <menuitem action="ByMTime"/>
//~   </menu>
//~   
//~   <menuitem action="ShowHidden"/>
//~   
//~   <separator/>
//~   
//~   <menuitem action="Prop"/>
//~ </popup>
//~ 
//~ <accelerator action="Location"/>
//~ <accelerator action="Location2"/>
//~ 
//~ """;
//~ 
//~ static GtkActionEntry main_win_actions[]=
//~ {
//~     {"FileMenu", null, N_("_File"), null, null, null},
//~         {"New", GTK_STOCK_NEW, N_("_New Window"), "<Ctrl>N", null, G_CALLBACK(on_new_win)},
//~         {"Close", GTK_STOCK_CLOSE, N_("_Close Window"), "<Ctrl>W", null, G_CALLBACK(on_close_win)},
//~     {"EditMenu", null, N_("_Edit"), null, null, null},
//~         {"Cut", GTK_STOCK_CUT, null, null, null, G_CALLBACK(on_cut)},
//~         {"Copy", GTK_STOCK_COPY, null, null, null, G_CALLBACK(on_copy)},
//~         {"Paste", GTK_STOCK_PASTE, null, null, null, G_CALLBACK(on_paste)},
//~         {"Del", GTK_STOCK_DELETE, null, null, null, G_CALLBACK(on_del)},
//~         {"Rename", null, N_("Rename"), "F2", null, G_CALLBACK(on_rename)},
//~         {"Link", null, N_("Create Symlink"), null, null, null},
//~         {"MoveTo", null, N_("Move To..."), null, null, G_CALLBACK(on_move_to)},
//~         {"CopyTo", null, N_("Copy To..."), null, null, G_CALLBACK(on_copy_to)},
//~         {"SelAll", GTK_STOCK_SELECT_ALL, null, null, null, G_CALLBACK(on_select_all)},
//~         {"InvSel", null, N_("Invert Selection"), null, null, G_CALLBACK(on_invert_select)},
//~         {"Pref", GTK_STOCK_PREFERENCES, null, null, null, null},
//~     {"ViewMenu", null, N_("_View"), null, null, null},
//~         {"Sort", null, N_("_Sort Files"), null, null, null},
//~     {"HelpMenu", null, N_("_Help"), null, null, null},
//~         {"About", GTK_STOCK_ABOUT, null, null, null, G_CALLBACK(on_about)},
//~     {"GoMenu", null, N_("_Go"), null, null, null},
//~         {"Prev", GTK_STOCK_GO_BACK, N_("Previous Folder"), "<Alt>Left", N_("Previous Folder"), G_CALLBACK(on_go_back)},
//~         {"Next", GTK_STOCK_GO_FORWARD, N_("Next Folder"), "<Alt>Right", N_("Next Folder"), G_CALLBACK(on_go_forward)},
//~         {"Up", GTK_STOCK_GO_UP, N_("Parent Folder"), "<Alt>Up", N_("Go to parent Folder"), G_CALLBACK(on_go_up)},
//~         {"Home", "user-home", N_("Home Folder"), "<Alt>Home", N_("Home Folder"), G_CALLBACK(on_go_home)},
//~         {"Desktop", "user-desktop", N_("Desktop"), null, N_("Desktop Folder"), G_CALLBACK(on_go_desktop)},
//~         {"Computer", "computer", N_("My Computer"), null, null, G_CALLBACK(on_go_computer)},
//~         {"Trash", "user-trash", N_("Trash Can"), null, null, G_CALLBACK(on_go_trash)},
//~         {"Network", GTK_STOCK_NETWORK, N_("Network Drives"), null, null, G_CALLBACK(on_go_network)},
//~         {"Apps", "system-software-install", N_("Applications"), null, N_("Installed Applications"), G_CALLBACK(on_go_apps)},
//~         {"Go", GTK_STOCK_JUMP_TO, null, null, null, G_CALLBACK(on_go)},
//~     {"BookmarksMenu", null, N_("_Bookmarks"), null, null, null},
//~         {"AddBookmark", GTK_STOCK_ADD, N_("Add To Bookmarks"), null, N_("Add To Bookmarks"), null},
//~     /* for accelerators */
//~     {"Location", null, null, "<Alt>d", null, G_CALLBACK(on_location)},
//~     {"Location2", null, null, "<Ctrl>L", null, G_CALLBACK(on_location)},
//~     /* for popup menu */
//~     {"CreateNew", GTK_STOCK_NEW, null, null, null, null},
//~     {"NewFolder", "folder", N_("Folder"), null, null, G_CALLBACK(on_create_new)},
//~     {"NewBlank", "text-x-generic", N_("Blank FIle"), null, null, G_CALLBACK(on_create_new)},
//~     {"Prop", GTK_STOCK_PROPERTIES, null, null, null, G_CALLBACK(on_prop)}
//~ };
//~ 
//~ static GtkToggleActionEntry main_win_toggle_actions[]=
//~ {
//~     {"ShowHidden", null, N_("Show _Hidden"), "<Ctrl>H", null, G_CALLBACK(on_show_hidden), FALSE}
//~ };
//~ 
//~ static GtkRadioActionEntry main_win_mode_actions[]=
//~ {
//~     {"IconView", null, N_("_Icon View"), null, null, FM_FV_ICON_VIEW},
//~     {"CompactView", null, N_("_Compact View"), null, null, FM_FV_COMPACT_VIEW},
//~     {"ThumbnailView", null, N_("Thumbnail View"), null, null, FM_FV_THUMBNAIL_VIEW},
//~     {"ListView", null, N_("Detailed _List View"), null, null, FM_FV_LIST_VIEW},
//~ };
//~ 
//~ static GtkRadioActionEntry main_win_sort_type_actions[]=
//~ {
//~     {"Asc", GTK_STOCK_SORT_ASCENDING, null, null, null, GTK_SORT_ASCENDING},
//~     {"Desc", GTK_STOCK_SORT_DESCENDING, null, null, null, GTK_SORT_DESCENDING},
//~ };
//~ 
//~ static GtkRadioActionEntry main_win_sort_by_actions[]=
//~ {
//~     {"ByName", null, N_("By _Name"), null, null, COL_FILE_NAME},
//~     {"ByMTime", null, N_("By _Modification Time"), null, null, COL_FILE_MTIME}
//~ };
//~ 
//~ 
//~ static const string folder_menu_xml = """
//~ <popup>
//~   <placeholder name="ph1">
//~     <menuitem action="NewWin"/>
//~   </placeholder>
//~ </popup>
//~ """;
//~ 
//~ /* Action entries for pupup menus */
//~ static GtkActionEntry folder_menu_actions[]=
//~ {
//~     /* {"NewTab", GTK_STOCK_NEW, N_("Open in New Tab"), null, null, G_CALLBACK(on_open_in_new_tab)}, */
//~     {"NewWin", GTK_STOCK_NEW, N_("Open in New Window"), null, null, G_CALLBACK(on_open_in_new_win)},
//~     {"Search", GTK_STOCK_FIND, null, null, null, null}
//~ };


namespace Dm {
    
    class Window : Gtk.Window {
        
        Gtk.UIManager _ui_manager;
        Gtk.Box _main_box;
        Gtk.Toolbar _toolbar;
        Gtk.Paned _hpaned;
        
        // content...
        Gtk.TreeView _left_pane;
        Gtk.TreeView _folder_view;
    
        public Window () {
        }
        
        public bool create () {
            
            _main_box = new Gtk.Box (Gtk.Orientation.VERTICAL, 0);
            
            _ui_manager = new Gtk.UIManager ();
            
            this._create_menu ();

            _hpaned = new Gtk.Paned (Gtk.Orientation.HORIZONTAL);
            _hpaned.set_position (150);
            _main_box.pack_start (_hpaned, true, true, 0);

            this._create_pane ();
            
            this._create_view ();
            
            this._create_statusbar ();
            
            this.add (_main_box);
            
            this.show_all ();

//~             fm_folder_view_set_show_hidden(FM_FOLDER_VIEW(_folder_view), FALSE);
//~             fm_main_win_chdir(win, fm_path_get_home());

            _folder_view.grab_focus ();
            
            return;
        }
        
        private void _create_menu () {
            
//~             /* create menu bar and toolbar */
//~ 
//~             Gtk.ActionGroup act_grp = new Gtk.ActionGroup ("Main");
//~             act_grp.add_actions (main_win_actions);
//~             act_grp.add_toggle_actions (main_win_toggle_actions);
//~             act_grp.add_radio_actions (main_win_mode_actions, FM_FV_ICON_VIEW, on_change_mode);
//~             act_grp.add_radio_actions (main_win_sort_type_actions, GTK_SORT_ASCENDING, on_sort_type);
//~             act_grp.add_radio_actions (main_win_sort_by_actions, 0, on_sort_by);
//~             _ui_manager.insert_action_group (act_grp, 0);
//~ 
//~             Gtk.AccelGroup accel_grp = _ui_manager.get_accel_group ();
//~             this.add_accel_group (accel_grp);
//~ 
//~             _ui_manager.add_ui_from_string (main_menu_xml, -1, null);
//~ 
//~             Gtk.MenuBar menubar = _ui_manager.get_widget("/menubar") as Gtk.MenuBar;
//~ 
//~             _toolbar = _ui_manager.get_widget("/toolbar") as Gtk.Toolbar;
//~             /* FIXME: should make these optional */
//~             _toolbar.set_icon_size(GTK_ICON_SIZE_SMALL_TOOLBAR);
//~             _toolbar.set_style(GTK_TOOLBAR_ICONS);
//~ 
//~             /* create 'Next' button manually and add a popup menu to it */
//~             toolitem = g_object_new(GTK_TYPE_MENU_TOOL_BUTTON, NULL);
//~             _toolbar.insert(GTK_TOOLBAR(_toolbar), toolitem, 2);
//~             gtk_widget_show(GTK_WIDGET(toolitem));
//~             act = _ui_manager.get_action("/menubar/GoMenu/Next");
//~             gtk_activatable_set_related_action(GTK_ACTIVATABLE(toolitem), act);
//~ 
//~             /* set up history menu */
//~             _nav_history = fm_nav_history_new();
//~             _history_menu = gtk_menu_new();
//~             gtk_menu_tool_button_set_menu(GTK_MENU_TOOL_BUTTON(toolitem), _history_menu);
//~             g_signal_connect(toolitem, "show-menu", G_CALLBACK(on_show_history_menu), win);
//~ 
//~             _popup = _ui_manager.get_widget("/popup");
//~             gtk_menu_attach_to_widget(GTK_MENU(_popup), GTK_WIDGET(win), NULL);
//~ 
//~             gtk_box_pack_start( (GtkBox*)_main_box, menubar, FALSE, TRUE, 0 );
//~             gtk_box_pack_start( (GtkBox*)_main_box, _toolbar, FALSE, TRUE, 0 );
//~ 
//~ 
//~ 
//~             /* load bookmarks menu */
//~             load_bookmarks(win, _ui_manager);
//~ 
//~ 
//~ 
//~ 
//~ 
//~             /* the location bar */
//~             _location = fm_path_entry_new();
//~             g_signal_connect(_location, "activate", on_entry_activate, win);
//~ 
//~             toolitem = gtk_tool_item_new();
//~             gtk_container_add( GTK_CONTAINER(toolitem), _location );
//~             gtk_tool_item_set_expand(GTK_TOOL_ITEM(toolitem), TRUE);
//~             _toolbar.insert((GtkToolbar*)_toolbar, toolitem, _toolbar.get_n_items(GTK_TOOLBAR(_toolbar)) - 1 );
        }
        
        private void _create_pane () {    
            
            /* places left pane */
            
//            _left_pane = new Gtk.TreeView ();
            _left_pane = new Gtk.Notebook ();
            
            // insert a ScrolledWindow
            // insert a view.... treeview... etc....
            
//~             _left_pane = fm_side_pane_new();
//~             fm_side_pane_set_mode(_left_pane, FM_SP_PLACES);
            _hpaned.add1 (_left_pane);
        }
        
        private void _create_view () {
            /* folder view */
            _folder_view = new Gtk.TreeView ();
//~             _folder_view = fm_folder_view_new( FM_FV_ICON_VIEW );
//~             fm_folder_view_set_show_hidden(FM_FOLDER_VIEW(_folder_view), FALSE);
//~             fm_folder_view_sort(FM_FOLDER_VIEW(_folder_view), GTK_SORT_ASCENDING, COL_FILE_NAME);
//~             fm_folder_view_set_selection_mode(FM_FOLDER_VIEW(_folder_view), GTK_SELECTION_MULTIPLE);
//~             g_signal_connect(_folder_view, "clicked", on_file_clicked, win);
//~             g_signal_connect(_folder_view, "loaded", on_view_loaded, win);
//~             g_signal_connect(_folder_view, "sel-changed", on_sel_changed, win);

             _hpaned.add2 (_folder_view);
            /* link places view with folder view. */
//~             g_signal_connect(_left_pane, "chdir", G_CALLBACK(on_side_pane_chdir), win);
        }
            
        private void _create_statusbar () {
            
//~             /* status bar */
//~             _statusbar = gtk_statusbar_new();
//~             /* status bar column showing volume free space */
//~             gtk_widget_style_get(_statusbar, "shadow-type", &shadow_type, NULL);
//~             _vol_status = gtk_frame_new(NULL);
//~             gtk_frame_set_shadow_type(GTK_FRAME(_vol_status), shadow_type);
//~             gtk_box_pack_start(GTK_BOX(_statusbar), _vol_status, FALSE, TRUE, 0);
//~             gtk_container_add(GTK_CONTAINER(_vol_status), gtk_label_new(NULL));
//~ 
//~             gtk_box_pack_start( (GtkBox*)_main_box, _statusbar, FALSE, TRUE, 0 );
//~             _statusbar_ctx = gtk_statusbar_get_context_id(GTK_STATUSBAR(_statusbar), "status");
//~             _statusbar_ctx2 = gtk_statusbar_get_context_id(GTK_STATUSBAR(_statusbar), "status2");

        }
        
    }
}


