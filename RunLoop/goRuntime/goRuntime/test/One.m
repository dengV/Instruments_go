//
//  One.m
//  testDo
//
//  Created by dengjiangzhou on 2018/4/28.
//  Copyright © 2018年 dengjiangzhou. All rights reserved.
//

#import "One.h"

//

#import "Foo.h"

//
#import <objc/message.h>


@interface One()

@property (nonatomic, strong) Foo * foo;

@end


@implementation One

- (void) doSth{
    
    [self.foo eat];
    NSLog(@"-----");
    
    ((void(*)(id , SEL)) objc_msgSend )(self.foo, sel_registerName("eat"));
    
}


- (Foo *)foo{
    if(!_foo){
        
        _foo = [[Foo alloc] init];
        
    }
    return _foo;
}


@end
