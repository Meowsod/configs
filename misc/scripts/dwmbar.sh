#!/bin/sh

delim="|"

get_datetime() {
	TZ="Europe/Helsinki" date +"%a %d %b %Y | %I:%M %p %Z"
}

while :; do
	xsetroot -name "$(status)"
	sleep 1m
done
