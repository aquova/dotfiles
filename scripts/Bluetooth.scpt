-- Requires 'blueutil'
set blueutil to "/usr/local/bin/blueutil"
set powerStatus to do shell script blueutil & " power"

if powerStatus is "1" then
do shell script blueutil & " power 0"
else if powerStatus is "0" then
do shell script blueutil & " power 1"
end if
