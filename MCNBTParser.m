/*
(c) 2012 qwertyoruiop
*/

#import "MCNBT.h"
#import "NSData+UserAdditions.h"

char gzip_signature[] = {0x1F, 0x8B, 0x08};

int main(int argc, char** argv, char** envp)
{
	id pool = [NSAutoreleasePool new];
	if(!argv[1])
	{
		printf("[i] MCNBTParser - (c) 2012 qwertyoruiop\n[?] usage: %s <nbt> [out]\nnbt: input NBT file\nout: output plist file, /dev/stdout if not specified\n", argv[0]);
		return;
	}
	const char* outfile = argv[2];
	if (!outfile) outfile = "/dev/stdout";
	NSData* data = [NSData dataWithContentsOfFile:[NSString stringWithUTF8String:argv[1]]];
	if (!data)
	{
		printf("[-] couldn't open %s\n", argv[1]);
	}
	if (memcmp([data bytes], gzip_signature, 3) == 0)
	{
		data = [data gzipInflate];
	}
	[[MCNBT NBTWithRawData:data] writeToFile:[NSString stringWithUTF8String:outfile] atomically:NO];
	[pool drain];
}
