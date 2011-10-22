#!/bin/sh

echo "Really publish this to http://pentandra.com? Type 'yes'."
read FOO
[[ "$FOO" = 'yes' ]]
