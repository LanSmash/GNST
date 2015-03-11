
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
#import "Scene5.h"
#import "EndScene.h"
#import "DrawingOrder.h"
#import <AVFoundation/AVFoundation.h>



@implementation MyScene {
    

    SKSpriteNode *_btnScene1;
    SKSpriteNode *_btnScene2;
    SKSpriteNode *_btnScene3;
    SKSpriteNode *_btnScene4;
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
        if (boundsWidth == 568) {_btnNightSky = [SKSpriteNode spriteNodeWithImageNamed:@"s0nightsky568"]; }
        else {
        _btnNightSky = [SKSpriteNode spriteNodeWithImageNamed:@"s0nightsky"];
        }
        _btnNightSky.position = CGPointMake(size.width/2, (size.height/2));
        _btnNightSky.zPosition = DrawingOrderBackground;
        [self addChild:_btnNightSky];
        
        

        

      
        // add scene buttons
        _btnScene1 = [SKSpriteNode spriteNodeWithImageNamed:@"s0characters-s1"];
        _btnScene1.position = CGPointMake(140, 150);
        if (boundsWidth == 480) {_btnScene1.position = CGPointMake(60, 70); }
        if (boundsWidth == 568) {_btnScene1.position = CGPointMake(105, 70); }
        _btnScene1.zPosition = DrawingOrderOtherSprites;
        [self addChild:_btnScene1];
        
        
        _btnScene2 = [SKSpriteNode spriteNodeWithImageNamed:@"s0characters-s2"];
        _btnScene2.position = CGPointMake(390, 150);
        if (boundsWidth == 480) {_btnScene2.position = CGPointMake(180, 70); }
        if (boundsWidth == 568) {_btnScene2.position = CGPointMake(225, 70); }
        _btnScene2.zPosition = DrawingOrderOtherSprites;
        [self addChild:_btnScene2];
        
        
        _btnScene3 = [SKSpriteNode spriteNodeWithImageNamed:@"s0characters-s3"];
        _btnScene3.position = CGPointMake(640, 150);
        if (boundsWidth == 480) {_btnScene3.position = CGPointMake(300, 70); }
        if (boundsWidth == 568) {_btnScene3.position = CGPointMake(345, 70); }
        _btnScene3.zPosition = DrawingOrderOtherSprites;
        [self addChild:_btnScene3];
        
        
        _btnScene4 = [SKSpriteNode spriteNodeWithImageNamed:@"s0characters-s4"];
        _btnScene4.position = CGPointMake(890, 150);
        if (boundsWidth == 480) {_btnScene4.position = CGPointMake(420, 70); }
        if (boundsWidth == 568) {_btnScene4.position = CGPointMake(465, 70); }
        _btnScene4.zPosition = DrawingOrderOtherSprites;
        [self addChild:_btnScene4];
        
        
        // sounds using the AVAudioPlayer so they can't be spammed
        NSURL *moonURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"ukulele" ofType:@"wav"]];
        _moonSound = [[AVAudioPlayer alloc] initWithContentsOfURL:moonURL error:nil];

        
        //add "good night, monkey" text
        SKSpriteNode *goodnightIntro = [SKSpriteNode spriteNodeWithImageNamed:@"gnst"];
        goodnightIntro.position = CGPointMake(495, 680);
        if (boundsWidth == 480) {goodnightIntro.position = CGPointMake(240, 280); }
        if (boundsWidth == 568) {goodnightIntro.position = CGPointMake(285, 280); }
        goodnightIntro.zPosition = DrawingOrderOtherSprites;
        goodnightIntro.alpha = 0.0;
        SKAction *fadeIn = [SKAction fadeAlphaTo:1.0 duration:2.0];
        [self addChild:goodnightIntro];
        [goodnightIntro runAction:fadeIn];
        
    }
    return self;
}















- (void)changeToScene1
{
    SKAction *playSFX = [SKAction playSoundFileNamed:@"click.wav" waitForCompletion:NO];
    [self runAction:playSFX];
    Scene1 *secondScene = [Scene1 sceneWithSize:self.size];
    [self.view presentScene:secondScene transition:[SKTransition fadeWithDuration:0.5]];
}

- (void)changeToScene2
{
    SKAction *playSFX = [SKAction playSoundFileNamed:@"click.wav" waitForCompletion:NO];
    [self runAction:playSFX];
    Scene2 *secondScene = [Scene2 sceneWithSize:self.size];
    [self.view presentScene:secondScene transition:[SKTransition fadeWithDuration:0.5]];
}


- (void)changeToScene3
{
    SKAction *playSFX = [SKAction playSoundFileNamed:@"click.wav" waitForCompletion:NO];
    [self runAction:playSFX];
    Scene3 *secondScene = [Scene3 sceneWithSize:self.size];
    [self.view presentScene:secondScene transition:[SKTransition fadeWithDuration:0.5]];
}


- (void)changeToScene4
{
    SKAction *playSFX = [SKAction playSoundFileNamed:@"click.wav" waitForCompletion:NO];
    [self runAction:playSFX];
    Scene4 *secondScene = [Scene4 sceneWithSize:self.size];
    [self.view presentScene:secondScene transition:[SKTransition fadeWithDuration:0.5]];
}





-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    
    for (UITouch *touch in touches){
        CGPoint location = [touch locationInNode:self];
        
        
        
        if([_btnScene1 containsPoint:location]) {
            NSLog(@"button touch");
            [self changeToScene1];
        }
        else if([_btnScene2 containsPoint:location]) {
            NSLog(@"button touch");
            [self changeToScene2];
        }
        else if([_btnScene3 containsPoint:location]) {
            NSLog(@"button touch");
            [self changeToScene3];
        }
        else if([_btnScene4 containsPoint:location]) {
            NSLog(@"button touch");
            [self changeToScene4];
        }
        

      
        
    }
    
}






-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
