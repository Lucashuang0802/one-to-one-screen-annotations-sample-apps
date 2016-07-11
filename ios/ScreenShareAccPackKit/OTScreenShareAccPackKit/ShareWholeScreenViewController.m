//
//  ShareWholeScreenViewController.m
//  OTScreenShareAccPackKit
//
//  Created by Xi Huang on 7/7/16.
//  Copyright © 2016 Tokbox, Inc. All rights reserved.
//

#import "ShareWholeScreenViewController.h"
#import "ColorViewController.h"
#import "OTScreenSharer.h"

@interface ShareWholeScreenViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (nonatomic) UIColor *viewControllerColor;
@property (nonatomic) OTScreenSharer *screenSharer;
@end

@implementation ShareWholeScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.kayak.com/"]];
    [self.webView loadRequest:requestObj];
    [self.webView reload];
    
    UIBarButtonItem *previewBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Navigate" style:UIBarButtonItemStylePlain target:self action:@selector(navigateToOtherViews)];
    self.navigationItem.rightBarButtonItem = previewBarButtonItem;

    // UNCOMMENT this will start the screen share and you can view it from another subscriber
//    self.screenSharer = [OTScreenSharer screenSharer];
//    [self.screenSharer connectWithView:[UIApplication sharedApplication].keyWindow.rootViewController.view handler:^(ScreenShareSignal signal, NSError *error) {
//        
//        NSLog(@"%@", error);
//    }];
}

- (void)navigateToOtherViews {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Choose a color"
                                                                   message:@"It will present a blank view controller with the color chosen by YOU!"
                                                            preferredStyle:UIAlertControllerStyleActionSheet];
    [alert addAction:[UIAlertAction actionWithTitle:@"RED" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
    
        _viewControllerColor = [UIColor redColor];
        [self performSegueWithIdentifier:@"ColorViewControllerSegue" sender:nil];
    }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"BLUE" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        _viewControllerColor = [UIColor blueColor];
        [self performSegueWithIdentifier:@"ColorViewControllerSegue" sender:nil];
    }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"GREEN" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        _viewControllerColor = [UIColor greenColor];
        [self performSegueWithIdentifier:@"ColorViewControllerSegue" sender:nil];
    }]];
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"ColorViewControllerSegue"]) {
        ColorViewController *colorVC = (ColorViewController *)segue.destinationViewController;
        colorVC.viewControllerColor = _viewControllerColor;
        [self.screenSharer updateView:colorVC.view];
    }
}

-(IBAction)prepareForUnwind:(UIStoryboardSegue *)segue {
    [self.screenSharer updateView:[UIApplication sharedApplication].keyWindow.rootViewController.view];
}

@end
