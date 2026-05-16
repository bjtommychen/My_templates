 ##### APT
sudo apt-get update && 
sudo apt install -y iputils-ping vim htop build-essential git tig openssh-server zip unzip p7zip-full p7zip-rar  autojump  python3-pip screen glances net-tools python3-virtualenv 
sudo apt install -y build-essential libssl-dev ffmpeg nfs-server nasm


#如果要编译代码
sudo apt-get install zlib1g-dev libc6 liblog4cxx-dev g++-11 opencv-python==4.1.2.30


#### QT
sudo apt-get install qtcreator
sudo apt-get install qt5*


### PIP
wget bootstrap.pypa.io/get-pip.py
python3.12 get-pip.py

pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple --upgrade simplejson setuptools zmq requests seaborn tqdm numpy pandas joblib pymysql beautifulsoup4 lxml sqlalchemy duckdb msgpack html2text
psutil  jupyter Flask scipy kiwisolver  deco  pyarrow scipy  scikit-learn cachetools selenium
pyzmq scikit-learn scikit-image pyarrow opencv-python bjontegaard tensorboardX

##use this !!!!
pip3 install Cython --user -i https://pypi.doubanio.com/simple/ 
pip3 install pyarrow --user -i https://pypi.doubanio.com/simple/

pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple setuptools zmq requests seaborn tqdm numpy pandas psutil joblib pymysql jupyter Flask scipy kiwisolver beautifulsoup4 lxml deco sqlalchemy pyarrow  --break-system-packages
pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple pyzmq scikit-learn scikit-image pyarrow opencv-python bjontegaard tensorboardX  --break-system-packages

pyautogui selenium
torch
--break-system-packages