//
//  UIControl+BaiGe.m
//  BaiGeTool
//
//  Created by bai on 15/10/20.
//  Copyright © 2015年 bai. All rights reserved.
//

#import "UIControl+BaiGe.h"
#import <objc/runtime.h>

static const char *UIControl_acceptEventInterval = "UIControl_acceptEventInterval";

@implementation UIControl (BaiGe)

- (NSTimeInterval)BaiGe_acceptEventInterval
{
    return [objc_getAssociatedObject(self, UIControl_acceptEventInterval) doubleValue];
}

- (void)setBaiGe_acceptEventInterval:(NSTimeInterval)uxy_acceptEventInterval
{
    objc_setAssociatedObject(self, UIControl_acceptEventInterval, @(uxy_acceptEventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


+ (void)load
{
    
    Method a = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    Method b = class_getInstanceMethod(self, @selector(__BaiGe_sendAction:to:forEvent:));
    method_exchangeImplementations(a, b);
}

- (void)__BaiGe_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event
{
    if (NSDate.date.timeIntervalSince1970 - self.BaiGe_acceptEventInterval < self.BaiGe_acceptEventInterval) return;
    
    if (self.BaiGe_acceptEventInterval > 0)
    {
        self.BaiGe_acceptEventInterval = NSDate.date.timeIntervalSince1970;
    }
    
    [self __BaiGe_sendAction:action to:target forEvent:event];
}

@end
