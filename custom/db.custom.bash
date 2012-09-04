function pgstart(){
 /usr/local/bin/pg_ctl start -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log
}

function pgstop(){
 /usr/local/bin/pg_ctl stop -m fastg
}
