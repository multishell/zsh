#
# Makefile definitions for installing shell functions
#
# Copyright (c) 1999 Peter Stephenson
# All rights reserved.
#
# Permission is hereby granted, without written agreement and without
# license or royalty fees, to use, copy, modify, and distribute this
# software and to distribute modified versions of this software for any
# purpose, provided that the above copyright notice and the following
# two paragraphs appear in all copies of this software.
#
# In no event shall Peter Stephenson or the Zsh Development Group be liable
# to any party for direct, indirect, special, incidental, or consequential
# damages arising out of the use of this software and its documentation,
# even if Peter Stephenson and the Zsh Development Group have been advised of
# the possibility of such damage.
#
# Peter Stephenson and the Zsh Development Group specifically disclaim any
# warranties, including, but not limited to, the implied warranties of
# merchantability and fitness for a particular purpose.  The software
# provided hereunder is on an "as is" basis, and Peter Stephenson and the
# Zsh Development Group have no obligation to provide maintenance,
# support, updates, enhancements, or modifications.
#

# install functions, including those in subdirectories, creating
# install directory if necessary

install.fns:
	if test x$(fndir) != x && test x$(fndir) != xno; then \
	  sdir_top="$(sdir_top)" fndir="$(fndir)" sdir="$(sdir)" \
	  FUNCTIONS_INSTALL="$(FUNCTIONS_INSTALL)" \
	  FUNCTIONS_SUBDIRS="$(FUNCTIONS_SUBDIRS)" \
	  INSTALL_DATA="$(INSTALL_DATA)" \
	  DESTDIR="$(DESTDIR)" VERSION="$(VERSION)" \
	  $(SHELL) $(sdir_top)/Config/installfns.sh || exit 1; \
	fi; \
	exit 0

uninstall.fns:
	if test x$(fndir) != x && test x$(fndir) != xno; then \
	  fndir="$(fndir)" sdir="$(sdir)" \
	  FUNCTIONS_INSTALL="$(FUNCTIONS_INSTALL)" \
	  FUNCTIONS_SUBDIRS="$(FUNCTIONS_SUBDIRS)" \
	  DESTDIR="$(DESTDIR)" VERSION="$(VERSION)" \
	  $(SHELL) $(sdir_top)/Config/uninstallfns.sh || exit 1; \
	fi; \
	exit 0
