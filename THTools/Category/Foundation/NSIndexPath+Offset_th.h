//
//  NSIndexPath+Offset_th.h
//  THToolsDemo
//
//  Created by weixb on 2017/2/16.
//  Copyright © 2017年 weixb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSIndexPath (Offset_th)

/**
 *  @author JKCategories
 *
 *  Compute previous row indexpath
 *
 */
- (NSIndexPath *)th_previousRow;
/**
 *  @author JKCategories
 *
 *  Compute next row indexpath
 *
 */
- (NSIndexPath *)th_nextRow;
/**
 *  @author JKCategories
 *
 *  Compute previous item indexpath
 *
 */
- (NSIndexPath *)th_previousItem;
/**
 *  @author JKCategories
 *
 *  Compute next item indexpath
 *
 */
- (NSIndexPath *)th_nextItem;
/**
 *  @author JKCategories
 *
 *  Compute next section indexpath
 *
 */
- (NSIndexPath *)th_nextSection;
/**
 *  @author JKCategories
 *
 *  Compute previous section indexpath
 *
 */
- (NSIndexPath *)th_previousSection;

@end
