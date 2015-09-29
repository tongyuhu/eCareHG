/*
 * Copyright (c) 2009 Keith Lazuka
 * License: http://www.opensource.org/licenses/mit-license.html
 */

#import "KalView.h"
#import "KalGridView.h"
#import "KalLogic.h"
#import "KalPrivate.h"

@interface KalView ()

- (void)addSubviewsToHeaderView:(UIView *)headerView;
- (void)addSubviewsToContentView:(UIView *)contentView;
- (void)setHeaderTitleText:(NSString *)text;

@end

static const CGFloat kHeaderHeight = 50.f;
static const CGFloat kMonthLabelHeight = 17.f;

@implementation KalView
- (void)initScrollView
{
    self.myScrollView =[[UIScrollView alloc]init];
    self.myScrollView.frame =CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    self.myScrollView.backgroundColor =[UIColor clearColor];
    self.myScrollView.showsHorizontalScrollIndicator =NO;
    self.myScrollView.showsVerticalScrollIndicator =NO;
    self.myScrollView.delegate = self;
    self.myScrollView.contentSize = CGSizeMake(ScreenWidth, 568);
    [self addSubview:self.myScrollView];
    
}

- (id)initWithFrame:(CGRect)frame delegate:(id<KalViewDelegate>)theDelegate logic:(KalLogic *)theLogic
{
    if ((self = [super initWithFrame:frame])) {
        self.delegate = theDelegate;
        logic = theLogic;
        [logic addObserver:self forKeyPath:@"selectedMonthNameAndYear" options:NSKeyValueObservingOptionNew context:NULL];
        self.autoresizesSubviews = YES;
        self.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        self.backgroundColor = RGBCOLOR(246, 246, 246);
        [self initScrollView];
        
       UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0.f, 64, frame.size.width, kHeaderHeight)];
       headerView.backgroundColor =[UIColor whiteColor];
       [self addSubviewsToHeaderView:headerView];
        [self.myScrollView addSubview:headerView];
        
        self.contentView = [[UIView alloc] initWithFrame:CGRectMake(0.f, kHeaderHeight+64, ScreenWidth, ScreenHeight - kHeaderHeight -64)];
//        contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        [self addSubviewsToContentView:self.contentView];
        [self.myScrollView addSubview:self.contentView];
        
//        [self initCustomView];
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    [NSException raise:@"Incomplete initializer" format:@"KalView must be initialized with a delegate and a KalLogic. Use the initWithFrame:delegate:logic: method."];
    return nil;
}

- (void)redrawEntireMonth { [self jumpToSelectedMonth]; }

- (void)slideDown { [self.gridView slideDown]; }
- (void)slideUp { [self.gridView slideUp]; }

- (void)showPreviousMonth
{
    if (!self.gridView.transitioning)
        [self.delegate showPreviousMonth];
}

//- (void)showFollowingMonth
//{
//    if (!self.gridView.transitioning)
//        [self.delegate showFollowingMonth];
//}

- (void)addSubviewsToHeaderView:(UIView *)headerView
{
//    const CGFloat kChangeMonthButtonWidth = 46.0f;
//    const CGFloat kChangeMonthButtonHeight = 30.0f;
    const CGFloat kMonthLabelWidth = 200.0f;
    const CGFloat kHeaderVerticalAdjust = 10.f;
    
    // Create the previous month button on the left side of the view
//    CGRect previousMonthButtonFrame = CGRectMake(self.left,
//                                                 kHeaderVerticalAdjust,
//                                                 kChangeMonthButtonWidth,
//                                                 kChangeMonthButtonHeight);
//    UIButton *previousMonthButton = [[UIButton alloc] initWithFrame:previousMonthButtonFrame];
//    [previousMonthButton setAccessibilityLabel:NSLocalizedString(@"Previous month", nil)];
//    [previousMonthButton setImage:[UIImage imageNamed:@"Kal.bundle/kal_left_arrow.png"] forState:UIControlStateNormal];
//    previousMonthButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
//    previousMonthButton.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
//    [previousMonthButton addTarget:self action:@selector(showPreviousMonth) forControlEvents:UIControlEventTouchUpInside];
//    [headerView addSubview:previousMonthButton];
    
    // Draw the selected month name centered and at the top of the view
    CGRect monthLabelFrame = CGRectMake((self.width/2.0f) - (kMonthLabelWidth/2.0f),
                                        kHeaderVerticalAdjust,
                                        kMonthLabelWidth,
                                        kMonthLabelHeight);
    headerTitleLabel = [[UILabel alloc] initWithFrame:monthLabelFrame];
    headerTitleLabel.backgroundColor = [UIColor clearColor];
    headerTitleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:16];
    headerTitleLabel.textAlignment = NSTextAlignmentCenter;
    headerTitleLabel.textColor = PURPLE;
    [self setHeaderTitleText:[logic selectedMonthNameAndYear]];
    [headerView addSubview:headerTitleLabel];
    
    // Create the next month button on the right side of the view
//    CGRect nextMonthButtonFrame = CGRectMake(self.width - kChangeMonthButtonWidth,
//                                             kHeaderVerticalAdjust,
//                                             kChangeMonthButtonWidth,
//                                             kChangeMonthButtonHeight);
//    UIButton *nextMonthButton = [[UIButton alloc] initWithFrame:nextMonthButtonFrame];
//    [nextMonthButton setAccessibilityLabel:NSLocalizedString(@"Next month", nil)];
//    [nextMonthButton setImage:[UIImage imageNamed:@"Kal.bundle/kal_right_arrow.png"] forState:UIControlStateNormal];
//    nextMonthButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
//    nextMonthButton.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
//    [nextMonthButton addTarget:self action:@selector(showFollowingMonth) forControlEvents:UIControlEventTouchUpInside];
//    [headerView addSubview:nextMonthButton];
    
    // Add column labels for each weekday (adjusting based on the current locale's first weekday)
    NSDateFormatter *dateform =[[NSDateFormatter alloc]init];
    [dateform setWeekdaySymbols:@[@"周日",@"周一",@"周二",@"周三",@"周四",@"周五",@"周六",]];
    NSArray *weekdayNames = [dateform weekdaySymbols];
    NSArray *fullWeekdayNames = [[[NSDateFormatter alloc] init] standaloneWeekdaySymbols];
    NSUInteger firstWeekday = [[NSCalendar currentCalendar] firstWeekday];
    NSUInteger i = firstWeekday - 1;
    for (CGFloat xOffset = 0.f; xOffset < headerView.width; xOffset += 46.f, i = (i+1)%7) {
        CGRect weekdayFrame = CGRectMake(xOffset, 33.f, 46.f, kHeaderHeight - 33.f);
        UILabel *weekdayLabel = [[UILabel alloc] initWithFrame:weekdayFrame];
        weekdayLabel.backgroundColor =SPLINELIGHTGRAY;
        weekdayLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:11];
        weekdayLabel.textAlignment = NSTextAlignmentCenter;
        weekdayLabel.textColor = kGrayColor;
        weekdayLabel.text = [weekdayNames objectAtIndex:i];
        [weekdayLabel setAccessibilityLabel:[fullWeekdayNames objectAtIndex:i]];
        [headerView addSubview:weekdayLabel];
    }
}

- (void)addSubviewsToContentView:(UIView *)contentView
{
    // Both the tile grid and the list of events will automatically lay themselves
    // out to fit the # of weeks in the currently displayed month.
    // So the only part of the frame that we need to specify is the width.
//    CGRect fullWidthAutomaticLayoutFrame = CGRectMake(0.f,0, self.width, 0.f);
    
    // The tile grid (the calendar body)
    self.gridView = [[KalGridView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth,264) logic:logic delegate:self.delegate];
//    [self.gridView addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionNew context:NULL];
    [contentView addSubview:self.gridView];
    
    // The list of events for the selected day
//    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 150) style:UITableViewStylePlain];
////    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
////    self.tableView.separatorStyle =UITableViewCellSeparatorStyleNone;
//    self.tableView.rowHeight =35;
//    [contentView addSubview:self.tableView];
//    [self.gridView sizeToFit];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (object == self.gridView && [keyPath isEqualToString:@"frame"]) {
        
        /* Animate tableView filling the remaining space after the
         * gridView expanded or contracted to fit the # of weeks
         * for the month that is being displayed.
         *
         * This observer method will be called when gridView's height
         * changes, which we know to occur inside a Core Animation
         * transaction. Hence, when I set the "frame" property on
         * tableView here, I do not need to wrap it in a
         * [UIView beginAnimations:context:].
         */
        CGFloat gridBottom = self.gridView.top + self.gridView.height;
        CGRect frame = self.tableView.frame;
        frame.origin.y = gridBottom;
        frame.size.height = self.tableView.superview.height - gridBottom;
        self.tableView.frame = frame;
        
    } else if ([keyPath isEqualToString:@"selectedMonthNameAndYear"]) {
        [self setHeaderTitleText:[change objectForKey:NSKeyValueChangeNewKey]];
        
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

- (void)setHeaderTitleText:(NSString *)text
{
    [headerTitleLabel setText:text];
    [headerTitleLabel sizeToFit];
    headerTitleLabel.left = floorf(self.width/2.f - headerTitleLabel.width/2.f);
}

- (void)jumpToSelectedMonth { [self.gridView jumpToSelectedMonth]; }

- (BOOL)isSliding { return self.gridView.transitioning; }

- (void)markTilesForDates:(NSArray *)dates { [self.gridView markTilesForDates:dates]; }

- (void)dealloc
{
    [logic removeObserver:self forKeyPath:@"selectedMonthNameAndYear"];
    
    [self.gridView removeObserver:self forKeyPath:@"frame"];
}
- (void)awakeFromNib
{
    [[NSBundle mainBundle] loadNibNamed:@"ServiceTimeCustomView" owner:self options:nil];
    self.tmpCustomView.frame =CGRectMake(0, ScreenHeight -200, ScreenWidth, 200);
 
    [self.myScrollView addSubview:self.tmpCustomView];
}

- (void)initCustomView{
//    NSArray *nib = [[NSBundle mainBundle]loadNibNamed:@"ServiceTimeCustomView" owner:self options:nil];
//    //得到第一个UIView
//     UIView *  tmpCustomView = [nib objectAtIndex:0];
////    //获得屏幕的Frame
//     tmpCustomView.frame =CGRectMake(0, ScreenHeight -200, ScreenWidth, 200);
//    //添加视图
//    [self addSubview:tmpCustomView];
////    UIView *tmpCustomView =[[UIView alloc]init];
////    tmpCustomView.backgroundColor =[UIColor greenColor];
////     tmpCustomView.frame =CGRectMake(0, ScreenHeight -200, ScreenWidth, 200);
////    [self.myScrollView addSubview:tmpCustomView];
//    
    
//    [[NSBundle mainBundle] loadNibNamed:@"ServiceTimeCustomView" owner:self options:nil];
    self.tmpCustomView =[[UIView alloc]init];
    self.tmpCustomView.frame =CGRectMake(0, ScreenHeight -200, ScreenWidth, 200);
    self.tmpCustomView.backgroundColor =[UIColor redColor];
    [self.myScrollView addSubview:self.tmpCustomView];

}

@end
