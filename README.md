# svn-server-1.6
Subversion server 1.6 and webdav 

To run the image, you can use the following command:
```
docker run -d --name svn-server -p 80:80 -p 3960:3960 ninaball/svn-server:1.6
```

Add user to webdav
```
docker exec -t svn-server htpasswd -b /etc/subversion/passwd <username> <password>
```

