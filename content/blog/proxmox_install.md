+++
title = "Proxmox"
description = "Proxmox setup"
# The date of the post
date = 2025-07-01
# The last updated date of the post
updated = 2025-07-01

[extra]
# Enable comments
comment = false
# Enable KaTeX support
math = false
# Enable Mermaid support
mermaid = false
[extra.cover]
# Path to the cover image
image = ""
# A description of the cover image
alt = ""
+++

# Guide to Setup Proxmox

This guide assume proxmox have been already installed on zfs with systemd boot manager.

## 1. Initial setup 

Open webui by going to proxmox_host_ip:8006.

Login as root, disable enterprise repository and enable no-subscription reposity

Head to Shell and update repos with 

    apt update

and upgrade the whole system with

    apt dist-upgrade

then reboot

    reboot

## 2. Enable intel gvt-g to have VMs slice of gpu

### 2.1 Edit kernel Boot Option

Open /etc/kernel/cmdline with your text editor

Add following line after boot=zfs

    quiet intel_iommu=on i915.enable_gvt=1 drm.debug=0

### 2.2 Add modules

Open /etc/modules and add

    # Modules required for PCI passthrough
    vfio
    vfio_iommu_type1
    vfio_pci
    vfio_virqfd
    
    # Modules required for Intel GVT-g Split
    kvmgt

### 2.3 To update configuration

Run `update-initramfs -u -k all` and `proxmox-boot-tool refresh`

then `reboot`

## 3. Install & Enable Powertop at startup

Install powertop with

apt install powertop

Create a file `/etc/systemd/system/powertop.service` with text editor

    [Unit]
    Description=Powertop Auto-Tune
    
    [Service]
    Type=oneshot
    ExecStart=/usr/sbin/powertop --auto-tune
    RemainAfterExit=yes
    
    [Install]
    WantedBy=multi-user.target

Save & exit

Enable & start unit with 

    systemctl enable --now powertop.service
