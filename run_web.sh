#!/usr/bin/env bash

cd /webapps/
python manage.py migrate
python manage.py runserver

echo "from users.models import User; User.objects.create_superuser($PROD_USER,$PROD_USER_EMAIL,$PROD_USER_PASS)" | python manage.py shell