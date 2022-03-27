if [[ $TERMUX_PKG_VERSION == "20211216.122.gc9b7c6e0cc" ]]; then
	TERMUX_PKG_VERSION=20211216.147.g355515a06a
	TERMUX_PKG_SRCURL=(https://www.kraxel.org/repos/jenkins/edk2/edk2.git-aarch64-0-${TERMUX_PKG_VERSION}.noarch.rpm
			https://www.kraxel.org/repos/jenkins/edk2/edk2.git-arm-0-${TERMUX_PKG_VERSION}.noarch.rpm
			https://www.kraxel.org/repos/jenkins/edk2/edk2.git-ovmf-ia32-0-${TERMUX_PKG_VERSION}.noarch.rpm
			https://www.kraxel.org/repos/jenkins/edk2/edk2.git-ovmf-x64-0-${TERMUX_PKG_VERSION}.noarch.rpm)
	TERMUX_PKG_SHA256=(b9e96dbe3370247ea2511d11a0cfad3b31c1b8986d61b84dba630fe67537641d
			2125597c8c9786bc4165e83200447572a1aaacbae65a196c3c766a217d2e36c8
			486ffd9e75df87225b33f74edd99898dc1baa25211d94fe5ab7c343f3a27c7c4
			f21ae73a39084cce68ae45dea3b39b6d3485fea6f95009a6129ceabf35a754c3)
fi