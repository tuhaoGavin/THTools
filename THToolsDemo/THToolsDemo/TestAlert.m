//
//  TestAlert.m
//  THToolsDemo
//
//  Created by Qi on 2021/11/16.
//

#import "TestAlert.h"

@implementation TestAlert

+ (instancetype)alertWithPosition:(THAlertViewPosition)position {
    TestAlert * alert = [super loadNibWithWidth:300 height:200 position:position];
    return alert;
}

@end
