#!/bin/sh
case "$1" in
        start|startup)
                /sbin/telnetd -b 127.0.0.1:223
                ;;
        stop|shutdown)
                killall -9 telnetd
                ;;                              
        *)
                exit 0
                ;;              
esac

exit 0
