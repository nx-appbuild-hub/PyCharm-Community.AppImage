SOURCE="https://download-cf.jetbrains.com/python/pycharm-community-2020.2.1.tar.gz"
DESTINATION="build.tar.bz2"
OUTPUT="PyCharm-Community.AppImage"


all:
	echo "Building: $(OUTPUT)"
	wget -O $(DESTINATION)  $(SOURCE)

	tar -zxvf $(DESTINATION)
	rm -rf AppDir/opt

	mkdir --parents AppDir/opt/application
	mv pycharm-community-*/* AppDir/opt/application

	chmod +x AppDir/AppRun
	export ARCH=x86_64 && bin/appimagetool.AppImage AppDir $(OUTPUT)
	chmod +x $(OUTPUT)

	rm -rf pycharm-community-2019.2.4
	rm -f $(DESTINATION)
	rm -rf AppDir/opt
