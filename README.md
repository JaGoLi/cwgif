# cwgif
Bash script to view weather radar gifs for Canadian cities<br/><br/>
![screenshot](https://github.com/JaGoLi/cwgif/raw/main/screenshot.png)<br/>

## Configuration
To change the options for the script, the user must specify the options in the file located in ```~/.config/cwgif/cwgif.conf```<br/>
There, the user can modify the following three options:<br/>

### City
To change the city, replace the default with your chosen city. The input is case-insensitive and the only requirement for the program to work is to make sure the inputted value is separated by a space and the last word on its line. The supported cities at this moment are:<br/>
1. Toronto
2. Montreal
3. Vancouver
4. Calgary
5. Edmonton
6. Ottawa
7. Winnipeg
8. Quebec
9. Halifax

### Percipitation type
Depending on the season, the user can change to see the radar for rain or snow. For this field to be accepted, it must be IN ALL-CAPS. Therefore, the two options possible are:<br/>
1. RAIN
2. SNOW

### Image duration
This is fairly straightforward: input the amount of seconds for each image to be displayed. Decimal numbers are supported, with the default being 0.3 seconds per image.

## Installation
The dependencies for this script are: ```mpv``` and ```youtube-dl```<br/><br/>
For all distributions, make the included ``` install.sh``` script executable and RUN IT AS NON-ROOT USER. This ensures the configuration file is placed in the right place. An example to install is shown below: <br/>
```git clone https://github.com/JaGoLi/cwgif.git && cd cwgit```<br/>
```chmod +x install.sh```<br/>
```./install.sh```


