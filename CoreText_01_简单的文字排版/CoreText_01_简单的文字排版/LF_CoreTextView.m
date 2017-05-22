//
//  LF_CoreTextView.m
//  CoreText_01_简单的文字排版
//
//  Created by apple on 2017/5/22.
//  Copyright © 2017年 baixinxueche. All rights reserved.
//

#import "LF_CoreTextView.h"
#import <CoreText/CoreText.h>

@implementation LF_CoreTextView


- (void)drawRect:(CGRect)rect {
    //1.获取当前绘制画布的上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    //2.翻转当前的坐标系（因为对于底层绘制引擎来说，屏幕左下角是(0,0),而UIView是以左上角为原点）
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    CGContextTranslateCTM(context, 0, self.bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    //3 创建绘制区域
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddEllipseInRect(path, NULL, self.bounds);
    //4.创建需要绘制的文字
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:@"如果你正在创建一个iPad上的杂志或书籍的应用程序，使用CoreText非常方便。这个CoreText教程将带你如何使用CoreText创建一个杂志应用你将学习如何： 奠定格式化的上下文本在屏幕上 微调文本的外观 向文本内容中添加图片 最后创建一个杂志的应用程序，它加载文本标记来轻松地控制渲染文本的格式* 最后吃掉你的脑子，如果你正在创建一个iPad上的杂志或书籍的应用程序，使用CoreText非常方便。这个CoreText教程将带你如何使用CoreText创建一个杂志应用你将学习如何： 奠定格式化的上下文本在屏幕上 微调文本的外观 向文本内容中添加图片 最后创建一个杂志的应用程序，它加载文本标记来轻松地控制渲染文本的格式* 最后吃掉你的脑，如果你正在创建一个iPad上的杂志或书籍的应用程序，使用CoreText非常方便。这个CoreText教程将带你如何使用CoreText创建一个杂志应用你将学习如何： 奠定格式化的上下文本在屏幕上 微调文本的外观 向文本内容中添加图片 最后创建一个杂志的应用程序，它加载文本标记来轻松地控制渲染文本的格式* 最后吃掉你的脑"];
    
    // 步骤8：设置部分文字颜色
    [attString addAttribute:(id)kCTForegroundColorAttributeName value:[UIColor greenColor] range:NSMakeRange(10, 10)];
    
    // 设置部分文字字体
    CGFloat fontSize = 20;
    CTFontRef fontRef = CTFontCreateWithName((CFStringRef)@"ArialMT", fontSize, NULL);
    [attString addAttribute:(id)kCTFontAttributeName value:(__bridge id)fontRef range:NSMakeRange(15, 10)];
    CFRelease(fontRef);
    
    // 设置行间距
    CGFloat lineSpacing = 10;
    const CFIndex kNumberOfSettings = 3;
    CTParagraphStyleSetting theSettings[kNumberOfSettings] = {
        {kCTParagraphStyleSpecifierLineSpacingAdjustment, sizeof(CGFloat), &lineSpacing},
        {kCTParagraphStyleSpecifierMaximumLineSpacing, sizeof(CGFloat), &lineSpacing},
        {kCTParagraphStyleSpecifierMinimumLineSpacing, sizeof(CGFloat), &lineSpacing}
    };
    CTParagraphStyleRef theParagraphRef = CTParagraphStyleCreate(theSettings, kNumberOfSettings);
    [attString addAttribute:(id)kCTParagraphStyleAttributeName value:(__bridge id)theParagraphRef range:NSMakeRange(0, attString.length)];
    CFRelease(theParagraphRef);
    
    
    
    // 5.根据AttributedString生成CTFramesetterRef
    CTFramesetterRef framesetter=CTFramesetterCreateWithAttributedString((CFAttributedStringRef)attString);//一个frame的工厂，负责生成frame
    CTFrameRef frame = CTFramesetterCreateFrame(framesetter,
                             CFRangeMake(0, [attString length]), path, NULL);//工厂根据绘制区域及富文本（可选范围，多次设置）设置frame
    // 6.进行绘制
    CTFrameDraw(frame, context);
    // 7.内存管理
    CFRelease(frame);
    CFRelease(path);
    CFRelease(framesetter);
}


@end
