#!/bin/sh

sigint_handler()
{
  kill $PID
  exit
}

trap sigint_handler INT

while true; do
  eval "$2" &
  PID=$!
  inotifywait -qq -e modify -e move -e create -e delete -e attrib $1
  kill $PID
done
