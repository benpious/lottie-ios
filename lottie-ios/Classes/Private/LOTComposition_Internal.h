//
//  LOTAnimationView_Internal.h
//  Lottie
//
//  Created by Brandon Withrow on 12/7/16.
//  Copyright © 2016 Brandon Withrow. All rights reserved.
//

#import "LOTComposition.h"

NS_ASSUME_NONNULL_BEGIN

@class LOTLayer;

@interface LOTComposition ()

@property (nonatomic, readonly) CGRect compBounds;
@property (nonatomic, readonly) NSNumber *startFrame;
@property (nonatomic, readonly) NSNumber *endFrame;
@property (nonatomic, readonly) NSNumber *framerate;
@property (nonatomic, readonly) NSTimeInterval timeDuration;
@property (nonatomic, readonly) LOTLayerGroup *layerGroup;
@property (nonatomic, readonly) LOTAssetGroup *assetGroup;

@end

NS_ASSUME_NONNULL_END
