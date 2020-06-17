SOURCE="https://www.realvnc.com/download/file/viewer.files/VNC-Viewer-6.20.529-Linux-x64"
DESTINATION="realvnc"
OUTPUT="RealVNC.AppImage"


all:
	echo "Building: $(OUTPUT)"
	wget --output-document=$(DESTINATION) --continue $(SOURCE)
	
	mkdir -p ./build
	rm -rf AppDir/application
	
	mkdir --parents AppDir/application
	cp -r $(DESTINATION) AppDir/application
	chmod -R +x AppDir/application/*

	chmod +x AppDir/AppRun

	export ARCH=x86_64 && bin/appimagetool.AppImage AppDir $(OUTPUT)
	chmod +x $(OUTPUT)

	rm -f $(DESTINATION)
	rm -rf AppDir/application
	rm -rf build
