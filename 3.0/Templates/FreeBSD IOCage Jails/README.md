Zabbix Template for FreeBSD IOCage

Dependancies:

IOCage 			   	Jail Manager utilizing ZFS 
Zabbix_Agentd					
gsed-4.2.2                     	The GNU stream editor


1. install gsed from packages

	pkg install gsed-4.2.2

2. lace UserParameters.conf file in same directory as zabbix_agentd.conf and add the following line

	Include=/usr/local/etc/zabbix24/UserParameters.conf 

Change the directory as needed for your installation.

3. Create new values mapping for Jail run states
	IOCage Jail Run Status	
	0 ⇒ Down

	1 ⇒ Up

4. Import template zbx_FreeBSD_IOCage_Jails_templates.xml
