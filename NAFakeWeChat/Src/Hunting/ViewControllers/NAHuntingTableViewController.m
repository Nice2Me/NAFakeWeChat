//
//  NAHuntingTableViewController.m
//  NAFakeWeChat
//
//  Created by zuopengl on 3/18/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import "NAHuntingTableViewController.h"
#import "NAHuntingItemModel.h"
#import "NAHuntingItemCell.h"


typedef NS_ENUM(NSUInteger, NAHuntingSection) {
    kNAHuntingMoments,
    kNAHuntingActivities,
    kNAHuntingNearby,
    kNAHuntingPastime,
};

@interface NAHuntingTableViewController ()
@property (nonatomic, strong) NSMutableDictionary *huntingSections;
@end


@implementation NAHuntingTableViewController

- (NSString *)navigationTitle {
    return @"发现";
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self initHuntingSections];
}

- (void)initHuntingSections {
    self.huntingSections = [NSMutableDictionary dictionaryWithCapacity:5];
    
    // Profile
    NSMutableArray *section1 = [@[[NAHuntingItemModel itemWithTitle:@"朋友圈" image:nil]] mutableCopy];
    safeDictionaryAddObject(self.huntingSections, @(kNAHuntingMoments), section1);
    
    // scan and shake (activities)
    NAHuntingItemModel *scanItem = [NAHuntingItemModel itemWithTitle:@"扫一扫" image:nil];
    NAHuntingItemModel *shakeItem = [NAHuntingItemModel itemWithTitle:@"摇一摇" image:nil];
    NSMutableArray *section2 = [@[scanItem, shakeItem] mutableCopy];
    safeDictionaryAddObject(self.huntingSections, @(kNAHuntingActivities), section2);

    // nearby
    NAHuntingItemModel *nearbyItem = [NAHuntingItemModel itemWithTitle:@"附近的人" image:nil];
    NSMutableArray *section3 = [@[nearbyItem] mutableCopy];
    safeDictionaryAddObject(self.huntingSections, @(kNAHuntingNearby), section3);
    
    // shopping and game
    NAHuntingItemModel *shoppingItem = [NAHuntingItemModel itemWithTitle:@"购物" image:nil];
    NAHuntingItemModel *gameItem = [NAHuntingItemModel itemWithTitle:@"游戏" image:nil];
    NSMutableArray *section4 = [@[shoppingItem, gameItem] mutableCopy];
    safeDictionaryAddObject(self.huntingSections, @(kNAHuntingPastime), section4);
}

- (void)updateHuntingSections {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.tableView reloadData];
}

#pragma mark - UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.huntingSections count];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *items = safeValueFromDictionaryByKey(self.huntingSections, @(section));
    return [items count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NAHuntingItemCell *cell = nil;
    NAHuntingItemModel *itemModel = safeObjectFromDictionaryArray(self.huntingSections, @(indexPath.section), indexPath.row);
    if (itemModel) {
        cell = [tableView dequeueReusableCellWithIdentifier:kNABaseArrowCellIdentifier];
        if (!cell) {
            cell = [self loadNibWithName:kNABaseArrowCellIdentifier];
        }
        
        [cell updateWithItem:itemModel];
    }
    
    return !cell ? [[UITableViewCell alloc] init] : cell;
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
