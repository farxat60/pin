//
//  SignInViewController.m
//  pint
//
//  Created by Joe Franc on 12/15/17.
//  Copyright © 2017 Joe Franc. All rights reserved.
//

#import "SignInViewController.h"
#import <PinterestSDK/PinterestSDK.h>
#import "PinterestSDK/PDKClient.h"
#import "PDKBoard.h"
#import "PDKClient.h"
#import "PDKPin.h"
#import "PDKResponseObject.h"
#import "PDKUser.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "PDKImageInfo.h"

@class PinterestSDK;






@interface SignInViewController ()


@property (strong, nonatomic) IBOutlet UIButton *signInPinterest;
@property (strong, nonatomic) IBOutlet UILabel *fitstNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *lastNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *userName;
@property (strong, nonatomic) IBOutlet UIImageView *avatarImage;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *navigatorBarButton;
@property (strong, nonatomic) IBOutlet UILabel *helloLable;



@end

@implementation SignInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigatorBarButton.enabled = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}




//authenticate pinterest

- (IBAction)authenticateButtonTapped:(UIButton *)sender {
    [[PDKClient sharedInstance] authenticateWithPermissions:@[PDKClientReadPublicPermissions,
                                                              PDKClientWritePublicPermissions,
                                                              PDKClientReadRelationshipsPermissions,
                                                              PDKClientWriteRelationshipsPermissions,
                                                              ]
                                         fromViewController:self
                                                withSuccess:^(PDKResponseObject *responseObject){
     
         PDKUser *user = [responseObject user];
         self.fitstNameLabel.text = user.firstName;
         self.lastNameLabel.text = user.lastName;
         self.userName.text = user.username;
         NSDictionary *dict = [responseObject parsedJSONDictionary];
         NSString *url = [[[[dict valueForKeyPath:@"data"]valueForKey:@"image"]valueForKey:@"60x60"]valueForKey:@"url"];
         [self.avatarImage sd_setImageWithURL:[NSURL URLWithString:url]];
                                                    
//Visual effect on view controller
                                                    
         self.avatarImage.layer.cornerRadius = self.avatarImage.frame.size.width / 2;
         self.avatarImage.clipsToBounds = YES;
         self.avatarImage.layer.borderWidth = 1;
         self.avatarImage.layer.borderColor = [UIColor whiteColor].CGColor;
         self.navigatorBarButton.enabled = YES;
         self.helloLable.hidden = YES;
                                              
     } andFailure:^(NSError *error) {
         NSLog(@"authentication failed: %@", error);
     }];

}


@end
