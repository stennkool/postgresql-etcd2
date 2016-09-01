#!/bin/sh
echo "Anouncing itself on cluster"
IP="$(awk 'NR==7 {print $1}' /etc/hosts)"
curl http://${clusternode}:2379/v2/keys/services/postgres -XPUT -d value="${IP}"
echo "running pgsql"
su postgres -c "/usr/lib/postgresql/9.5/bin/postgres -D /var/lib/postgresql/9.5/main -c config_file=/etc/postgresql/9.5/main/postgresql.conf"
