# Strikebox

Creates a matchbox server

## Status

Development, nothing works...

## Playbooks

Some public playbooks have been "fixed" due to syntax issues, hence the temporary creation of a playbooks dir.

## DHCP

Add mac addresses of machines which need fixed IP's in the dhcp vars in netboot.yaml

## DNS

Zone files are in resmo.bind/files/masters, then add the zone files to the var: bind_config_master_zones

## Matchbox

A simple playbook to install matchbox

### Post Ansible

Refer to generating TLS certificate in https://coreos.com/matchbox/docs/latest/deployment.html
