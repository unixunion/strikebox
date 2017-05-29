# Strikebox

Creates a matchbox server out of a ubuntu 17.04 machine. 

## Requirements for Virtualbox Testing

A matchbox host, and multiple node hosts.

The matchbox host has a "internal" nw interface 10.10.10.1/24
The matchbox host has a bridged / natted interface to HOSTOS for internet access
node on the same "internal" nw that the 10.10.10.1 interface is on.
The matcbox host has nat and ip_forward enabled from the internal interface to public.

## Status

Very rough ugly-as-fuck impl.

## Playbooks

Some public playbooks have been "fixed" due to syntax issues, hence the temporary creation of a playbooks dir.

# Spec out a ETCD Cluster

Gather the MAC addresses from your NODE instances, and ammend configs as follows...

## DHCP

Add mac addresses of machines which need fixed IP's in the dhcp vars in netboot.yaml, this is
for etcd-1 and etcd-2

## DNS

Add FQDN's to a BIND master zone file. Zone files are in resmo.bind/files/masters, then add the zone files to the var: bind_config_master_zones, hack in your own or re-use psimax.local.

## Matchbox

A simple playbook to install matchbox, shouldn't need dicking...

## Provision

ansible-playbook -i hosts playbooks/netboot.yaml -vvv

Certs end up in ~/.matchbox for client, and /etc/matchbox/ for server

### If cert issues

Refer to generating TLS certificate in https://coreos.com/matchbox/docs/latest/deployment.html

## Terraform

See matchbox/files/psimax for terraform examples. See Instructions: https://github.com/coreos/matchbox/tree/master/examples/terraform/etcd3-install

But quick note, edit the variables to include SSH key, path to certs, 
edit etcd3.tf, specify mac addresses of etcd cluster nodes

terraform plan
terraform apply

This renders /var/lib/matchbox/groups/etcd-[1,2].json

## NW Boot

Download IPXE.ISO, because virtualbox ipxe is weak, boot your nodes using that ISO

## NW Boot

Download IPXE.ISO, because virtualbox ipxe is weak, boot your nodes using that ISO
