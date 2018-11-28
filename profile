[ -f ~/.env ] && source ~/.env
export LANG=en_US.UTF-8
alias dbro="mysql --host=$dbro_url --user=$db_user --password=$db_password --database=$db_name"
alias zshreload="source ~/.zshrc"
alias aryan="mysql --host=$db_url --user=$db_user --password=$db_password --database=$db_name"
alias paydbro="mysql --host=$paydbro_url --user=$paydb_user --password=$paydb_password --database=$paydb_name"
alias wallet="mysql --host=$paydb_url --user=$paydb_user --password=$paydb_password --database=$paydb_name"
alias webtestssh="TERM=xterm-256color; ssh -tt -i $personal_key $user@$hop -tt ssh -i $company_key $company@$webtest_machine"
alias uigssh="TERM=xterm-256color; ssh -tt -i $personal_key $user@$hop -tt ssh -i $company_key $company@$uig_staging_machine"
alias watchdog="TERM=xterm-256color; ssh -i $personal_key $user@$hop"
alias cassm="TERM=xterm-256color; ssh -tt -i $personal_key $user@$hop -tt ssh -i $company_key $company@$cassandra_machine"
alias cassh="TERM=xterm-256color; ssh -tt -i $personal_key $user@$hop -tt ssh -i $company_key $company@$cassandra_machine -tt cqlsh $cassandra_ip"
alias prod_ssh="TERM=xterm-256color; ssh -tt -i $personal_key $user@$hop -tt ssh -i $company_key $company@$production_machine"
alias sales_ssh="TERM=xterm-256color; ssh -tt -i $personal_key $user@$hop -tt ssh -i $company_key $company@$sales_machine"
function dbq(){
	mysql --host=$dbro_url --user=$db_user --password=$db_password --database=$db_name -e $1
}
function paydbq(){
	mysql --host=$paydbro_url --user=$paydb_user --password=$paydb_password --database=$paydb_name -e $1
}

function webtestq(){
	ssh -tt -i $personal_key $user@$hop -tt ssh -i $company_key $company@$webtest_machine -tt $1
}

for i in dbro_url db_user db_password db_name db_url paydbro_url paydb_user paydb_password paydb_name personal_key user hop company_key company webtest_machine uig_staging_machine cassandra_machine cassandra_ip gmail_address gmail_password sales_machine production_machine city_id owm_api_key paydb_url
do
	unset $i
done
GOPATH=$HOME/go
PATH="$PATH:/usr/local/go/bin"
GOROOT="/usr/local/go"

