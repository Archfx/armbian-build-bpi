# Rockchip RK3588S octa core 8GB RAM SoC eMMC USB3 USB2 1x GbE 2x 2.5GbE
BOARD_NAME="NanoPi R6S"
BOARDFAMILY="rockchip-rk3588"
BOARD_MAINTAINER="efectn"
BOOTCONFIG="nanopi-r6s-rk3588s_defconfig" # vendor name, not standard, see hook below, set BOOT_SOC below to compensate
BOOT_SOC="rk3588"
KERNEL_TARGET="legacy,vendor,edge"
KERNEL_TEST_TARGET="vendor,edge"
FULL_DESKTOP="yes"
BOOT_LOGO="desktop"
IMAGE_PARTITION_TABLE="gpt"
BOOT_FDT_FILE="rockchip/rk3588s-nanopi-r6s.dtb"
BOOT_SCENARIO="spl-blobs"
DDR_BLOB='rk35/rk3588_ddr_lp4_2112MHz_lp5_2400MHz_v1.16.bin'
BL31_BLOB='rk35/rk3588_bl31_v1.45.elf'
declare -g UEFI_EDK2_BOARD_ID="nanopi-r6s" # This _only_ used for uefi-edk2-rk3588 extension

function post_family_tweaks__nanopir6s_naming_audios() {
	display_alert "$BOARD" "Renaming nanopir6s audio" "info"

	mkdir -p $SDCARD/etc/udev/rules.d/
	echo 'SUBSYSTEM=="sound", ENV{ID_PATH}=="platform-hdmi0-sound", ENV{SOUND_DESCRIPTION}="HDMI0 Audio"' > $SDCARD/etc/udev/rules.d/90-naming-audios.rules

	return 0
}

function post_family_tweaks__nanopir6s_udev_network_interfaces() {
	display_alert "$BOARD" "Renaming interfaces WAN LAN1 LAN2" "info"

	mkdir -p $SDCARD/etc/udev/rules.d/
	cat << EOF > "${SDCARD}/etc/udev/rules.d/70-persistent-net.rules"
SUBSYSTEM=="net", ACTION=="add", DRIVERS=="?*", KERNELS=="fe1c0000.ethernet", NAME:="wan"
SUBSYSTEM=="net", ACTION=="add", DRIVERS=="r8169", KERNELS=="0003:31:00.0", NAME:="lan1"
SUBSYSTEM=="net", ACTION=="add", DRIVERS=="r8169", KERNELS=="0004:41:00.0", NAME:="lan2"
EOF

}
