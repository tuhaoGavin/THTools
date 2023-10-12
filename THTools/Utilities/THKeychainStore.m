//
//  NLKeychainStore.m
//  Single
//
//  Created by 涂浩 on 2020/1/22.
//  Copyright © 2020 lobochat. All rights reserved.
//

#import "THKeychainStore.h"
#import <UIKit/UIKit.h>
#import "THDeviceInfoHelper.h"
#import "THAppMacro.h"
//#import <AdSupport/AdSupport.h>

@implementation THKeychainStore
+ (NSMutableDictionary*)getKeychainQuery:(NSString*)service {
    return[NSMutableDictionary dictionaryWithObjectsAndKeys:
           (id)kSecClassGenericPassword,(id)kSecClass,
           service,(id)kSecAttrService,
           service,(id)kSecAttrAccount,
           (id)kSecAttrAccessibleAfterFirstUnlock,(id)kSecAttrAccessible,
           nil];
}
 
+ (void)save:(NSString*)service data:(id)data{
    //Get search dictionary
    NSMutableDictionary*keychainQuery = [self getKeychainQuery:service];
    //Delete old item before add new item
    SecItemDelete((CFDictionaryRef)keychainQuery);
    //Add new object to searchdictionary(Attention:the data format)
    [keychainQuery setObject:[NSKeyedArchiver archivedDataWithRootObject:data]forKey:(id)kSecValueData];
    //Add item to keychain with the searchdictionary
    SecItemAdd((CFDictionaryRef)keychainQuery,NULL);
}
 
+ (id)load:(NSString*)service {
    id ret =nil;
    NSMutableDictionary*keychainQuery = [self getKeychainQuery:service];
    //Configure the search setting
    //Since in our simple case we areexpecting only a single attribute to be returned (the password) wecan set the attribute kSecReturnData to kCFBooleanTrue
    [keychainQuery setObject:(id)kCFBooleanTrue forKey:(id)kSecReturnData];
    [keychainQuery setObject:(id)kSecMatchLimitOne forKey:(id)kSecMatchLimit];
    CFDataRef keyData =NULL;
    if(SecItemCopyMatching((CFDictionaryRef)keychainQuery,(CFTypeRef*)&keyData) ==noErr){
        @try{
            ret =[NSKeyedUnarchiver unarchiveObjectWithData:(__bridge NSData*)keyData];
        }@catch(NSException *e) {
            NSLog(@"Unarchiveof %@ failed: %@",service, e);
        }@finally{
        }
    }
    if(keyData)
        CFRelease(keyData);
    return ret;
}
 
+ (void)deleteKeyData:(NSString*)service {
    NSMutableDictionary*keychainQuery = [self getKeychainQuery:service];
    SecItemDelete((CFDictionaryRef)keychainQuery);
}


/**  获取UUID*/
+ (NSString *)getUUIDByKeyChain{
    // 这个key的前缀最好是你的BundleID
    NSString*strUUID = (NSString*)[self load:AppBundleID()];
    //首次执行该方法时，uuid为空
    if([strUUID isEqualToString:@""]|| !strUUID)
    {
        // 获取IDFA作为UUID，并存至钥匙串。（idfa当用户关闭用户追踪时会取到0000... 当还原广告标识符时会被重置）
//        strUUID = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
//
//        if(strUUID.length ==0 || [strUUID isEqualToString:@"00000000-0000-0000-0000-000000000000"])
//        {
//            //生成一个uuid的方法
//            CFUUIDRef uuidRef= CFUUIDCreate(kCFAllocatorDefault);
//            strUUID = (NSString*)CFBridgingRelease(CFUUIDCreateString(kCFAllocatorDefault,uuidRef));
//            CFRelease(uuidRef);
//        }
        
        // 获取IDFV作为UUID，并存至钥匙串。(idfv会在应用卸载后被重置)
        strUUID = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
        
        //将该uuid保存到keychain
        [self save:AppBundleID() data:strUUID];
    }
    return strUUID;
}
@end
