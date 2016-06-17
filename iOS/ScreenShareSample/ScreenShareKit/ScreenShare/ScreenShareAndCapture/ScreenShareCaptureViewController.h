//
//  ShareViewController.h
//  ScreenShareSample
//
//  Created by Xi Huang on 5/19/16.
//  Copyright © 2016 Lucas Huang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScreenShareCaptureViewController : UIViewController

@property (nonatomic) UIImage *sharedImage;
- (instancetype)initWithSharedImage:(UIImage *)sharedImage;

@end
