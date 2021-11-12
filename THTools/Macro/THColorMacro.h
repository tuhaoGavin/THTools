//
//  THColorMacro.h
//  Tools
//
//  Created by weixb on 16/12/14.
//  Copyright © 2016年 weixb. All rights reserved.
//

#ifndef THColorMacro_h
#define THColorMacro_h

//设置随机颜色
#define RandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]
//设置RGB颜色/设置RGBA颜色
#define RGB(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define RGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(r)/255.0 blue:(r)/255.0 alpha:a]


#endif /* THColorMacro_h */
