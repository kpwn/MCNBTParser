all:
	gcc *.m -o MCNBTParser -framework Foundation -lz -lssl -lcrypto
