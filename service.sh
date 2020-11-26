#!/system/bin/sh
PKG_LIST_FILE=/cache/peulist.txt
PS_DATA_DIR=/data/data/com.android.vending
INTERVAL=60

MODDIR=${0%/*}
cd $MODDIR


PKG_LIST=`cat "${PKG_LIST_FILE}"`

while true
do
    while read PKGNAME
    do
        if [ -n "$PKGNAME" ]; then
            ./sqlite3 "$PS_DATA_DIR/databases/library.db" "DELETE FROM ownership WHERE doc_id='${PKGNAME}'"
            ./sqlite3 "$PS_DATA_DIR/databases/localappstate.db" "DELETE FROM appstate WHERE package_name='${PKGNAME}'"
        fi
    done <<END
    $PKG_LIST
END
    sleep $INTERVAL
done