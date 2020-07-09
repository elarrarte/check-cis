kernel_module="jffs2"
cis_test_name="Ensure mounting of ${kernel_module} filesystems is disabled (Scored)"
cis_test_pa=(server workstation)
cis_test_pl=1

function cis_test_run()
{
	cmd=$(modprobe -n -v ${kernel_module})
	[ "$cmd" != "install /bin/true " ] && return 1
	cmd=$(lsmod | grep ${kernel_module})
	[ -n "$cmd" ] && return 1
	return 0
}

