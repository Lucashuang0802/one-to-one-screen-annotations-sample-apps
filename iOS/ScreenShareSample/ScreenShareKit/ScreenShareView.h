//
//  ScreenShareView.h
//  ScreenShareSample
//
//  Created by Xi Huang on 4/26/16.
//  Copyright © 2016 Lucas Huang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScreenShareView : UIView

+ (instancetype)view;

@property (nonatomic) BOOL scrollEnabled;

- (void)addContentView:(UIView *)view;

- (void)testAnnotating;

@end
