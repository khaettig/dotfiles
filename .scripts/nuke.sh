cd ~/Git/spotl.dockers/postgres/
sh backup.sh ~/Work/SQL/backup_$(date '+%Y_%m_%d_%H_%M_%S').sql
sh delete.sh
sleep 3
sh restore.sh ~/Work/SQL/clean_start.sql 1>/dev/null
cd -

cd ~/Git/spotl.media/
DJANGO_SETTINGS_MODULE=spotl.dev_settings .venv/bin/python3 manage.py migrate
cd -
