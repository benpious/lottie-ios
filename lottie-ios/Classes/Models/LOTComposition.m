//
//  LOTScene.m
//  LottieAnimator
//
//  Created by Brandon Withrow on 12/14/15.
//  Copyright © 2015 Brandon Withrow. All rights reserved.
//

#import "LOTComposition.h"
#import "LOTComposition_Internal.h"
#import "LOTLayer.h"
#import "LOTAssetGroup.h"
#import "LOTLayerGroup.h"

@implementation LOTComposition {
    NSDictionary *_modelMap;
}

- (instancetype)initWithJSON:(NSDictionary *)jsonDictionary {
    self = [super init];
    if (self) {
        if (![self _mapFromJSON:jsonDictionary]) {
            self = nil;
        }
    }
    return self;
}

- (BOOL)_mapFromJSON:(NSDictionary *)jsonDictionary {
    @try {
        NSNumber *width = jsonDictionary[@"w"];
        NSNumber *height = jsonDictionary[@"h"];
        if (width && height) {
            CGRect bounds = CGRectMake(0, 0, width.floatValue, height.floatValue);
            _compBounds = bounds;
        }

        _startFrame = [jsonDictionary[@"ip"] copy];
        _endFrame = [jsonDictionary[@"op"] copy];
        _framerate = [jsonDictionary[@"fr"] copy];

        if (_startFrame && _endFrame && _framerate) {
            NSInteger frameDuration = _endFrame.integerValue - _startFrame.integerValue;
            NSTimeInterval timeDuration = frameDuration / _framerate.floatValue;
            _timeDuration = timeDuration;
        }

        NSArray *assetArray = jsonDictionary[@"assets"];
        if (assetArray.count) {
            _assetGroup = [[LOTAssetGroup alloc] initWithJSON:assetArray];
        }

        NSArray *layersJSON = jsonDictionary[@"layers"];
        if (layersJSON) {
            _layerGroup = [[LOTLayerGroup alloc] initWithLayerJSON:layersJSON
                                                        withBounds:_compBounds
                                                     withFramerate:_framerate
                                                    withAssetGroup:_assetGroup];
        }
        
        [_assetGroup finalizeInitialization];
        return true;
    } @catch (NSException *exception) {
        return false;
    }
}

@end
