//
//  Loader1.h
//  Weathter Forecast
//
//  Created by XuChenFei on 2020/12/16.
//

#import <Foundation/Foundation.h>
#import "ListModel2.h"
#import "ListModel3.h"
#import "ListModel4.h"
#import "ListModel5.h"

@class ListModel1;

NS_ASSUME_NONNULL_BEGIN

@interface Loader1 : NSObject

typedef void(^blockName)(ListModel1 *listMode1);
typedef void(^blockName2)(ListModel2 *listMode2);
typedef void(^blockName3)(NSArray<ListModel3 *>*dataArray);
typedef void(^blockName4)(ListModel2 *listMode4);
typedef void(^blockName5)(NSArray<ListModel5 *>*dataArray);


@property(nonatomic,copy)blockName block1;
@property(nonatomic,copy)blockName2 block2;
@property(nonatomic,copy)blockName3 block3;
@property(nonatomic,copy)blockName4 block4;
@property(nonatomic,copy)blockName5 block5;

@property(nonatomic,strong,readwrite)ListModel1 *mode1;
@property(nonatomic,strong,readwrite)ListModel2 *mode2;
@property(nonatomic,strong,readwrite)ListModel3 *mode3;
@property(nonatomic,strong,readwrite)ListModel4 *mode4;
@property(nonatomic,strong,readwrite)ListModel5 *mode5;
- (void)loadListData;
- (void)loadListData2;
- (void)loadListData3;
- (void)loadListData4;
- (void)loadListData5;




@end

NS_ASSUME_NONNULL_END
