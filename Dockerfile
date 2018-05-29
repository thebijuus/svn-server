# From precise
FROM library/ubuntu:12.04

        # Install Apache2 and other stuff needed to access svn via WebDav
RUN apt-get update; apt-get install -y apache2 apache2-utils libapache2-svn  &&\
        # Install svn
        apt-get install -y subversion &&\

        # Create required folders
        mkdir -p /run/apache2/ &&\
        mkdir /home/svn/ &&\
        mkdir /etc/subversion &&\

        # Create the authentication file for http access
        touch /etc/subversion/passwd

RUN a2enmod dav; a2enmod dav_fs
# Add services configurations
#ADD apache/ /etc/services.d/apache/
#ADD subversion/ /etc/services.d/subversion/

# Add WebDav configuration
ADD dav_svn.conf /etc/apache2/conf.d/dav_svn.conf

# Expose ports for http and custom protocol access
EXPOSE 80 443 3960
