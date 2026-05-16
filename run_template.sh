# print yuv
hexdump -v -e '64/1 "%3u " "\n"' smallyuv_64x64.yuv > smallyuv_64x64.txt 
hexdump -v -e '128/1 "%3u " "\n"' smallyuv_128x128.yuv > smallyuv_128x128.txt 

# run multi jobs from txt file
xargs -I {} -P 4 bash -c 'echo "开始执行: {}" && {} 2>&1 | tee -a ffmpeg_run.log && echo "完成执行: {}"' < run_cmds.sh

# h264 to yuv
ffmpeg -i test.h264 -pix_fmt yuv420p output.yuv

# bash
cmdline = 'gnome-terminal -- bash -c "/mnt/u18_0/seekalpha/run_one_upload.sh; exec bash"'
os.system(cmdline)    

# loop for batch processing
# loop for batch processing
flist=`ls input/*.mp4`
for name in $flist
do
    echo $name
    key=${name/FirstQP\/PIXELCNT_/}
    key=${key/\.mp4/} 
    echo $key   
    ffmpeg -i $name -c:v rawvideo -pix_fmt yuv420p $key.yuv
    # key=${name/output\//_}
done

假如说我有一段yuvi420格式的YUV，想转成nv21格式编码，可以这样转换:
ffmpeg -s 2560x1440 -pix_fmt yuv420p -i input.yuv -pix_fmt nv21 output.yuv
ffmpeg -s 4096x2160  -pix_fmt yuv420p -i /mnt/nas_roger/sequences/derf/Netflix_FoodMarket_4096x2160_60fps_8bit_420.yuv  -pix_fmt nv21  Netflix_FoodMarket_4096x2160_60fps_8bit_nv12.yuv

if false; then
    ext=h264
    # ext=hevc

    path_in=/storage/emulated/obb/work/yuv/
    # for key in {0..20..1} 
    # for key in 00 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19
    for key in {20..41..1} 
    do
        echo $key
        # echo ${adbd} shell ls
        ### UPLOADING
        # ${adbd} push FirstQP/merge_1920x1080_dev${key}.yuv /storage/emulated/obb/work/yuv/      
        sleep .1
        for bitrate in 1000000 2000000 3000000 5000000 10000000 20000000
        do 
            echo $bitrate
            ${adbd} shell rm /data/local/tmp/temp.h264
            # ${adbd} shell /data/local/tmp/ffmpeg -y -r 30 -s 1920x1080 -pix_fmt yuv420p -i ${path_in}/$key.yuv  -b:v ${bitrate} -c:v ${ext}_mediacodec -frames 180  /data/local/tmp/temp.${ext}
            ${adbd} shell time /data/local/tmp/ffmpeg -y -r 30 -s 1920x1080 -pix_fmt yuv420p -i ${path_in}/merge_1920x1080_dev$key.yuv -b:v ${bitrate} -c:v ${ext}_mediacodec -frames 30  /data/local/tmp/temp.${ext}
            sleep .2
            echo DOWNLOAD BITS....
            ${adbd} pull /data/local/tmp/temp.${ext} FirstQP/MI14_30fps_br${bitrate}_DEV${key}.${ext}
            sleep .2

        done
    done
fi

##################################### mac #####################################33

if false; then
	ext=h264
	# ext=hevc
	# for key in crowd_run_1080p50 ducks_take_off_1080p50 BasketballDrive_1920x1080_50 WITCHER3-B_1920x1080_60 Spreadsheet_1920x1080_30fps_8bit_420 
	for key in 00
	# for key in 00 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19
	# for key in {20..41..1} 
	# for (( key = 20 ; key <= 41 ; key+=1 ))
	do
	echo $key
	# for bitrate in 3000000 #5000000 10000000 20000000 
	for (( bitrate = 100000 ; bitrate <= 50000000 ; bitrate+=100000 )); 
	# for bitrate in 1000000 2000000 3000000 5000000 10000000 20000000
	do
		echo $bitrate
		## iMac
		ffmpeg -y -s 1920x1080 -r 30 -pix_fmt yuv420p -i FirstQP/merge_1920x1080_dev${key}.yuv -bf 0 -c:v ${ext}_videotoolbox -b:v ${bitrate} -g 30 -frames 30  FirstQP/iMac_0B${bitrate}_DEV${key}.${ext}
		sleep .1
	done
	done
fi

if true; then
	ext=h264
	bitrate=5000000
    flist=`ls FirstQP/PIX*.yuv`
    for name in $flist
    do
        # echo $name
        # key=${name/output\//_}
        key=${name/FirstQP\/PIXELCNT_/}
        key=${key/\.yuv/}
        echo $name $key
		## iMac
		ffmpeg -y -s $key -r 30 -pix_fmt yuv420p -i $name -bf 0 -c:v ${ext}_videotoolbox -b:v ${bitrate} -g 30 -frames 30  FirstQP/iMac_${key}_DEV00.h264
		sleep .1
	done
fi

