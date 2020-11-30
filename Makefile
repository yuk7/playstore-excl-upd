OUT_ZIP=PEU.zip
SH=sh

all: $(OUT_ZIP)

zip: $(OUT_ZIP)
$(OUT_ZIP): META-INF module.prop
	@echo -e '\e[1;31mBuilding $(OUT_ZIP)\e[m'
	bsdtar -a -cf $(OUT_ZIP) *

test:
	$(SH) -n META-INF/com/google/android/update-binary
	$(SH) -n META-INF/com/google/android/updater-script
	$(SH) -n customize.sh
	$(SH) -n service.sh

clean:
	rm -f $(OUT_ZIP)
