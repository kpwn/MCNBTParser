//
//  MCNBT.h
//  Craftplayer
//
//  Created by Luca "qwertyoruiop" Todesco on 27/04/12.
//  Copyright (c) 2012 Evolse Limited. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MCNBT : NSObject
+(NSDictionary*)NBTWithRawData:(NSData*)data;
@end