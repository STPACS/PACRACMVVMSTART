//
//  PACColorSet.m
//  PACRACMVVMSTART
//
//  Created by chenliang on 2018/10/22.
//  Copyright © 2018 STPACS. All rights reserved.
//

#import "PACColorSet.h"
#define kUIColorRGB16(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
@implementation PACColorSet

+ (UIColor *)getColorMain{
    return kUIColorRGB16(0x0ebafa);
}//主题颜色

+ (UIColor *)getColor9AE4FF{
    return kUIColorRGB16(0x9AE4FF);
}

+ (UIColor *)getColor015A7C{
    return kUIColorRGB16(0x015A7C);
}

+ (UIColor *)getColord2d4d8{
    return kUIColorRGB16(0xd2d4d8);
}

+ (UIColor *)getColore6e5e5{
    return kUIColorRGB16(0xe6e5e5);
}


+ (UIColor *)getColorIndexBlueLine {
    return kUIColorRGB16(0xf4f5f5);
}

+ (UIColor *)getColorIndexBackgroundColor{
    return kUIColorRGB16(0xeeeeee);
}

+ (UIColor *)getColorIndexGrayLine{
    return kUIColorRGB16(0xf4f5f5);
}

+ (UIColor *)getColorIndexBABABA{
    return kUIColorRGB16(0xBABABA);
}

+ (UIColor *)getColorIndexF2F2F2{
    return kUIColorRGB16(0xF2F2F2);
}

+ (UIColor *)getColorIndexE9F9FF{
    return kUIColorRGB16(0xE9F9FF);
}

+ (UIColor *)getColorEAEAEA{
    return kUIColorRGB16(0xEAEAEA);
}

+ (UIColor *)getColorFA2F4C{
    return kUIColorRGB16(0xFA2F4C);
}

+ (UIColor *)getColorF1F1F1{
    return kUIColorRGB16(0xF1F1F1);
}

+ (UIColor *)getColor898989{
    return kUIColorRGB16(0x898989);
}

+ (UIColor *)getColorDDDDDD{
    return kUIColorRGB16(0xDDDDDD);
}

+ (UIColor *)getColorF0F0F0{
    return kUIColorRGB16(0xF0F0F0);
}

+ (UIColor *)getColorBAE9FB{
    return kUIColorRGB16(0xBAE9FB);
}

+ (UIColor *)getColorAEAEAE{
    return kUIColorRGB16(0xAEAEAE);
}

+ (UIColor *)getColorFF9C00{
    return kUIColorRGB16(0xFF9C00);
}

+ (UIColor *)getColorDBDBDB{
    return kUIColorRGB16(0xDBDBDB);
}

+ (UIColor *)getColorE9F9FF{
    return kUIColorRGB16(0xE9F9FF);
}

+ (UIColor *)getColorB4E8FC{
    return kUIColorRGB16(0xB4E8FC);
}















///留白底色
+ (UIColor *)getColorf9f9f9{
    return kUIColorRGB16(0xf9f9f9);
}

+ (UIColor *)getColor000000Alpha60 {
    return [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
}

+ (UIColor *)getColorE6E6E6{
    return kUIColorRGB16(0xE6E6E6);
}

+ (UIColor *)getColor1E1E1E{
    return kUIColorRGB16(0x1E1E1E);
}

+ (UIColor *)getColor646464{
    return kUIColorRGB16(0x646464);
}

+ (UIColor *)getColorC8C8C8{
    return kUIColorRGB16(0xC8C8C8);
}

+ (UIColor *)getColor969696{
    return kUIColorRGB16(0x969696);
}

+ (UIColor *)getColorFEDC00{
    return kUIColorRGB16(0xFEDC00);
}

+ (UIColor *)getColor5ECDA6{
    return kUIColorRGB16(0x5ECDA6);
}

+ (UIColor *)getColorFFA42F{
    return kUIColorRGB16(0xFFA42F);
}

+ (UIColor *)getColorF4F4F4{
    return kUIColorRGB16(0xF4F4F4);
}

+ (UIColor *)getColorFAA542{
    return kUIColorRGB16(0xFAA542);
}

+ (UIColor *)getColor33AFFF{
    return kUIColorRGB16(0x33AFFF);
}

+ (UIColor *)getColorCECECC{
    return kUIColorRGB16(0xCECECC);
}

+ (UIColor *)getColorE1E1E1{
    return kUIColorRGB16(0xE1E1E1);
}

@end
