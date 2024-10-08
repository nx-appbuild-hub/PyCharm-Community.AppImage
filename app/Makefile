# This software is a part of the A.O.D (https://apprepo.de) project
# Copyright 2020 Alex Woroschilow (alex.woroschilow@gmail.com)
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
PWD:=$(shell pwd)

.PHONY: all

all: clean init

	mkdir --parents $(PWD)/build/Boilerplate.AppDir/pycharm
	$(PWD)/bin/Apprepo.AppImage --destination=$(PWD)/build appdir boilerplate \
		libgdk-pixbuf2.0-0 libatk1.0-0 libatk-bridge2.0-0 libgtk2.0-0

	wget --output-document=${PWD}/build/build.tar.gz https://download.jetbrains.com/python/pycharm-community-2022.3.1.tar.gz
	tar -zxvf ${PWD}/build/build.tar.gz  --directory ${PWD}/build/

	echo ''                                                           >> $(PWD)/build/Boilerplate.AppDir/AppRun
	echo ''                                                           >> $(PWD)/build/Boilerplate.AppDir/AppRun
	echo 'LD_LIBRARY_PATH=$${LD_LIBRARY_PATH}:$${APPDIR}/pycharm'     >> $(PWD)/build/Boilerplate.AppDir/AppRun
	echo 'export LD_LIBRARY_PATH=$${LD_LIBRARY_PATH}'                 >> $(PWD)/build/Boilerplate.AppDir/AppRun
	echo ''                                                           >> $(PWD)/build/Boilerplate.AppDir/AppRun
	echo ''                                                           >> $(PWD)/build/Boilerplate.AppDir/AppRun
	echo '$${APPDIR}/pycharm/bin/pycharm.sh "$${@}"'                  >> $(PWD)/build/Boilerplate.AppDir/AppRun

	cp --recursive --force $(PWD)/build/pycharm*/* $(PWD)/build/Boilerplate.AppDir/pycharm/

	rm --force $(PWD)/build/Boilerplate.AppDir/*.desktop || true
	cp --force $(PWD)/AppDir/*.desktop $(PWD)/build/Boilerplate.AppDir/       || true
	cp --force $(PWD)/AppDir/*.png     $(PWD)/build/Boilerplate.AppDir/       || true
	cp --force $(PWD)/AppDir/*.svg     $(PWD)/build/Boilerplate.AppDir/       || true

	export ARCH=x86_64 && $(PWD)/bin/appimagetool.AppImage $(PWD)/build/Boilerplate.AppDir $(PWD)/PyCharm-Community.AppImage
	chmod +x $(PWD)/PyCharm-Community.AppImage

init:
	mkdir --parents $(PWD)/bin

	wget https://github.com/area-of-dev/apprepo.AppImage/releases/download/latest/apprepo.AppImage \
		--output-document=$(PWD)/bin/Apprepo.AppImage
	chmod +x $(PWD)/bin/Apprepo.AppImage

	wget https://github.com/AppImage/AppImageKit/releases/download/continuous/appimagetool-x86_64.AppImage \
		--output-document=$(PWD)/bin/appimagetool.AppImage
	chmod +x $(PWD)/bin/appimagetool.AppImage

clean:
	rm -rf $(PWD)/*.AppImage
	rm -rf $(PWD)/bin/*
	rm -rf $(PWD)/build
