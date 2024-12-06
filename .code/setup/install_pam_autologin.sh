#!/bin/bash

grep -qxE 'auth(\s|\t)*optional(\s|\t)*pam_gnome_keyring\.so' /etc/pam.d/login  || echo 'auth optional pam_gnome_keyring.so' >> /etc/pam.d/login
grep -qxE 'session(\s|\t)*optional(\s|\t)*pam_gnome_keyring\.so(\s|\t)*auto_start' /etc/pam.d/login  || echo 'session optional pam_gnome_keyring.so auto_start' >> /etc/pam.d/login

grep -qxE 'password(\s|\t)*optional(\s|\t)*pam_gnome_keyring\.so' /etc/pam.d/passwd  || echo 'password optional pam_gnome_keyring.so' >> /etc/pam.d/passwd
