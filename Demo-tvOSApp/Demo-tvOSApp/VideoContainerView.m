//
//  VideoContainerView.m
//  Demo-tvOSApp
//
//  Created by Jovanny Espinal on 3/7/16.
//  Copyright © 2016 Jovanny Espinal. All rights reserved.
//

#import "VideoContainerView.h"

@implementation VideoContainerView

- (void)layoutSublayersOfLayer:(CALayer *)layer
{
    [super layoutSublayersOfLayer:layer];
    self.playerLayer.frame = self.bounds;
}

@end
