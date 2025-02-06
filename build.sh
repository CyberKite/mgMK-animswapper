#!/usr/bin/bash
find "$BUILDPATH" -type l -execdir sh -c 'cp $(readlink -f "{}"; rm "{}") "{}"' \;
rm -r "${BUILDPATH}/strings/anim_credits/common-notices/"

rm $BUILDPATH/{update.json,changelog.md}