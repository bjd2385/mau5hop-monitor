#! /bin/bash
# Poll mau5hop.com for new autographs.

_URL="${URL:-"https://mau5hop.com/"}"
_DELAY="${INTERVAL:-60}"


pullSite()
{
    curl -s --connect-timeout $TIMEOUT $_URL | grep -iP "${SEARCH}"

    return 0
}


_items=""

aws sns publish --topic-arn "$SNS_ARN" --subject "Starting Mau5hop monitor" --message "Started Mau5hop monitor at $(date)" | jq -c

while true
do
    items="$(pullSite)"

    if [ "$_items" != "$items" ]
    then
        # Send a notification to all subscriptions.
	printf "%s: Sending a notification due to %s\\n" "$(date)" "$items"
        aws sns publish --topic-arn "$SNS_ARN" --subject "New Mau5hop Items Posted" --message "$items" | jq -c
    fi

    _items="$items"
    sleep "$_DELAY"
done
