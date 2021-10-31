#!/bin/bash
rm "$1"
echo "export const EMU_PROT = 'https://';" >> "$1"
echo "export const EMU_FS_HOST = '8080-$WEB_HOST';" >> "$1"
echo "export const EMU_AUTH_HOST = '9099-$WEB_HOST';" >> "$1"
echo "export const EMU_FS_PORT = '443';" >> "$1"