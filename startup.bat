:vstartup
TIMEOUT 10
if not exist "D:\VMs\UbuntuServer\UbuntuServer.vmx.lck\" (
    start "C:\Program Files (x86)\VMware\VMware Player\vmplayer.exe" "D:\VMs\UbuntuServer\UbuntuServer.vmx"
)
if not exist "D:\VMs\WiniServer\WiniServer.vmx.lck\" (
    start "C:\Program Files (x86)\VMware\VMware Player\vmplayer.exe" "D:\VMs\WiniServer\WiniServer.vmx"
)
goto vstartup