Zabbix Template for FreeBSD IOCage

Dependancies:
IOCage 			   				Jail Manager utilizing ZFS 
Zabbix_Agentd					
gsed-4.2.2                     	The GNU stream editor

LLD Discovery: Jails (running and stopped), VNET Interface, Hostname from Jail UUID. 

This template uses the UUID of the IOCage jail to track its resources. For instance, when a jail is restarted, it will assume a new Jail ID. If VNET/VIMAGE
is being used, the name of the interface on the host will change and as such, zabbix will drop the discovered item and create a new one, losing
old data (e.g. traffic statistics). With this template, IOCage jail can be stopped/started with items persisting the change in Jail ID. Also (though yet
to be tested) items should persist jails being migrated to new hosts that also employ IOCage. 

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
