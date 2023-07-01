# docker-apache
Docker apache container


## Instructions

1. Install docker
2. Clone this repository
3. Edit docker-compose.yml and replace {DOCUMENTROOT} with the path to your document's folder in you host computer
4. By default the container is configured to expose the default webserver port (80), but you can set any port you want (ex: 8080:80)
3. run `docker-compose build`


###### LINUX / OSX
if your host computer is running Linux or OSX, run these commands:

    chmod +x shell
    chmod +x start
    chmod +x stop

###### WINDOWS
If your host computer is runnning Windows, run these commands:

    ren shell shell.bat
    ren start start.bat
    ren stop stop.bat

###### BATCH FILES

Run | For | Linux/OSX | Windows 
----|--------|-----------|----------
start | Start the container | `$ ./start` | `c:/> start.bat`
stop | Stop the container | `$ ./stop` | `c:/> stop.bat`
shell | Open a shell prompt in the container | `$ ./shell` | `c:/> shell.bat`


## Included software
* Apache 8.0
* PHP 8.0.29 with MongoDB ext
* Composer
* PHPUnit9
* MongoDB Client (PHP)
* GuzzleHttp Client (PHP)

