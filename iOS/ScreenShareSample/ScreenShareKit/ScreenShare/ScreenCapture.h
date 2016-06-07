//
//  ScreenCapture.h
//  ScreenCapture
//
//  Created by Esteban Cordero on 3/7/16.
//  Copyright © 2016 Esteban Cordero. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 * Periodically sends video frames to an OpenTok Publisher by rendering the
 * CALayer for a UIView.
 */
@interface ScreenCapture : NSObject

@property (nonatomic) UIView *view;

/**
 * Initializes a video capturer that will grab rendered stills of the view.
 */
- (instancetype)initWithView:(UIView*)view;

@end