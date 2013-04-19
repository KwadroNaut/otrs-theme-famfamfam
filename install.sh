#!/bin/bash

# Script for installation of OTRS 2.4 FamFamFam Theme
#
# WARNING: Not compatible with OTRS 3.0+
# @todo	Test OTRS version first

# Change otrs_dir to your OTRS installation directory
# This is default path for Debian:
otrs_dir='/usr/share/otrs'

if [ ! -r ${otrs_dir}/Kernel/System/Auth.pm ]; then
	echo "Path seems not correct. Modify variable `otrs_dir` in this file first."
	exit 1
fi

# ver=`grep "VERSION" RELEASE | sed -E 's#^.*= (...).*#\1#'`

# Create directories
mkdir -p $otrs_dir/Kernel/Output/HTML/FamFamFam
mkdir -p $otrs_dir/var/httpd/htdocs/css/FamFamFam
mkdir -p $otrs_dir/var/httpd/htdocs/images/FamFamFam
mkdir -p $otrs_dir/var/httpd/htdocs/js/FamFamFam

# Copy files to OTRS
cp -a html	$otrs_dir/Kernel/Output/HTML/FamFamFam
cp -a css 	$otrs_dir/var/httpd/htdocs/css/FamFamFam
cp -a images	$otrs_dir/var/httpd/htdocs/images/FamFamFam
cp -a js	$otrs_dir/var/httpd/htdocs/js/FamFamFam

# Register theme in OTRS database
echo "Script need to update OTRS database to enable new Theme (use your MySQL OTRS user password):"
echo "INSERT INTO theme (theme, valid_id, create_time, create_by, change_time, change_by) VALUES ('FamFamFam', 1, current_timestamp, 1, current_timestamp, 1);" \
|mysql -uotrs -p otrs2
