# fossbot-fpga

## TODO: replace everything with command line quartus.

## Building

Assuming Quartus is version 17.1 Lite Edition, DS-5 is installed. Embedded command shell can be found somewhere in quartus directory.

### Generate HDL

Open ```Platform Designer```, choose ```soc_system.qsys```. Do ```Generate->Generate HDL```, then press ```Generate```.

### Generate ROM

Synthesize the project, then in ```File->Convert Programming Files``` select ```Raw binary file (.rbf)```, ```Passive Parallel x16``` mode, name the file ```soc_system.rbf```, add ```output_file/DE10_NANO_SoC_GHRD.sof``` file, open ```Properties``` and check ```Compressed```, then press ```Generate```. This will create the ```soc_system.rbf```.

### Generate and build preloader
***(This step is different for Quartus version 19.x and later)***

Open BSP Editor (```bsp-editor``` if path is set correctly), click ```File->New HPS BSP```, select ```DE10_NANO_SoC_GHRD/hps_isw_handoff/soc_system_hps_0/``` directory and press ```OK```. Check ```FAT_SUPPORT```, then click ```Generate```.

In ```software/spl_bsp``` run make. This will create the ```preloader-mkpimage.bin```.

### Building U-Boot

Ensure ```CROSS_COMPILE``` environment variable is set correctly (you may have to use Linaro GCC version 6.x for this to work), then run
```shell
git clone https://github.com/altera-opensource/u-boot-socfpga.git
cd u-boot-socfpga

git tag -l rel_socfpga*
# choose the latest version, then
git checkout <latest-version>

make mrproper
make socfpga_cyclone5_config
make
cd ..
```

This will create the ```u-boot.img```.

Create a file ```boot.script``` in ```/software``` directory (replace env vars if needed):
```
echo -- Programming FPGA --
fatload mmc 0:1 $fpgadata soc_system.rbf;
fpga load 0 $fpgadata $filesize;
run bridge_enable_handoff;

echo -- Setting Env Variables --
setenv fdtimage soc_system.dtb;
setenv mmcroot /dev/mmcblk0p2;
setenv mmcload 'mmc rescan;${mmcloadcmd} mmc 0:${mmcloadpart} ${loadaddr} ${bootimage};${mmcloadcmd} mmc 0:${mmcloadpart} ${fdtaddr} ${fdtimage};';
setenv mmcboot 'setenv bootargs console=ttyS0,115200 root=${mmcroot} rw rootwait; bootz ${loadaddr} - ${fdtaddr}';

run mmcload;
run mmcboot;
```

If you use USB network adapters, you may want to add ```usbcore.autosuspend=-1``` kernel boot parameter in ```mmcboot``` environment variable.

Compile the boot script:

```
mkimage -A arm -O linux -T script -C none -a 0 -e 0 -n "u-boot script" -d boot.script u-boot.scr
```

This will create the ```u-boot.scr```.

### Generate and compile the device tree

In project root directory run the ```rebuild-dt``` script. This will create the ```soc_system.dts```.
