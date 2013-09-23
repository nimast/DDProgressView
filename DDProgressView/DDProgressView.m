//
//  DDProgressView.m
//  DDProgressView
//
//  Created by Damien DeVille on 3/13/11.
//  Copyright 2011 Snappy Code. All rights reserved.
//

#import "DDProgressView.h"

@implementation DDProgressView

@synthesize innerColor;
@synthesize emptyColor;
@synthesize progress;
@synthesize displayedWhenStopped;

- (id)init {
    return [self initWithFrame:CGRectZero];
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.innerColor = [UIColor lightGrayColor];
        self.emptyColor = [UIColor clearColor];
        self.displayedWhenStopped = YES;
    }
    return self;
}

- (void)dealloc {
    [innerColor release], innerColor = nil ;
    [emptyColor release], emptyColor = nil ;

    [super dealloc];
}

- (void)setProgress:(float)theProgress {
    // make sure the user does not try to set the progress outside of the bounds
    if (theProgress > 1.0f)
        theProgress = 1.0f;
    if (theProgress < 0.0f)
        theProgress = 0.0f;


    if (!displayedWhenStopped && self.hidden && theProgress > 0.0f) {
        self.hidden = NO;
    } else if (!displayedWhenStopped && !self.hidden && theProgress == 1.0f) {
        self.hidden = YES;
    }


    progress = theProgress;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextSaveGState(context);

    CGContextSetAllowsAntialiasing(context, TRUE);

    [emptyColor setFill];
    [emptyColor setStroke];
    CGContextFillRect(context, rect);

    rect.size.width *= progress;

    [innerColor setFill];
    [innerColor setStroke];

    CGContextFillRect(context, rect);

    CGContextRestoreGState(context);
}

@end
