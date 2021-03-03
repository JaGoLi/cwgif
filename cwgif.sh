#! /bin/bash
##Case insensitive matching
shopt -s nocasematch

##Get info
year="$(date -u +%Y)"
month="$(date -u +%m)"
day="$(date -u +%d)"
hour="$(date -u +%H)"
exception=0

##Get last two hours
if [[ "$hour" == "00" ]]; then
	day="$(date +%d)"
	HR[1]=23
	HR[2]=22
elif [[ "$hour" == "01" ]]; then
	exception=1
	HR[1]=00
	HR[2]=23
else
	let hr[1]=$hour-1
	let hr[2]=$hour-2
	HR[1]=$(printf "%02d" ${hr[1]})
	HR[2]=$(printf "%02d" ${hr[2]})
fi

##Read file
city="$(awk 'NR==1 {print $NF}' ~/.config/cwgif/cwgif.conf)"
perc="$(awk 'NR==2 {print $NF}' ~/.config/cwgif/cwgif.conf)"
delay="$(awk 'NR==3 {print $NF}' ~/.config/cwgif/cwgif.conf)"

##clear file
echo "" > /tmp/weatherlist.txt

##Weather based on location
if [[ "$city" == "montreal" ]]; then
	for y in 2 1; do
		if [[ "$exception" == "1" ]]; then
			case $y in
				2)
					day="$(date +%d)"
					;;
				1)
					day="$(date -u +%d)"
					exception=0
					;;
			esac
		fi
		for i in 06 18 30 42 54; do 
			echo "https://weather.gc.ca/data/radar/temp_image//CASBV/CASBV_PRECIP_${perc}_${year}_${month}_${day}_${HR[y]}_${i}.GIF" >> /tmp/weatherlist.txt
		done
	done
elif [[ "$city" == "toronto" ]]; then
	for y in 2 1; do
		if [[ "$exception" == "1" ]]; then
			case $y in
				2)
					day="$(date +%d)"
					;;
				1)
					day="$(date -u +%d)"
					exception=0
					;;
			esac
		fi
		for i in 10 30 50; do 
			echo "https://weather.gc.ca/data/radar/temp_image//WKR/WKR_PRECIP_${perc}_${year}_${month}_${day}_${HR[y]}_${i}.GIF" >> /tmp/weatherlist.txt
		done
	done
elif [[ "$city" == "vancouver" ]]; then
	for y in 2 1; do
		if [[ "$exception" == "1" ]]; then
			case $y in
				2)
					day="$(date +%d)"
					;;
				1)
					day="$(date -u +%d)"
					exception=0
					;;
			esac
		fi
		for i in 10 30 50; do 
			echo "https://weather.gc.ca/data/radar/temp_image//WUJ/WUJ_PRECIP_${perc}_${year}_${month}_${day}_${HR[y]}_${i}.GIF" >> /tmp/weatherlist.txt
		done
	done
elif [[ "$city" == "calgary" ]]; then
	for y in 2 1; do
		if [[ "$exception" == "1" ]]; then
			case $y in
				2)
					day="$(date +%d)"
					;;
				1)
					day="$(date -u +%d)"
					exception=0
					;;
			esac
		fi
		for i in 10 30 50; do 
			echo "https://weather.gc.ca/data/radar/temp_image//CASSM/CASSM_COMP_PRECIP_${perc}_${year}_${month}_${day}_${HR[y]}_${i}.GIF" >> /tmp/weatherlist.txt
		done
	done
elif [[ "$city" == "edmonton" ]]; then
	for y in 2 1; do
		if [[ "$exception" == "1" ]]; then
			case $y in
				2)
					day="$(date +%d)"
					;;
				1)
					day="$(date -u +%d)"
					exception=0
					;;
			esac
		fi
		for i in 10 30 50; do 
			echo "https://weather.gc.ca/data/radar/temp_image//WHK/WHK_PRECIP_${perc}_${year}_${month}_${day}_${HR[y]}_${i}.GIF" >> /tmp/weatherlist.txt
		done
	done
elif [[ "$city" == "ottawa" ]]; then
	for y in 2 1; do
		if [[ "$exception" == "1" ]]; then
			case $y in
				2)
					day="$(date +%d)"
					;;
				1)
					day="$(date -u +%d)"
					exception=0
					;;
			esac
		fi
		for i in 10 30 50; do 
			echo "https://weather.gc.ca/data/radar/temp_image//XFT/XFT_COMP_PRECIP_${perc}_${year}_${month}_${day}_${HR[y]}_${i}.GIF" >> /tmp/weatherlist.txt
		done
	done
elif [[ "$city" == "winnipeg" ]]; then
	for y in 2 1; do
		if [[ "$exception" == "1" ]]; then
			case $y in
				2)
					day="$(date +%d)"
					;;
				1)
					day="$(date -u +%d)"
					exception=0
					;;
			esac
		fi
		for i in 06 18 30 42 54; do 
			echo "https://weather.gc.ca/data/radar/temp_image//CASWL/CASWL_PRECIP_${perc}_${year}_${month}_${day}_${HR[y]}_${i}.GIF" >> /tmp/weatherlist.txt
		done
	done
elif [[ "$city" == "quebec" ]]; then
	for y in 2 1; do
		if [[ "$exception" == "1" ]]; then
			case $y in
				2)
					day="$(date +%d)"
					;;
				1)
					day="$(date -u +%d)"
					exception=0
					;;
			esac
		fi
		for i in 06 18 30 42 54; do 
			echo "https://weather.gc.ca/data/radar/temp_image//CASSF/CASSF_PRECIP_${perc}_${year}_${month}_${day}_${HR[y]}_${i}.GIF" >> /tmp/weatherlist.txt
		done
	done
elif [[ "$city" == "halifax" ]]; then
	for y in 2 1; do
		if [[ "$exception" == "1" ]]; then
			case $y in
				2)
					day="$(date +%d)"
					;;
				1)
					day="$(date -u +%d)"
					exception=0
					;;
			esac
		fi
		for i in 10 30 50; do 
			echo "https://weather.gc.ca/data/radar/temp_image//XGO/XGO_PRECIP_${perc}_${year}_${month}_${day}_${HR[y]}_${i}.GIF" >> /tmp/weatherlist.txt
		done
	done
fi
mpv --image-display-duration=${delay} --loop-playlist=inf --playlist=/tmp/weatherlist.txt
