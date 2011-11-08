#!/bin/sh

(curl -s 'http://feedburner.google.com/fb/a/pingSubmit?bloglink=http://pentandra.com' | grep -q 'Successfully pinged') && echo "Ping OK for pentandra.com. Feedburner now has new content." || echo "Ping failed for pentandra.com. Feedburner not updated."
