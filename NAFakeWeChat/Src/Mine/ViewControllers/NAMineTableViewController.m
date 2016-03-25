//
//  NAMineTableViewController.m
//  NAFakeWeChat
//
//  Created by zuopengl on 3/17/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import "NAMineTableViewController.h"
#import "NAProfileTableViewCell.h"
#import "NABaseThumbTitleCell.h"
#import "NAMineModel.h"



// Mine section
typedef NS_ENUM(NSUInteger, NAMineSection) {
    kNAMineProfileSection,
    kNAMinePhotoCardSection,
    kNAMineMoneySuitSection,
    kNAMineEmotionSuitSection,
    kNAMineSettingSection,
};


@interface NAMineTableViewController ()
//@property (nonatomic, strong) NSArray *mineItems;
@property (nonatomic, strong) NSMutableDictionary *mineSections;
@end

@implementation NAMineTableViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        [self initMineSections];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self initMineSections];
}

- (void)initMineSections {
    self.mineSections = [NSMutableDictionary dictionaryWithCapacity:5];
    
    // Profile
    NSMutableArray *section1 = [@[[NAProfileItem itemWithTitle:@"liuzp" subTitle:@"liuzp19890810" image:nil qrCode:nil]] mutableCopy];
    safeDictionaryAddObject(self.mineSections, @(kNAMineProfileSection), section1);
    
    // Camera and Collection
    NAMineItem *cameraItem = [NAMineItem itemWithTitle:@"相册" image:nil];
    NAMineItem *collectItem = [NAMineItem itemWithTitle:@"收藏" image:nil];
    NSMutableArray *section2 = [@[cameraItem, collectItem] mutableCopy];
    safeDictionaryAddObject(self.mineSections, @(kNAMinePhotoCardSection), section2);
    
    // Wallet and Coupoun
    NAMineItem *walletItem = [NAMineItem itemWithTitle:@"钱包" image:nil];
    NAMineItem *coupounItem = [NAMineItem itemWithTitle:@"优惠券" image:nil];
    NSMutableArray *section3 = [@[walletItem, coupounItem] mutableCopy];
    safeDictionaryAddObject(self.mineSections, @(kNAMineMoneySuitSection), section3);
    
    // emotion
    NAMineItem *emotionItem = [NAMineItem itemWithTitle:@"表情" image:nil];
    NSMutableArray *section4 = [@[emotionItem] mutableCopy];
    safeDictionaryAddObject(self.mineSections, @(kNAMineEmotionSuitSection), section4);
    
    // setting
    NAMineItem *settingItem = [NAMineItem itemWithTitle:@"设置" image:nil];
    NSMutableArray *section5 = [@[settingItem] mutableCopy];
    safeDictionaryAddObject(self.mineSections, @(kNAMineSettingSection), section5);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = [self navigationTitle];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.tableView reloadData];
}

- (NSString *)navigationTitle {
    return @"我";
}

#pragma mark - UITableViewDelegate 

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.mineSections count];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *items = safeValueFromDictionaryByKey(self.mineSections, @(section));
    return [items count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat height = 0;
    if (indexPath.section == kNAMineProfileSection) {
        height = 99;
    } else {
        height = 81;
    }
    return height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == kNAMineProfileSection) {
        NAProfileTableViewCell *profileCell = [tableView dequeueReusableCellWithIdentifier:kNAMineProfileCellIdentifier];
        
        
        NAProfileItem *profileItem = safeObjectFromDictionaryArray(self.mineSections, @(indexPath.section), indexPath.row);
        [profileCell updateWithItem:profileItem];
        
        return profileCell;
    } else {
        NABaseThumbTitleCell *itemCell = [tableView dequeueReusableCellWithIdentifier:kNAMineItemCellIdentifier];
        
        
        NAMineItem *item = safeObjectFromDictionaryArray(self.mineSections, @(indexPath.section), indexPath.row);
        [itemCell updateWithItem:item];
        
        return itemCell;
    }
    
    return [[UITableViewCell alloc] init];;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    // Remove seperator inset
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    // Prevent the cell from inheriting the Table View's margin settings
    if ([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
    
    // Explictly set your cell's layout margins
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

@end
