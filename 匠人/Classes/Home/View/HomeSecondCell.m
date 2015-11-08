//
//  HomeSecondCell.m
//  匠人
//
//  Created by BK on 15/11/2.
//  Copyright © 2015年 bk. All rights reserved.
//

#import "HomeSecondCell.h"
#import "SecondSubCell.h"
@interface HomeSecondCell()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>
{
    UILabel *_titleLabel;
    UILabel *_descLabel;
    UICollectionView *_collectionView;
}
@end

@implementation HomeSecondCell

- (void)awakeFromNib {
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UILabel *title = [[UILabel alloc] init];
        title.textColor = [UIColor blackColor];
        title.font = [UIFont systemFontOfSize:17];
        [self.contentView addSubview:title];
        _titleLabel = title;
        
        UILabel *desc = [[UILabel alloc] init];
        desc.textColor = [UIColor grayColor];
        desc.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:desc];
        _descLabel = desc;
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        flowLayout.minimumLineSpacing = 10;
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) collectionViewLayout:flowLayout];
        collectionView.backgroundColor = [UIColor whiteColor];
        collectionView.delegate = self;
        collectionView.dataSource = self;
        collectionView.bounces = NO;
        collectionView.showsVerticalScrollIndicator = NO;
        [collectionView registerNib:[UINib nibWithNibName:@"SecondSubCell" bundle:nil] forCellWithReuseIdentifier:@"SecondSubCell"];
        [self.contentView addSubview:collectionView];
        _collectionView = collectionView;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _titleLabel.frame = CGRectMake(10, 10, self.contentView.frame.size.width-20, 20);
    CGFloat descLabelY = CGRectGetMaxY(_titleLabel.frame);
    _descLabel.frame = CGRectMake(10, descLabelY, self.contentView.frame.size.width-20, 20);
    CGFloat collectionViewY = CGRectGetMaxY(_descLabel.frame);
    _collectionView.frame = CGRectMake(0, collectionViewY, self.contentView.frame.size.width, self.frame.size.height-50);
}

- (void)setModel:(ListModel *)model {
    _model = model;
    _titleLabel.text = model.title;
    _descLabel.text = model.subtitle;
}
- (void)setContentArray:(NSArray *)contentArray {
    _contentArray = contentArray;
    [_collectionView reloadData];
}
#pragma mark - collectionView代理和数据源
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat itemW = (self.contentView.frame.size.width-50)/3.0;
    CGFloat itemH = itemW+20;
    return CGSizeMake(itemW, itemH);
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _contentArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SecondSubCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SecondSubCell" forIndexPath:indexPath];
    cell.model = _contentArray[indexPath.row];
    return cell;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10, 10, 0, 10);
}

#pragma mark - cell点击
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    ContentModel *model = _contentArray[indexPath.row];
    
    if (_block) {
        _block(model.name,model._id,indexPath.row);
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
