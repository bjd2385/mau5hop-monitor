#! /bin/bash
# Poll mau5hop.com for new autographs.

_URL="${URL:-"https://mau5hop.com/"}"


pullSite()
{
    curl -s --connect-timeout $TIMEOUT $_URL | grep -iP "(SIGNED|AUTOGRAPH|AUTOGRAPHED|INITIAL|INITIALS|SIGNATURE)"

    return 0
}


_DELAY="${INTERVAL:-60}"

# Set this to an empty string so I always get a notification on application start (to let me know it's running correctly).
# This should only fire if the above grep actually catches anything, however, so ensure the site has items listed.
_items=""
sleep "$_DELAY"

while true
do
    items="$(pullSite)"

    if [ "$_items" != "$items" ]
    then
        # Send a notification to all subscriptions.
	printf "Sending a notification due to %s\\n" "$items"
        aws sns publish --topic-arn "$SNS_ARN" --subject "New Mau5hop Items Posted" --message "$items" | jq -c
    fi

    _items="$items"
    sleep "$_DELAY"
done
