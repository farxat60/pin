//
//  PinTableViewCell.h
//  pint
//
//  Created by Joe Franc on 12/22/17.
//  Copyright © 2017 Joe Franc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PinTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *imageTableVIewCell;
@property (strong, nonatomic) IBOutlet UILabel *noteName;
@property (strong, nonatomic) IBOutlet UILabel *boardName;
@property (strong, nonatomic) NSArray *notePin;
@property (strong, nonatomic) NSArray *namePinBoard;

@end
