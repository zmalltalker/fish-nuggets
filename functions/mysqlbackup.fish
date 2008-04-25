function mysqlbackup -d "Dump MySQL database"
	mysqldump --add-drop-table --single-transaction --allow-keywords --hex-blob --quick -u $MYSQL_USER -p --set-variable=max_allowed_packet=1000000000 $argv
end