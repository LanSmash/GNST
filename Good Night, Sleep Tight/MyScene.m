
//  MyScene.m
//  Good Night, Sleep Tight
//
//  Created by carahewitt on 8/07/2014.
//  Copyright (c) 2014 cara hewitt. All rights reserved.
//

#import "MyScene.h"
#import "Scene1.h"
#import "Scene2.h"
#import "Scene3.h"
#import "Scene4.h"
#import "EndScene.h"
#import "DrawingOrder.h"
#import <AVFoundation/AVFoundation.h>



@implementation MyScene {
    
    SKSpriteNode *_btnBegin;
    SKSpriteNode *_btnMoon;
    SKSpriteNode *_btnNightSky;
    AVAudioPlayer *_moonSound;

}





-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        //give dimension output in console
        float boundsWidth = [UIScreen mainScreen].bounds.size.width;
        float boundsHeight = [UIScreen mainScreen].bounds.size.height;
        float scalefactor = [UIScreen mainScreen].scale;
        NSLog(@"bounds width: %f, bounds height: %f", boundsWidth, boundsHeight);
        NSLog(@"In initWithSize at %.0f wide and %.0f high", size.width, size.height);
        NSLog(@"scale is: %f", scalefactor);
        
        
        // add the night sky background
        _btnNightSky = [SKSpriteNode spriteNodeWithImageNamed:@"s0nightsky"];
        _btnNightSky.position = CGPointMake(size.width/2, (size.height/2));
        _btnNightSky.zPosition = DrawingOrderBackground;
        [self addChild:_btnNightSky];
        
        
      
        // add the start button
        _btnBegin = [SKSpriteNode spriteNodeWithImageNamed:@"letsbeginbutton"];
        _btnBegin.position = CGPointMake(size.width/2, 250.0f);
        _btnBegin.zPosition = DrawingOrderOtherSprites;
        [self addChild:_btnBegin];
        
        
        // sounds using the AVAudioPlayer so they can't be spammed
        NSURL *moonURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"ukulele" ofType:@"wav"]];
        _moonSound = [[AVAudioPlayer alloc] initWithContentsOfURL:moonURL error:nil];
        
        
    }
    return self;
}















- (void)changeToNextScene
{
    SKAction *playSFX = [SKAction playSoundFileNamed:@"click.wav" waitForCompletion:NO];
    [self runAction:playSFX];
    Scene1 *secondScene = [Scene1 sceneWithSize:self.size];
    [self.view presentScene:secondScene transition:[SKTransition fadeWithDuration:0.5]];
}




-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    
    for (UITouch *touch in touches){
        CGPoint location = [touch locationInNode:self];
        
        
        
        if([_btnBegin containsPoint:location]) {
            NSLog(@"button touch");
            [self changeToNextScene];
        }
        

      
        
    }
    
}






-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
