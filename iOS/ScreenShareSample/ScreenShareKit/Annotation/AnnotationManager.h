//
//  AnnotationManager.h
//  ScreenShareSample
//
//  Created by Xi Huang on 5/18/16.
//  Copyright © 2016 Lucas Huang. All rights reserved.
//

#import <ScreenShareKit/AnnotationPath.h>
#import <ScreenShareKit/AnnotationTextView.h>

@interface AnnotationManager : NSObject

@property (readonly, nonatomic) NSArray<id<Annotatable>> *annotatable;

@property (readonly, nonatomic) NSUInteger count;

- (instancetype)init;

- (void)addAnnotatable:(id<Annotatable>)annotatable;

- (id<Annotatable>)pop;

- (id<Annotatable>)peakOfAnnotatable;

- (BOOL)containsAnnotatable:(id<Annotatable>)annotatable;

- (void)undo;

@end