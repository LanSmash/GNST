
//  EndScene.m
//  Good Night, Sleep Tight
//
//  Created by carahewitt on 24/07/2014.
//  Copyright (c) 2014 cara hewitt. All rights reserved.
//

#import "MyScene.h"
#import "Scene1.h"
#import "Scene2.h"
#import "Scene3.h"
#import "EndScene.h"
#import "DrawingOrder.h"
#import <AVFoundation/AVFoundation.h>



@implementation EndScene {
    
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
        if (boundsWidth == 568) {_btnNightSky = [SKSpriteNode spriteNodeWithImageNamed:@"sendnightsky568"]; }
        else {_btnNightSky = [SKSpriteNode spriteNodeWithImageNamed:@"sendnightsky"]; }
        _btnNightSky.position = CGPointMake(size.width/2, (size.height/2));
        _btnNightSky.zPosition = DrawingOrderBackground;
        [self addChild:_btnNightSky];
        
        

        
        
        // add the moon
        _btnMoon = [SKSpriteNode spriteNodeWithImageNamed:@"moon"];
        _btnMoon.position = CGPointMake(800,630);
        if (boundsWidth == 480) {_btnMoon.position = CGPointMake(380, 250); }
        if (boundsWidth == 568) {_btnMoon.position = CGPointMake(450, 230); }
        _btnMoon.zPosition = DrawingOrderOtherSprites;
        [self addChild:_btnMoon];
        

        
        // add the start button
        _btnBegin = [SKSpriteNode spriteNodeWithImageNamed:@"backtothestart"];
        _btnBegin.position = CGPointMake(size.width/2, 250);
        if (boundsWidth == 480) {_btnBegin.position = CGPointMake(250, 110); }
        if (boundsWidth == 568) {_btnBegin.position = CGPointMake(280, 110); }
        _btnBegin.zPosition = DrawingOrderOtherSprites;
        [self addChild:_btnBegin];
        
        
        // add the non-interactive foreground image asset
        SKSpriteNode *foreground = [SKSpriteNode spriteNodeWithImageNamed:@"theend"];
        foreground.position = CGPointMake(size.width/2, size.height/2);
        if (boundsWidth == 480) {foreground.position = CGPointMake(250, 170); }
        if (boundsWidth == 568) {foreground.position = CGPointMake(280, 200); }
        foreground.zPosition = DrawingOrderForeground;
        [self addChild:foreground];
        
        
        // sounds using the AVAudioPlayer so they can't be spammed
        NSURL *moonURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"ukulele" ofType:@"wav"]];
        _moonSound = [[AVAudioPlayer alloc] initWithContentsOfURL:moonURL error:nil];
        
        
    }
    return self;
}






- (void)moonTouch
{
    [_moonSound play];
    
    // get reference to the atlas
    SKTextureAtlas *Atlas = [SKTextureAtlas atlasNamed:@"moon"];
    // create an array to hold image textures
    NSMutableArray *Textures = [NSMutableArray array];
    
    // load the animation frames from the TextureAtlas
    int numImages = (int)Atlas.textureNames.count;
    for (int i=1; i <= numImages; i++) {
        NSString *textureName = [NSString stringWithFormat:@"moon%i", i];
        SKTexture *SequenceTexture = [Atlas textureNamed:textureName];
        [Textures addObject:SequenceTexture];
        NSLog(@"%@",Textures); //show which image assets are being used.
    }
    SKAction *repeatAnimation = [SKAction animateWithTextures:Textures timePerFrame:0.15];
    SKAction *keepRepeatingAnimation = [SKAction repeatAction:repeatAnimation count:6];
    [_btnMoon runAction:keepRepeatingAnimation];
    
}










- (void)changeToNextScene
{
    SKAction *playSFX = [SKAction playSoundFileNamed:@"click.wav" waitForCompletion:NO];
    [self runAction:playSFX];
    MyScene *secondScene = [MyScene sceneWithSize:self.size];
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
        
        else if([_btnMoon containsPoint:location]) {
            NSLog(@"moon touch");
            [self moonTouch];
        }
        else {
            if([_btnNightSky containsPoint:location])
            {
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
    
}






-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
