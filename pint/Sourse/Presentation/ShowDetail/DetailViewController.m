//
//  DetailViewController.m
//  pint
//
//  Created by Joe Franc on 12/22/17.
//  Copyright © 2017 Joe Franc. All rights reserved.
//

#import "DetailViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "PDKImageInfo.h"

@class PinterestSDK;






@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self useImage];
}

//Detail view from tableView
-(void) useImage {
    [self.detailImageView sd_setImageWithURL:[NSURL URLWithString:self.detailImageString]];
    self.detailNote.text = self.detailNoteString;
}

@end
