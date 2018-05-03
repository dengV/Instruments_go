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

#import "TestClass.h"

//
#import <objc/message.h>

@interface One()

@property (nonatomic, strong) Foo * foo;

@end


@implementation One

- (void) doSth{
#if 0
    [self.foo eat];
    NSLog(@"-----");
    
    ((void(*)(id , SEL)) objc_msgSend )(self.foo, sel_registerName("eat"));
#elseif 0
    
    TestClass * testClass = [[TestClass alloc] init];
    [testClass doNow];
    
    
#else
    
    Son * sonInstance = [[Son alloc] init];
    NSLog(@"%@", sonInstance.description);
    
    
#endif
    
}


- (Foo *)foo{
    if(!_foo){
        
        _foo = [[Foo alloc] init];
        
    }
    return _foo;
}


@end
