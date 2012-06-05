#
# This file is part of the NML build framework
# NML build framework is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, version 2.
# NML build framework is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# See the GNU General Public License for more details. You should have received a copy of the GNU General Public License along with NML build framework. If not, see <http://www.gnu.org/licenses/>.
#

# Definition of the grfs
GRF_FILE            := dutchtrains.grf
MAIN_SRC_FILE       := src/dutchtrains.pnml
# GFX_LIST_FILES      := gfx/png_source_list

# Directory structure
SRC_DIR             := src
DOC_DIR             := docs
SCRIPT_DIR          := scripts
LANG_DIR            := lang

# Documentation files:
DOC_FILES = docs/readme.txt docs/license.txt docs/changelog.txt

# List of all files which will get shipped
# DOC_FILES = readme, changelog and license
# GRF_FILENAME = MAIN_FILENAME_SRC with the extention .grf
# Add any additional, not usual files here, too, including
# their relative path to the root of the repository
BUNDLE_FILES           = $(GRF_FILE) $(DOC_FILES)

# Replacement strings in the source and in the documentation
# You may only change the values, not add new definitions
# (unless you know where to add them in other places, too)
REPLACE_TITLE       := {{GRF_TITLE}}
REPLACE_GRFID       := {{GRF_ID}}
REPLACE_REVISION    := {{REPO_REVISION}}
REPLACE_FILENAME    := {{FILENAME}}
REPLACE_MD5SUM      := {{GRF_MD5}}


# general definitions (no rules!)
-include Makefile.dist
include $(SCRIPT_DIR)/Makefile.def

# target 'all'
include $(SCRIPT_DIR)/Makefile.all
# target 'depend' (not implemented)
# include $(SCRIPT_DIR)/Makefile.dep
-include Makefile.gfx.dep

# target nml
include $(SCRIPT_DIR)/Makefile.nml
# target 'gfx' which builds all needed sprites
# Only a special gfx target for gimp exists so far
include $(SCRIPT_DIR)/Makefile.gimp
# target 'lng' which builds the lang/*.lng files
include $(SCRIPT_DIR)/Makefile.lng
# target 'grf' which builds the grf from the nml
include $(SCRIPT_DIR)/Makefile_grf
# target 'doc' which builds the docs
include $(SCRIPT_DIR)/Makefile.doc

# target 'bundle' and bundle_xxx which builds the distribution files
# and the distribution bundles like bundle_tar, bundle_zip, ...
include $(SCRIPT_DIR)/Makefile.bundle
# target 'bundle_src which builds source bundle
include $(SCRIPT_DIR)/Makefile.bundlesrc
# target 'install' which installs the grf
include $(SCRIPT_DIR)/Makefile.install

# misc. convenience targets like 'langcheck'
-include $(SCRIPT_DIR)/Makefile.misc
