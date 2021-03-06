#!/system/bin/sh
PKG_LIST_FILE=/cache/peulist.txt
PS_PKG_NAME=com.android.vending
PS_DATA_DIR=/data/data/${PS_PKG_NAME}
INTERVAL=60

MODDIR=${0%/*}
cd $MODDIR
LF="
"


PKG_LIST=`cat "${PKG_LIST_FILE}"`

while true
do
    EXEC_REMOVE=0
    DETECTED_PKGS=

    while read PKGNAME
    do
        if [ -n "$PKGNAME" ]; then
            SELECT_PKG=`./sqlite3 "$PS_DATA_DIR/databases/library.db" "SELECT doc_id FROM ownership WHERE doc_id='${PKGNAME}'"`
            if [ ! -z "${SELECT_PKG}" ]; then
                EXEC_REMOVE=1
                DETECTED_PKGS=${DETECTED_PKGS}${LF}${SELECT_PKG}
            fi
        fi
    done <<END
    $PKG_LIST
END

    if [ ${EXEC_REMOVE} -eq 1 ];then
        while read PKGNAME
        do
            if [ -n "$PKGNAME" ]; then
                ./sqlite3 "$PS_DATA_DIR/databases/auto_update.db" "DELETE FROM auto_update WHERE pk='${PKGNAME}'"
                ./sqlite3 "$PS_DATA_DIR/databases/library.db" "DELETE FROM ownership WHERE doc_id='${PKGNAME}'"
                ./sqlite3 "$PS_DATA_DIR/databases/localappstate.db" "DELETE FROM appstate WHERE package_name='${PKGNAME}'"
            fi
        done <<END
    $DETECTED_PKGS
END
    am force-stop ${PS_PKG_NAME}
    fi

    if grep -q -e "<boolean name=\"auto_update_enabled\" value=\"true\" />" -e "<boolean name=\"update_over_wifi_only\" value=\"true\" />" "$PS_DATA_DIR/shared_prefs/finsky.xml"; then
        sed -i.bak -e 's#<boolean name="auto_update_enabled" value="true" />#<boolean name="auto_update_enabled" value="false" />#g' "$PS_DATA_DIR/shared_prefs/finsky.xml"
        sed -i.bak -e 's#<boolean name="update_over_wifi_only" value="true" />#<boolean name="update_over_wifi_only" value="false" />#g' "$PS_DATA_DIR/shared_prefs/finsky.xml"
        am force-stop ${PS_PKG_NAME}
    fi

    sleep $INTERVAL
done
