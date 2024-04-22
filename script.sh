#!/bin/bash

TIME_SLOTS=$(curl -s https://my.uscis.gov/appointmentscheduler-appointment/field-offices/state/WA | /usr/local/bin/jq '.[0].timeSlots | length')

echo "Num time slots: $TIME_SLOTS"

# check if time slot is available
# publish to slack if available
if [ $TIME_SLOTS -gt 0 ]; then
	curl -X POST -H 'Content-type: application/json' --data '{"text":"Time slot available. Go to: https://my.uscis.gov/appointmentscheduler-appointment/ca/en/office-search"}' https://hooks.slack.com/services/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	
fi
