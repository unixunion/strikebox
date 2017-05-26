# Strikebox

Creates a matchbox server out of a ubuntu 17.04 machine. 

## Requirements for Virtualbox Testing

matchbox host with a "internal" nw interface 10.10.10.1
matchbox host with a bridged / natted interface to HOSTOS for internet access
node on the same "internal" nw that the 10.10.10.1 interface is on.

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

## Terraform

See matchbox/files/psimax for terraform examples. See Instructions: https://github.com/coreos/matchbox/tree/master/examples/terraform/etcd3-install
