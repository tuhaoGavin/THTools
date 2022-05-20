//
//  NSString+Util_th.m
//  Tools
//
//  Created by 涂浩 on 16/12/19.
//  Copyright © 2016年 TuHao. All rights reserved.
//

#import "NSString+Util_th.h"

@implementation NSString (Util_th)

/**
 *  根据各种情况判断字符串是否为空 是空返回yes
 */
+ (BOOL)th_isEmptyString:(NSString *)str {
    if(str==nil || (id)str==[NSNull null])
        return YES;
    
    if(str.length<=0)
        return YES;
    
    if([str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length<=0)
        return YES;
    
    return NO;
}

/**
 *  将中文字符串转为拼音
 *
 *  @param string 中文
 *
 *  @return 拼音
 */
+ (NSString *)th_pinyinWithChineseString:(NSString *)string {
    // 将中文字符串转成可变字符串
    NSMutableString *pinyinText = [[NSMutableString alloc] initWithString:string];
    // 先转换为带声调的拼音
    CFStringTransform((__bridge CFMutableStringRef)pinyinText, 0, kCFStringTransformMandarinLatin, NO);// 输出 pinyin: zhōng guó sì chuān
    // 再转换为不带声调的拼音
    CFStringTransform((__bridge CFMutableStringRef)pinyinText, 0, kCFStringTransformStripDiacritics, NO);// 输出 pinyin: zhong guo si chuan
    // 转换为首字母大写拼音
    // NSString *capitalPinyin = [pinyinText capitalizedString];
    // 输出 capitalPinyin: Zhong Guo Si Chuan
    // 替换掉空格
    NSString *newString = [NSString stringWithFormat:@"%@",pinyinText];
    NSString *newStr = [newString stringByReplacingOccurrencesOfString:@" " withString:@""];
    return newStr.lowercaseString;
}

+ (NSMutableAttributedString *)th_changeWithTargetString:(NSString *)targetStr rangStrings:(NSArray *)rangStrings colers:(NSArray *)colors fonts:(NSArray *)fonts
{
    NSMutableAttributedString *attributeS = [[NSMutableAttributedString alloc] initWithString:targetStr];
    for (NSInteger i = 0; i < [rangStrings count]; i++) {
        NSString *rangString = rangStrings[i];
        UIColor *color = colors[i];
        UIFont *font = fonts[i];
        NSRange range = [targetStr rangeOfString: rangString];
        [attributeS addAttribute:NSForegroundColorAttributeName value:color range:range];
        [attributeS addAttribute:NSFontAttributeName value:font range:range];
    }
    return attributeS;
}

+ (NSMutableAttributedString *)th_getAttributedStringWithString:(NSString *)string lineSpace:(CGFloat)lineSpace {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = lineSpace; // 调整行间距
    NSRange range = NSMakeRange(0, [string length]);
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:range];
    return attributedString;
}

+ (NSString *)stringChangeMoneyWithStr:(NSString *)str numberStyle:(NSNumberFormatterStyle)numberStyle {
    
    // 判断是否null 若是赋值为0 防止崩溃
    if (([str isEqual:[NSNull null]] || str == nil)) {
        str = 0;
    }
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
    formatter.numberStyle = numberStyle;
    // 注意传入参数的数据长度，可用double
    NSString *money = [formatter stringFromNumber:[NSNumber numberWithDouble:[str doubleValue]]];
    
    return money;
}

+ (NSString *)th_getAgeWithBirth:(NSString *)birth {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    if ([birth containsString:@"/"]) {
        [dateFormatter setDateFormat:@"yyyy/MM/dd"];
    } else {
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    }
    NSDate *date = [dateFormatter dateFromString:birth];
    if (date) {
        // 出生日期转换 年月日
        NSDateComponents *components1 = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:date];
        NSInteger brithDateYear  = [components1 year];
        NSInteger brithDateDay   = [components1 day];
        NSInteger brithDateMonth = [components1 month];
        // 获取系统当前 年月日
        NSDateComponents *components2 = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:[NSDate date]];
        NSInteger currentDateYear  = [components2 year];
        NSInteger currentDateDay   = [components2 day];
        NSInteger currentDateMonth = [components2 month];
        // 计算年龄
        NSInteger iAge = currentDateYear - brithDateYear - 1;
        if ((currentDateMonth > brithDateMonth) || (currentDateMonth == brithDateMonth && currentDateDay >= brithDateDay)) {
            iAge++;
        }
        return [NSString stringWithFormat:@"%ld", (long)iAge];
    } else {
        return @"0";
    }
}

+ (NSString *)th_noEmptyStr:(NSString *)str {
    if ([self th_isEmptyString:str]) {
        return @"";
    } else {
        return str;
    }
}

//传入 秒  得到 xx:xx:xx
+(NSString *)th_getHHMMSSFromSS:(NSString *)totalTime{

    NSInteger seconds = [totalTime integerValue];

    //format of hour
    NSString *str_hour = [NSString stringWithFormat:@"%02ld",seconds/3600];
    //format of minute
    NSString *str_minute = [NSString stringWithFormat:@"%02ld",(seconds%3600)/60];
    //format of second
    NSString *str_second = [NSString stringWithFormat:@"%02ld",seconds%60];
    //format of time
    NSString *format_time = [NSString stringWithFormat:@"%@:%@:%@",str_hour,str_minute,str_second];

    return format_time;

}

//传入 秒  得到  xx分钟xx秒
+(NSString *)th_getMMSSFromSS:(NSString *)totalTime{

    NSInteger seconds = [totalTime integerValue];

    //format of minute
    NSString *str_minute = [NSString stringWithFormat:@"%ld",seconds/60];
    //format of second
    NSString *str_second = [NSString stringWithFormat:@"%02ld",seconds%60];
    //format of time
    NSString *format_time = [NSString stringWithFormat:@"%@:%@",str_minute,str_second];

    return format_time;

}

@end
