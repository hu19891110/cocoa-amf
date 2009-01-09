//
//  AMF0Test.m
//  CocoaAMF
//
//  Created by Marc Bauer on 09.01.09.
//  Copyright 2009 nesiumdotcom. All rights reserved.
//

#import "AMF0Test.h"


@implementation AMF0Test

- (void)testNumbers
{	
	[self assertAMF0Data:"\x00\x00\x00\x00\x00\x00\x00\x00\x00" length:9 
		equalsObject:[NSNumber numberWithInt:0]];
	[self assertAMF0Data:"\x00\x3f\xc9\x99\x99\x99\x99\x99\x9a" length:9 
		equalsObject:[NSNumber numberWithDouble:0.2]];
	[self assertAMF0Data:"\x00\x3f\xf0\x00\x00\x00\x00\x00\x00" length:9 
		equalsObject:[NSNumber numberWithInt:1]];
	[self assertAMF0Data:"\x00\x40\x45\x00\x00\x00\x00\x00\x00" length:9 
		equalsObject:[NSNumber numberWithInt:42]];
	[self assertAMF0Data:"\x00\xc0\x5e\xc0\x00\x00\x00\x00\x00" length:9 
		equalsObject:[NSNumber numberWithInt:-123]];
	[self assertAMF0Data:"\x00\x3f\xf3\xc0\xca\x42\x83\xde\x1b" length:9 
		equalsObject:[NSNumber numberWithDouble:1.23456789]];
}

- (void)testBoolean
{
	[self assertAMF0Data:"\x01\x01" length:2 
		equalsObject:[NSNumber numberWithBool:YES]];
	[self assertAMF0Data:"\x01\x00" length:2 
		equalsObject:[NSNumber numberWithBool:NO]];
}

- (void)testString
{
	[self assertAMF0Data:"\x02\x00\x00" length:3 
		equalsObject:@""];
	[self assertAMF0Data:"\x02\x00\x05hello" length:8 
		equalsObject:@"hello"];
	[self assertAMF0Data:"\x02\x00\t\xe1\x9a\xa0\xe1\x9b\x87\xe1\x9a\xbb" length:12 
		equalsObject:@"ᚠᛇᚻ"];
}

@end