//
//  Header.h
//  Internationalization
//
//  Created by 张体宾 on 2017/11/27.
//  Copyright © 2017年 Dreams of Ideal World Co., Ltd. All rights reserved.
//

#ifndef Header_h
#define Header_h

//语言改变通知
static NSString *const ZTBLanguageChangedNotification = @"ZTBLanguageChangedNotification"; //
//当前语言
static NSString *const appLanguage = @"appLanguage";
#define Localized(key)  [[NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"appLanguage"]] ofType:@"lproj"]] localizedStringForKey:(key) value:nil table:@"Localizable"]

#endif /* Header_h */

