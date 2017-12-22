//
//  TablePinVIewController.m
//  pint
//
//  Created by Joe Franc on 12/21/17.
//  Copyright © 2017 Joe Franc. All rights reserved.
//

#import "TablePinVIewController.h"
#import <PinterestSDK/PinterestSDK.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "PinTableViewCell.h"
#import "DetailViewController.h"


static NSString *const kTablePinTableVIewCell = @"kTablePinTableVIewCell";

@interface TablePinVIewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *pinTableView;
@property (strong, nonatomic) NSArray *imageArray;
@property (strong, nonatomic) NSArray *noteFromPin;



@end

@implementation TablePinVIewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.pinTableView.delegate = self;
    self.pinTableView.dataSource = self;
    
    
    [self getBoardPin];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.imageArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 250;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    PinTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kTablePinTableVIewCell];
    
    NSString * result = [self.imageArray objectAtIndex:indexPath.row];
    NSString * notePins = [self.noteFromPin objectAtIndex:indexPath.row];
    
    [cell.imageTableVIewCell sd_setImageWithURL:[NSURL URLWithString:result]];
    cell.noteName.text = notePins;
    
    return cell;
}

//Gat pins from pinterest

- (void)getBoardPin {
    [[PDKClient sharedInstance] getAuthenticatedUserPinsWithFields:[NSSet setWithObjects:@"image",@"note",@"created_at", nil] success:^(PDKResponseObject *responseObject) {

        NSDictionary *dict = [responseObject parsedJSONDictionary];
        
        self.imageArray = [[dict valueForKeyPath:@"data.image.original"]valueForKey:@"url"];
        self.noteFromPin = [[dict valueForKeyPath:@"data"]valueForKey:@"note"];
    
        [self.pinTableView reloadData];
        
        
        
    } andFailure:^(NSError *error) {
        NSLog(@"ERROR");
    }];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"detailViewController"]){
        DetailViewController *imageDetail = segue.destinationViewController;
        NSIndexPath *myIndexPath = [self.pinTableView indexPathForSelectedRow];
        long row = [myIndexPath row];
        imageDetail.detailImageString = self.imageArray[row];
        imageDetail.detailNoteString = self.noteFromPin[row];

        
    }
}





@end
