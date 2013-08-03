//
//  CustomHeader.m
//  Core-Graphics
//
//  Created by Equipo Desarrollo 2 on 3/08/13.
//  Copyright (c) 2013 Cymetria. All rights reserved.
//

#import "CustomHeader.h"
#import "Coomon.h"

@interface CustomHeader()
@property (nonatomic, assign) CGRect coloredBoxRect;
@property (nonatomic, assign) CGRect paperRect;
@end

@implementation CustomHeader

- (id)init{
    self = [super init];
    if(self){
        self.backgroundColor = [UIColor clearColor];
        self.opaque = NO;
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.font = [UIFont boldSystemFontOfSize:20.0];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.shadowColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        _titleLabel.shadowOffset = CGSizeMake(0, -1);
        [self addSubview:_titleLabel];
        
        _lightColor = [UIColor colorWithRed:0.289 green:0.570 blue:0.701 alpha:1.0];
        _darkColor = [UIColor colorWithRed:0.141 green:0.360 blue:0.533 alpha:1.0];
        
    }
    return self;
}
-(void)layoutSubviews{
    CGFloat coloredBoxMargin= 6.0;
    CGFloat coloredBoxHeight= 40.0;
    
    self.coloredBoxRect = CGRectMake(coloredBoxMargin, coloredBoxMargin, self.bounds.size.width - coloredBoxMargin * 2, coloredBoxHeight);

    CGFloat paperMargin = 9.0;
    
    self.paperRect = CGRectMake(paperMargin, CGRectGetMaxY(self.coloredBoxRect), self.bounds.size.width - paperMargin*2, self.bounds.size.height - CGRectGetMaxY(self.coloredBoxRect));
    
    self.titleLabel.frame = self.coloredBoxRect;
    
    
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIColor *whiteColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    UIColor *shadowColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.5];
    CGContextSetFillColorWithColor(context, whiteColor.CGColor);
    CGContextFillRect(context, _paperRect);
    
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, CGSizeMake(0, 2), 2.0, shadowColor.CGColor);
    CGContextSetFillColorWithColor(context, self.lightColor.CGColor);
    
    CGContextFillRect(context, self.coloredBoxRect);
    CGContextRestoreGState(context);
    
    drawGlossAndGradient(context, self.coloredBoxRect, self.lightColor.CGColor , self.darkColor.CGColor);
    
    CGContextSetStrokeColorWithColor(context, self.darkColor.CGColor);
    CGContextSetLineWidth(context, 1.0);
    
    CGContextStrokeRect(context, rectFor1pxStroke(self.coloredBoxRect));
    
}


@end
