//
//  DetailViewController.h
//  pint
//
//  Created by Joe Franc on 12/22/17.
//  Copyright © 2017 Joe Franc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *detailImageView;

@property (strong, nonatomic) NSString *detailImageString;
@property (strong, nonatomic) NSString *detailNoteString;

@property (strong, nonatomic) IBOutlet UILabel *detailNote;


@end
