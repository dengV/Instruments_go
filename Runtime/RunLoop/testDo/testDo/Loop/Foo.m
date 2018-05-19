//
//  Foo.m
//  testDo
//
//  Created by dengjiangzhou on 2018/4/28.
//  Copyright © 2018年 dengjiangzhou. All rights reserved.
//

#import "Foo.h"

@implementation Foo


- (void)eat{
    
    NSLog(@"eat it");
    
}


- (void) testCpp{
    
    [self eat];
}
/*
 第 96648 行，
 
 
 
 
 
 
 // static void _I_Foo_testCpp(Foo * self, SEL _cmd) {
 //
 // ((void (*)(id, SEL))(void *)objc_msgSend)((id)self, sel_registerName("eat"));
//   }





//      clang -rewrite-objc Foo.m


 
 
 */


@end
