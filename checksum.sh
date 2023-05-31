#!/bin/sh
#
#
#
#
LIST="c64robots gfxfont.prg level-a level-b level-c level-d level-e \
    level-f level-g level-h level-i level-j level-k level-l level-m \
    music.c64 sprites.gfx tileset.gfx"

#LIST=$(ls *-64x)

status=0

for f in $LIST
do
    NEWSUM=$(md5sum $f)
    OLDSUM=$(grep " ${f}\$" original/checksums.txt)
    if [ "$NEWSUM" != "$OLDSUM" ]; then
        echo ERROR: $f MISMATCH:
        echo NEWSUM=$NEWSUM
        echo OLDSUM=$OLDSUM
        status=1
    fi
done
if [ "$status" = "0" ]; then
    echo "All file checksums match v1.2 distribution."
fi
exit $status
