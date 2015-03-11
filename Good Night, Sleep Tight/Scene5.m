
//  Scene5.m
//  Good Night, Sleep Tight
//
//  Created by carahewitt on 06/03/2015.
//  Copyright (c) 2015 cara hewitt. All rights reserved.
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



@implementation Scene5 {
    
    SKSpriteNode *_btnHome;
    SKSpriteNode *_btnNightSky;
    AVAudioPlayer *_testCoralSound;
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
        _btnNightSky = [SKSpriteNode spriteNodeWithImageNamed:@"s5nightsky"];
        _btnNightSky.position = CGPointMake(size.width/2, (size.height/2));
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        _btnNightSky.position = CGPointMake(size.width/2, (size.height/2)); }
        _btnNightSky.zPosition = DrawingOrderBackground;
        [self addChild:_btnNightSky];
        
        
        // add home button
        _btnHome = [SKSpriteNode spriteNodeWithImageNamed:@"homebutton"];
        _btnHome.position = CGPointMake(930.0f,740.0f);
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        _btnHome.position = CGPointMake(370, (320)); }
        _btnHome.zPosition = DrawingOrderOtherSprites;
        [self addChild:_btnHome];
        
        
      
        NSURL *coralURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"coralglow" ofType:@"wav"]];
        _testCoralSound = [[AVAudioPlayer alloc] initWithContentsOfURL:coralURL error:nil];
        
        
    }
    return self;
}










- (void)changeToHome
{
    SKAction *playSFX = [SKAction playSoundFileNamed:@"click.wav" waitForCompletion:NO];
    [self runAction:playSFX];
    MyScene *nextScene = [MyScene sceneWithSize:self.size];
    [self.view presentScene:nextScene transition:[SKTransition fadeWithDuration:0.5]];
}




- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        
        
        if([_btnHome containsPoint:location]) {
            NSLog(@"home touch");
            [self changeToHome];
        }
        
        
        else if([_btnNightSky containsPoint:location]) {
            
            NSLog(@"sky touch");
            SKSpriteNode *nightstar = [SKSpriteNode spriteNodeWithImageNamed:@"star"];
            nightstar.position = location;
            nightstar.zPosition = DrawingOrderStars;
            [self addChild:nightstar];
            SKAction *playSFX = [SKAction playSoundFileNamed:@"ting.wav" waitForCompletion:NO];
            [self runAction:playSFX];
            
        }
        
        
        
        
    }
}


















-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
