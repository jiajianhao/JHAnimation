//
//  UIButton+RestorationID.m
//  JHAnimation
//
//  Created by admin on 2017/2/22.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "UIButton+RestorationID.h"
#import <objc/runtime.h>
@implementation UIButton (RestorationID)
-(void)setRestorationID:(NSString *)restorationID{
    objc_setAssociatedObject(self, @selector(restorationID), restorationID, OBJC_ASSOCIATION_RETAIN);
}

-(NSString *)restorationID{
    return objc_getAssociatedObject(self, _cmd);
}


@end
