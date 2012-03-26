## Process this file with automake to produce Makefile.in

bin_PROGRAMS = deskmanager

AM_CPPFLAGS = \
	-DPACKAGE_LOCALE_DIR=\""$(prefix)/$(DATADIRNAME)/locale"\" \
	-DPACKAGE_SRC_DIR=\""$(srcdir)"\" \
	$(DESK_MANAGER_CFLAGS) \
	$(VTE_CFLAGS)

AM_CFLAGS =\
	 -Wall\
	 -g

deskmanager_SOURCES = \
	Application.vala \
	MainWindow.vala \
	Side/BasePane.vala \
	Side/FindPane.vala \
	Views/BaseView.vala \
	Views/SimpleFolderView.vala \
	Views/SearchResults.vala \
	Views/TerminalView.vala

deskmanager_VALAFLAGS = \
	--vapidir=$(top_srcdir)/vapi \
	--pkg config \
	--pkg gtk+-3.0 \
	--pkg vte-2.90

deskmanager_LDFLAGS = \
	-Wl,--export-dynamic

deskmanager_LDADD = \
	$(DESK_MANAGER_LIBS) \
	$(VTE_LIBS)

CLEANFILES = $(patsubst %.vala,%.c,$(filter %.vala, $(SOURCES))) deskmanager_vala.stamp

