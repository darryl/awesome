#!/bin/sh

rm db/development.sqlite3
rake db:migrate &&
rails s

