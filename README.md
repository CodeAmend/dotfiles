# XPS 9570
* For backlight???
/etc/X11/xorg.conf.d/20-intel.conf

* For graphics Arch (Wiki 9570) 
  * /etc/systemd/system/disable-nvidia-on-shutdown.service
  * /etc/bumblebee/bumblebee.conf
  * /etc/modprobe.d/blacklist.conf
  * /etc/modprobe.d/disable-ipmi.conf
  * /etc/modprobe.d/disable-nvidia.conf
  * /etc/X11/xorg.conf.d/01-noautogpu.conf
  * /etc/tmpfiles.d/nvidia_pm.conf

  * Scripts
    * enablegpu.sh
    * disablegpu.sh

* Mouse
  * /etc/X11/xorg.conf.d/70-synaptics.conf

