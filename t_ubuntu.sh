### proxy
export http_proxy="http://10.10.33.82:1081"
export https_proxy="http://10.10.33.82:1081"
# Bypass proxy for local server (required)
export NO_PROXY=localhost,127.0.0.1

curl https://www.google.com         # 如果proxy工作, 那么这个行可以直接运行
git clone https://github.com/Lightning-AI/torchmetrics.git # # 如果proxy工作, 那么这个行可以直接运行

### python
virtualenv --system-site-packages -p python3 ./venv
virtualenv -p /usr/bin/python3.12  vnev_DCVC
. ~/venv/bin/activate
cd ~/pycharm_ml/DeepSpeech

### pip install
pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple tensorflow-gpu
pip3 install -i https://mirrors.aliyun.com/pypi/simple/ xxxxxx
# /home/tools/nload/bin/nload

pip3 freeze  > requirements.txt

### time zone
sudo ntpdate cn.pool.ntp.org

### rsync
rsync -rav -e ssh --include '*/' --include='*.py' --exclude='*' \
server:/usr/some/unknown/number/of/sub/folders/ /usr/project/backup/some/unknown/number/of/sub/folders/

### tools
ps aux |grep Inter | awk '{print $2}' | xargs kill -9 $1
find . -name *.cpp
kill `ps -ef |grep python3 |grep -v grep | awk '{print $2}'`

### AI
tensorboard --logdir . --bind_all
watch nvidia-smi
sudo swapon swapfile

### fio
fio -filename=seq_write.test -direct=1 -rw=write -bs=1G -size=10G -numjobs=1 -iodepth=1 -runtime=60 -name=seq_write_test -ioengine=libaio -group_reporting; rm -f seq_write.test

