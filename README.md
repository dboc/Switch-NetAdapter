### About me
 I am developer as hobby. For me automate boring stuff is a pleasure, no more operational work :)
 > "Live as if you were to die tomorrow. Learn as if you were to live forever" Mahatma Gandhi.

### Donate
 if you like the project and it help you, you could give me some reward for that.

|Donate via PayPal| Top Donation   | Lastest Donation   |
|---|---|---|
|[![](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=PCTDXQTW2H59G&source=url) |  -  |  -  |


# Switch-NetAdapter

> Powershell Script -Switch NetAdapter between two desire adapter

Sometimes it is necessary change between two Net Adapters in Windows.
In my case, i made a script to change between a Wifi Network without Proxy Settings and a Cable With Proxy Settings.
This script automate the process to change between this two network.
To make it work for you, you need to change the NetAdapter Name in Variables $wifiNet and $cableNet

## How It Works

The script loop for all Net-Adpater and look for Wifi Network and Cable Network.
If Wifi Network is disable, then enable it and disable Cable Network and Proxy Settings
If Cable Network is disable, then enable it and disable Wife Network and Enable Proxy Settings



## Requirements
 - powershell

## Installation
You have just execute the script as Admin. Or execute the Switch-NetAdapter.bat in same folder of Switch-NetAdapter.ps1.

```
git clone https://github.com/dboc/Switch-NetAdapter.git ./somedirectory
Switch-NetAdapter.bat
```
## Config

To fit you enviromment and needs, you must change the variables name in Switch-NetAdapter.ps1:

```
...powershell
$wifiNet = "YOUR NETADAPTER NAME"
$cableNet = "YOUR NETADAPTER NAME"
...
```

## Usage example

Change the variables in Switch-NetAdapter.ps1
```powershell
...
$wifiNet = "YOUR NETADAPTER NAME"
$cableNet = "YOUR NETADAPTER NAME"
...
```
Then execute:
```
Switch-NetAdapter.bat
```

After that you would see the output:
```powershell

```

## Contributing

1. Fork it (<https://github.com/dboc/Switch-NetAdapter.git>)
2. Create your feature branch (`git checkout -b feature/fooBar`)
3. Commit your changes (`git commit -am 'Add some fooBar'`)
4. Push to the branch (`git push origin feature/fooBar`)
5. Create a new Pull Request