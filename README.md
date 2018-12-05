# kbcm
kbcm is a commandline tool to copy and move files with integrated progress bar.
kbcm is written in shell script

    Note: kbcm is included in package supreme. if supreme is already installed, skip installing.

    Usage: kcm [Flags] [source/path] [Destination/path]
      -m  Move
      -c  Copy
      -v  version
    Note: Use single flag.Using multiple flags simultaneously may give undesired result
    Example:
      kbcm -c /home/linuxuser/Videos/a.mp4 /home/linuxuser/Desktop
    
 ## Install

<details>
<summary>Debian package install</summary>

```bash
Download debian package amd64.deb/i386.deb from release tab to any debian based Linux
install
```

</details>

<details>
<summary>Apt Package Manager</summary>

### For bionic

```bash
sudo add-apt-repository ppa:kiran.kb/kbcm
sudo apt-get update
sudo apt-get install kbcm
```
### For other ubuntu versions,this PPA can be added to your system manually by copying the lines below and adding them to your system's software sources.

```bash
deb http://ppa.launchpad.net/kiran.kb/kbcm/ubuntu bionic main 
deb-src http://ppa.launchpad.net/kiran.kb/kbcm/ubuntu bionic main 
```
### And then run the following

```bash
sudo apt-get update
sudo apt-get install kbcm
```
#### If it throws error, run the following

```bash
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys E021E2DC3302D8CE
sudo apt-get update
sudo apt-get install kbcm
```
</details>

<details>
<summary>Git Install</summary>

* First clone the repository:  
```bash
git clone https://github.com/Kiran-Bose/kbcm
```

* Then cd into the cloned directory:
```bash
cd kbcm
```

* Run the guided install script with
```bash
. install.sh
```

</details>




## Update

<details>
<summary>Apt Package Manager</summary>

```bash
sudo apt update
sudo apt upgrade
```

</details>

<details>
<summary>Git Update</summary>

#### If the package is installed running '. install' mentioned in Git install section, running it again will prompt for update if any.

* cd into the cloned directory:
```bash
cd kbcm
```

* Run the guided install script with
```bash
. install.sh
```
</details>



## Uninstall

</details>

<details>
<summary>Apt Package Manager/Debian package uninstall</summary>

```bash
sudo apt remove kbcm
```
	OR

```bash
sudo apt purge kbcm
```

</details>

<details>
<summary>Git Uninstall</summary>


* If you don't have the supreme folder anymore clone the repository:  
```bash
git clone https://github.com/Kiran-Bose/kbcm
```

* cd into the supreme directory:
```bash
cd kbcm
```
* run the below command
```bash
. uninstall.sh
```

</details>


