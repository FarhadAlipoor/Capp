//
//  GMUCustomizationsHelper.m
//  Chilivery
//
//  Created by Sina KH on 1/12/17.
//  Copyright © 2017 Chilivery. All rights reserved.
//

#import "GMUCustomizationsHelper.h"

@implementation GMUCustomizationsHelper

+ (NSString*) persianDigits: (NSString*) string {
    string = [string stringByReplacingOccurrencesOfString:@"0" withString:@"۰"];
    string = [string stringByReplacingOccurrencesOfString:@"1" withString:@"۱"];
    string = [string stringByReplacingOccurrencesOfString:@"2" withString:@"۲"];
    string = [string stringByReplacingOccurrencesOfString:@"3" withString:@"۳"];
    string = [string stringByReplacingOccurrencesOfString:@"4" withString:@"۴"];
    string = [string stringByReplacingOccurrencesOfString:@"5" withString:@"۵"];
    string = [string stringByReplacingOccurrencesOfString:@"6" withString:@"۶"];
    string = [string stringByReplacingOccurrencesOfString:@"7" withString:@"۷"];
    string = [string stringByReplacingOccurrencesOfString:@"8" withString:@"۸"];
    string = [string stringByReplacingOccurrencesOfString:@"9" withString:@"۹"];
    return string;
}

+ (NSString*) fontName {
    return @"IRANSansMobile-Medium";
}

@end
