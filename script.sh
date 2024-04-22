#!/bin/bash

STATE="WA"
TIME_SLOTS=$(curl -s https://my.uscis.gov/appointmentscheduler-appointment/field-offices/state/$STATE | /usr/local/bin/jq '.[0].timeSlots | length')

echo "Num time slots: $TIME_SLOTS, STATE: $STATE"

# check if time slot is available
# publish to slack if available
if [ $TIME_SLOTS -gt 0 ]; then
	curl -X POST -H 'Content-type: application/json' --data '{"text":"Time slot available. Go to: https://my.uscis.gov/appointmentscheduler-appointment/ca/en/office-search"}' https://hooks.slack.com/services/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
fi
