//
//  HomeTopCell.m
//  匠人
//
//  Created by BK on 15/11/1.
//  Copyright © 2015年 bk. All rights reserved.
//

#import "HomeTopCell.h"
#import "ItemView.h"

@interface ItemView()

@end

@implementation HomeTopCell

- (void)awakeFromNib {
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        for (NSInteger i = 0 ; i<3; i++) {
            ItemView *itemView = [[ItemView alloc] init];
            itemView.tag = 100+i;
            [self.contentView addSubview:itemView];
        }
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat viewW = (self.contentView.frame.size.width-160)/3.0;
    CGFloat viewH = viewW+20;
    for (NSInteger i = 0 ; i<3; i++) {
        ItemView *view = (ItemView *)[self.contentView viewWithTag:100+i];
        view.frame = CGRectMake(40+(viewW+40)*i, 10, viewW, viewH);
    }
}

- (void)setContentArray:(NSArray *)contentArray {
    _contentArray = contentArray;
    NSArray *iconArray = @[@"recommend_roll1",@"recommend_roll2",@"recommend_roll3"];
    for (NSInteger i = 0; i<iconArray.count; i++) {
        ItemView *view = (ItemView *)[self.contentView viewWithTag:100+i];
        view.block = ^(NSInteger tag){
            if (_block) {
                _block(tag);
            }
        };
       ContentModel *model = contentArray[i];
        view.label.text = model.name;
        [view.btn setBackgroundImage:[UIImage imageNamed:iconArray[i]] forState:UIControlStateNormal];
        
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
