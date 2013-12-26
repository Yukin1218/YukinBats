
netsh interface ip set address name="本地连接" source=static addr=219.228.118.93 mask=255.255.255.0 gateway=219.228.118.254 gwmetric=1
netsh interface ip set dns name="本地连接" source=static addr=202.120.2.101 register=primary
netsh interface ip add dns name="本地连接" addr=202.120.2.100  index=2
netsh interface ip add dns name="本地连接" addr=208.67.222.222  index=3

