# Docker Container for Logitech Media Server

Docker image for running the Logitech Media Server.  

Run Directly:
```
docker run -d \
           --name lms \
           -p 9000:9000 \
           -p 9090:9090 \
           -p 3483:3483 \
           -p 3483:3483/udp \
           -v /etc/localtime:/etc/localtime:ro \
           -v <local-state-dir>:/srv/squeezebox \
           -v <audio-dir>:/srv/music \
           varrcan/logitech-media-server
```
