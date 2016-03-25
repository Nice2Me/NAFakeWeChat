//
//  NAContactsTableViewController.m
//  NAFakeWeChat
//
//  Created by zuopengl on 3/18/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import "NAContactsTableViewController.h"
#import "NAContactItemModel.h"
#import "NABaseContactCell.h"


typedef NS_ENUM(NSUInteger, NAContactSection) {
    kNAContactCategory = 0,
    kNAContactA,
    kNAContactB,
    kNAContactC,
    kNAContactD,
    kNAContactE,
    kNAContactF,
    kNAContactG,
    kNAContactH,
    kNAContactI,
    kNAContactJ,
    kNAContactK,
    kNAContactL,
    kNAContactM,
    kNAContactN,
    kNAContactO,
    kNAContactP,
    kNAContactQ,
    kNAContactR,
    kNAContactS,
    kNAContactT,
    kNAContactU,
    kNAContactV,
    kNAContactW,
    kNAContactX,
    kNAContactY,
    kNAContactZ,
    kNAContactStar, // *
    kNAContactWell, // #
};
static inline NSString *stringFromContactType(NAContactSection type);


/**
 *  NAContactsTableViewController
 */
@interface NAContactsTableViewController ()
@property (nonatomic, strong) NSMutableArray *contactSections; // consists of NSDictionary
@end

@implementation NAContactsTableViewController

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self initContactSection];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.tableView reloadData];
}

- (void)initContactSection {
    self.contactSections = [NSMutableArray arrayWithCapacity:26];
    
    // Profile
    NSMutableArray *section1 = [@[[NAContactItemModel itemWithTitle:@"新的朋友" image:nil],
                                  [NAContactItemModel itemWithTitle:@"群聊" image:nil],
                                  [NAContactItemModel itemWithTitle:@"标签" image:nil]] mutableCopy];
    safeArrayAddObject(self.contactSections, @{@(kNAContactCategory): section1});
    
    // A
    NAContactItemModel *aItem = [NAContactItemModel itemWithTitle:@"A扫一扫" image:nil];
    NSMutableArray *sectionA = [@[aItem, aItem] mutableCopy];
    safeArrayAddObject(self.contactSections, @{@(kNAContactA): sectionA});
    
    // B
    NAContactItemModel *bItem = [NAContactItemModel itemWithTitle:@"B扫一扫" image:nil];
    NSMutableArray *sectionB = [@[bItem, bItem] mutableCopy];
    safeArrayAddObject(self.contactSections, @{@(kNAContactB): sectionB});
    
    // C
    NAContactItemModel *cItem = [NAContactItemModel itemWithTitle:@"C扫一扫" image:nil];
    NSMutableArray *sectionC = [@[cItem, cItem] mutableCopy];
    safeArrayAddObject(self.contactSections, @{@(kNAContactC): sectionC});
    
    // D
    NAContactItemModel *dItem = [NAContactItemModel itemWithTitle:@"D扫一扫" image:nil];
    NSMutableArray *sectionD = [@[dItem, dItem] mutableCopy];
    safeArrayAddObject(self.contactSections, @{@(kNAContactD): sectionD});
    
    // E
    NAContactItemModel *eItem = [NAContactItemModel itemWithTitle:@"E扫一扫" image:nil];
    NSMutableArray *sectionE = [@[eItem, eItem] mutableCopy];
    safeArrayAddObject(self.contactSections, @{@(kNAContactE): sectionE});
    
    // F
    NAContactItemModel *fItem = [NAContactItemModel itemWithTitle:@"F扫一扫" image:nil];
    NSMutableArray *sectionF = [@[fItem, fItem] mutableCopy];
    safeArrayAddObject(self.contactSections, @{@(kNAContactF): sectionF});
    
    // G
    NAContactItemModel *gItem = [NAContactItemModel itemWithTitle:@"H扫一扫" image:nil];
    NSMutableArray *sectionG = [@[gItem, gItem] mutableCopy];
    safeArrayAddObject(self.contactSections, @{@(kNAContactG): sectionG});
    
    // H
    NAContactItemModel *hItem = [NAContactItemModel itemWithTitle:@"扫一扫" image:nil];
    NSMutableArray *sectionH = [@[hItem, hItem] mutableCopy];
    safeArrayAddObject(self.contactSections, @{@(kNAContactH): sectionH});
    
    // I
    NAContactItemModel *iItem = [NAContactItemModel itemWithTitle:@"I扫一扫" image:nil];
    NSMutableArray *sectionI = [@[iItem, iItem] mutableCopy];
    safeArrayAddObject(self.contactSections, @{@(kNAContactI): sectionI});
    
    // J
    NAContactItemModel *jItem = [NAContactItemModel itemWithTitle:@"J扫一扫" image:nil];
    NSMutableArray *sectionJ = [@[jItem, jItem] mutableCopy];
    safeArrayAddObject(self.contactSections, @{@(kNAContactJ): sectionJ});
    
    // K
    NAContactItemModel *kItem = [NAContactItemModel itemWithTitle:@"K扫一扫" image:nil];
    NSMutableArray *sectionK = [@[kItem, kItem] mutableCopy];
    safeArrayAddObject(self.contactSections, @{@(kNAContactK): sectionK});
    
    // L
    NAContactItemModel *lItem = [NAContactItemModel itemWithTitle:@"L扫一扫" image:nil];
    NSMutableArray *sectionL = [@[lItem, lItem] mutableCopy];
    safeArrayAddObject(self.contactSections, @{@(kNAContactL): sectionL});
    
    // M
    NAContactItemModel *mItem = [NAContactItemModel itemWithTitle:@"M扫一扫" image:nil];
    NSMutableArray *sectionM = [@[mItem, mItem] mutableCopy];
    safeArrayAddObject(self.contactSections, @{@(kNAContactM): sectionM});
    
    // n
    NAContactItemModel *nItem = [NAContactItemModel itemWithTitle:@"N扫一扫" image:nil];
    NSMutableArray *sectionN = [@[nItem, nItem] mutableCopy];
    safeArrayAddObject(self.contactSections, @{@(kNAContactN): sectionN});
    
    // O
    NAContactItemModel *oItem = [NAContactItemModel itemWithTitle:@"O扫一扫" image:nil];
    NSMutableArray *sectionO = [@[oItem, oItem] mutableCopy];
    safeArrayAddObject(self.contactSections, @{@(kNAContactO): sectionO});
    
    // P
    NAContactItemModel *pItem = [NAContactItemModel itemWithTitle:@"P扫一扫" image:nil];
    NSMutableArray *sectionP = [@[pItem, pItem] mutableCopy];
    safeArrayAddObject(self.contactSections, @{@(kNAContactP): sectionP});
    
    // Q
    NAContactItemModel *qItem = [NAContactItemModel itemWithTitle:@"Q扫一扫" image:nil];
    NSMutableArray *sectionQ = [@[qItem, qItem] mutableCopy];
    safeArrayAddObject(self.contactSections, @{@(kNAContactQ): sectionQ});
    
    // R
    NAContactItemModel *rItem = [NAContactItemModel itemWithTitle:@"R扫一扫" image:nil];
    NSMutableArray *sectionR = [@[rItem, rItem] mutableCopy];
    safeArrayAddObject(self.contactSections, @{@(kNAContactR): sectionR});
    
    // S
    NAContactItemModel *sItem = [NAContactItemModel itemWithTitle:@"S扫一扫" image:nil];
    NSMutableArray *sectionS = [@[sItem, sItem] mutableCopy];
    safeArrayAddObject(self.contactSections, @{@(kNAContactS): sectionS});
    
    // T
    NAContactItemModel *tItem = [NAContactItemModel itemWithTitle:@"T" image:nil];
    NSMutableArray *sectionT = [@[tItem, tItem] mutableCopy];
    safeArrayAddObject(self.contactSections, @{@(kNAContactT): sectionT});
    
    // U
    NAContactItemModel *uItem = [NAContactItemModel itemWithTitle:@"U" image:nil];
    NSMutableArray *sectionU = [@[uItem, uItem] mutableCopy];
    safeArrayAddObject(self.contactSections, @{@(kNAContactU): sectionU});
    
    // V
    NAContactItemModel *vItem = [NAContactItemModel itemWithTitle:@"V" image:nil];
    NSMutableArray *sectionV = [@[vItem, vItem] mutableCopy];
    safeArrayAddObject(self.contactSections, @{@(kNAContactV): sectionV});
}

- (NSString *)navigationTitle {
    return @"通讯录";
}


#pragma mark - UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.contactSections count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSDictionary *itemDict = safeObjectFromArray(self.contactSections, section);
    NSArray *items = [[itemDict allValues] firstObject];
    return [items count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    __block NSMutableArray *indexs = [NSMutableArray array];
    [self.contactSections enumerateObjectsUsingBlock:^(NSMutableDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        safeArrayAddObjects(indexs, [obj allKeys]);
    }];
    
    NSMutableArray<NSString *> *indexTitles = [NSMutableArray array];
    [indexs enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        safeArrayAddObject(indexTitles, stringFromContactType(((NSNumber *)obj).unsignedIntegerValue));
    }];
    
    return indexTitles;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSDictionary *itemDict = safeObjectFromArray(self.contactSections, section);
    NSNumber *sectionType = [[itemDict allKeys] firstObject];
    return stringFromContactType(sectionType.unsignedIntegerValue);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NABaseContactCell *cell = nil;
    NSDictionary *itemDict = safeObjectFromArray(self.contactSections, indexPath.section);
    NAContactItemModel *itemModel = safeObjectFromArray([[itemDict allValues] firstObject], indexPath.row);
    if (itemModel) {
        cell = [tableView dequeueReusableCellWithIdentifier:kNABaseContactCellIdentifier];
        if (!cell) {
            cell = [self loadNibWithName:kNABaseContactCellIdentifier];
        }
        
        [cell updateWithModel:itemModel];
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

static inline NSString *stringFromContactType(NAContactSection type) {
    static NSDictionary *contactKinds = nil;
    contactKinds = @{
                     @(kNAContactCategory): @"",
                     @(kNAContactA): @"A",
                     @(kNAContactB): @"B",
                     @(kNAContactC): @"C",
                     @(kNAContactD): @"D",
                     @(kNAContactE): @"E",
                     @(kNAContactF): @"F",
                     @(kNAContactG): @"G",
                     @(kNAContactH): @"H",
                     @(kNAContactI): @"I",
                     @(kNAContactJ): @"J",
                     @(kNAContactK): @"K",
                     @(kNAContactL): @"L",
                     @(kNAContactM): @"M",
                     @(kNAContactN): @"N",
                     @(kNAContactO): @"O",
                     @(kNAContactP): @"P",
                     @(kNAContactQ): @"Q",
                     @(kNAContactR): @"R",
                     @(kNAContactS): @"S",
                     @(kNAContactT): @"T",
                     @(kNAContactU): @"U",
                     @(kNAContactV): @"V",
                     @(kNAContactW): @"W",
                     @(kNAContactX): @"X",
                     @(kNAContactY): @"Y",
                     @(kNAContactZ): @"Z",
                     @(kNAContactStar): @"*", // *
                     @(kNAContactWell): @"#", // #
                     };
    return [contactKinds objectForKey:@(type)];
}
