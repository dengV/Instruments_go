//
//  TestClass.m
//  testDo
//
//  Created by dengjiangzhou on 2018/4/28.
//  Copyright © 2018年 dengjiangzhou. All rights reserved.
//

#import "TestClass.h"

//
#import <objc/message.h>


//
//#import <objc/objc.h>


@implementation TestClass

- (void) showAge{
    NSLog(@"27");
}



- (void) showName: (NSString *) aName{
    NSLog(@"name is %@", aName);

}


- (void) showSizeWithWeight: (float) weight andHeight: (float) height{
    
    NSLog(@"weight is %0.2f, \n height  is  %0.2f", weight, height);
    
}


- (float) getHeight{
    return 177.5f;
}


- (NSString *)getInfo{
    return @"一光寒十九州";
}


- (void) doNow{
    ((void (*) (id, SEL)) objc_msgSend)(self, sel_registerName("showAge"));
    
    ((void (*) (id, SEL, id)) objc_msgSend)(self, sel_registerName("showName:"), @"DNG");
    
   // ((void (*) (id, SEL, float, float)) objc_msgSend)(self, sel_registerName("showSizeWithWeight:"), 200.f, 178.02f);
    ((void (*) (id, SEL, float, float)) objc_msgSend)(self, sel_registerName("showSizeWithWeight:andHeight:"), 200.f, 178.02f);
    
    float height = ((float (*) (id, SEL)) objc_msgSend)(self, sel_registerName("getHeight"));
    NSLog(@"height is %0.2f", height);
    
    float height_2nd = ((float (*) (id, SEL)) objc_msgSend_fpret)(self, sel_registerName("getHeight"));
    //      objc_msgSend_fpret
    NSLog(@"height_2nd is %0.2f", height_2nd);
    
    
    NSString * infoStr = ((NSString * (*) (id, SEL)) objc_msgSend)(self, sel_registerName("getInfo"));
    
    NSLog(@"infoStr is %@", infoStr);
}


@end





@implementation Father


- (Class)class{
    return NSClassFromString(@"Father");
}


@end




@implementation Son

- (instancetype)init{
    if(self = [super init]){
        NSLog(@"第一个， class is %@ \n", NSStringFromClass([self class]));
        //  Son ， 子类没实现 class 方法， 是一种
        //  Son ， 子类实现了 class 方法， 是一种
        
        
        NSLog(@"第二个， class is %@  \n", NSStringFromClass([super class]));
        //  Father ， 父类没实现 class 方法， 是一种
        //  Father ， 父类实现了 class 方法， 是一种
        
    }
    return self;
}


- (Class)class{
    return NSClassFromString(@"Son");
}


@end





/*
 
 // @implementation Son
 
 
 static instancetype _I_Son_init(Son * self, SEL _cmd) {
 if(self = ((Son *(*)(__rw_objc_super *, SEL))(void *)objc_msgSendSuper)((__rw_objc_super){(id)self, (id)class_getSuperclass(objc_getClass("Son"))}, sel_registerName("init"))){
 NSLog((NSString *)&__NSConstantStringImpl__var_folders_9w_cjz3v13s133d7yxmb9mjz_ww0000gn_T_TestClass_be2d1c_mi_8, NSStringFromClass(((Class (*)(id, SEL))(void *)objc_msgSend)((id)self, sel_registerName("class"))));
 NSLog((NSString *)&__NSConstantStringImpl__var_folders_9w_cjz3v13s133d7yxmb9mjz_ww0000gn_T_TestClass_be2d1c_mi_9, NSStringFromClass(((Class (*)(__rw_objc_super *, SEL))(void *)objc_msgSendSuper)((__rw_objc_super){(id)self, (id)class_getSuperclass(objc_getClass("Son"))}, sel_registerName("class"))));
 }
 return self;
 }
 
 */



//  (id)class_getSuperclass(objc_getClass("Son"))},



//  第 97435 行


