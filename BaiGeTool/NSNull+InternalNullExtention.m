//
//  NSNull+InternalNullExtention.m
//  NullExtention
//
//  Created by bai on 15/10/20.
//  Copyright © 2015年 bai. All rights reserved.
//

#import "NSNull+InternalNullExtention.h"
#import <objc/runtime.h>
#import <objc/message.h>

#define BQL_NullObjects @[@"",@0,@{},@[]]

@implementation NSNull (InternalNullExtention)

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    NSMethodSignature *signature = [super methodSignatureForSelector:aSelector];
    
    if (signature != nil) {
        return signature;
    }
    
    for (NSObject *object in BQL_NullObjects)
    {
        signature = [object methodSignatureForSelector:aSelector];
        
        if (signature)
        {
            if (strcmp(signature.methodReturnType, "@") == 0)
            {
                SEL selector = NSSelectorFromString(@"__returnNil");
                
                signature = [[NSNull null] methodSignatureForSelector:selector];
            }
            break;
        }
    }
    
    return signature;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    if (strcmp(anInvocation.methodSignature.methodReturnType, "@") == 0)
    {
        anInvocation.selector = @selector(__uxy_nil);
        [anInvocation invokeWithTarget:self];
        return;
    }
    
    for (NSObject *object in BQL_NullObjects)
    {
        if ([object respondsToSelector:anInvocation.selector])
        {
            [anInvocation invokeWithTarget:object];
            return;
        }
    }
    
    [self doesNotRecognizeSelector:anInvocation.selector];
}

- (id)__uxy_nil
{
    return nil;
}


@end
