# Default Apache virtualhost template

<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    DocumentRoot {{ doc_root }}
{% set servernames = servername.split() %}
{% for servername in servernames %}
{% if loop.first %}
    ServerName {{ servername }}
{% else %}
    ServerAlias {{ servername }}
{% endif %}
{% endfor %}

    <Directory {{ doc_root }}>
    	AllowOverride FileInfo
    	Options Indexes FollowSymLinks
        Require all granted
    </Directory>

    Alias /phpmyadmin /var/www/phpmyadmin
    <Directory /var/www/phpmyadmin>
        Require all granted
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/{{ hostname }}.error.log
    CustomLog ${APACHE_LOG_DIR}/{{ hostname }}.access.log combined
</VirtualHost>