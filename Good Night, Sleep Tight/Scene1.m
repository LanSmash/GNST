
//  Scene1.m
//  Good Night, Sleep Tight
//
//  Created by carahewitt on 23/07/2014.
//  Copyright (c) 2014 cara hewitt. All rights reserved.
//

#import "MyScene.h"
#import "Scene1.h"
#import "Scene2.h"
#import "Scene3.h"
#import "EndScene.h"
#import "DrawingOrder.h"
#import <AVFoundation/AVFoundation.h>



@implementation Scene1 {
    
    SKSpriteNode *_btnAnimal;
    SKSpriteNode *_btnNextScene;
    SKSpriteNode *_btnPrevScene;
    SKSpriteNode *_btnMoon;
    SKSpriteNode *_btnLeaves1;
    SKSpriteNode *_btnLeaves2;
    SKSpriteNode *_btnNightSky;
    AVAudioPlayer *_moonSound;
    AVAudioPlayer *_giggleSound;
    AVAudioPlayer *_yawnSound;
    BOOL _asleep;
}





-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
       
        
        // add the night sky background
        _btnNightSky = [SKSpriteNode spriteNodeWithImageNamed:@"s1nightsky"];
        _btnNightSky.position = CGPointMake(size.width/2, (size.height-220));
        _btnNightSky.zPosition = DrawingOrderBackground;
        [self addChild:_btnNightSky];
        
        // add the non-interactive foreground image asset
        SKSpriteNode *foreground = [SKSpriteNode spriteNodeWithImageNamed:@"s1foreground"];
        foreground.position = CGPointMake(size.width/2, size.height/2);
        foreground.zPosition = DrawingOrderForeground;
        [self addChild:foreground];
        
        // add the animal
        _btnAnimal = [SKSpriteNode spriteNodeWithImageNamed:@"monkey"];
        _btnAnimal.position = CGPointMake(250.0f,300.0f);
        _btnAnimal.zPosition = DrawingOrderOtherSprites;
        [self addChild:_btnAnimal];
        
        // add the moon
        _btnMoon = [SKSpriteNode spriteNodeWithImageNamed:@"moon"];
        _btnMoon.position = CGPointMake(800.0f,630.0f);
        _btnMoon.zPosition = DrawingOrderOtherSprites;
        [self addChild:_btnMoon];
        
        // add the first leaves
        _btnLeaves1 = [SKSpriteNode spriteNodeWithImageNamed:@"leaves1"];
        _btnLeaves1.position = CGPointMake(200.0f,630.0f);
        _btnLeaves1.zPosition = DrawingOrderOtherSprites;
        [self addChild:_btnLeaves1];
        
        // add the second leaves
        _btnLeaves2 = [SKSpriteNode spriteNodeWithImageNamed:@"leaves2"];
        _btnLeaves2.position = CGPointMake(880.0f,200.0f);
        _btnLeaves2.zPosition = DrawingOrderOtherSprites;
        [self addChild:_btnLeaves2];
        
        
        // add previous scene button
        _btnPrevScene = [SKSpriteNode spriteNodeWithImageNamed:@"previousscenetab"];
        _btnPrevScene.position = CGPointMake(35.0f,200.0f);
        _btnPrevScene.zPosition = DrawingOrderOtherSprites;
        [self addChild:_btnPrevScene];
        
        //add next scene button
        _btnNextScene = [SKSpriteNode spriteNodeWithImageNamed:@"nextscenetab"];
        _btnNextScene.position = CGPointMake(990.0f,200.0f);
        _btnNextScene.zPosition = DrawingOrderOtherSprites;
        [self addChild:_btnNextScene];
        
        
        // sounds using the AVAudioPlayer so they can't be spammed
        NSURL *moonURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"ukulele" ofType:@"wav"]];
        _moonSound = [[AVAudioPlayer alloc] initWithContentsOfURL:moonURL error:nil];
        NSURL *giggleURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"monkey" ofType:@"wav"]];
        _giggleSound = [[AVAudioPlayer alloc] initWithContentsOfURL:giggleURL error:nil];
        NSURL *yawnURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"yawntemp" ofType:@"mp3"]];
        _yawnSound = [[AVAudioPlayer alloc] initWithContentsOfURL:yawnURL error:nil];
        
        
    }
    return self;
}





- (void)tickleAnimal
{
    [_yawnSound stop];
    [_giggleSound play];
    
    
    SKTextureAtlas *Atlas = [SKTextureAtlas atlasNamed:@"gigglemonkey"];
    // create an array to hold image textures
    NSMutableArray *Textures = [NSMutableArray array];
    
    // load the animation frames from the TextureAtlas
    int numImages = (int)Atlas.textureNames.count;
    for (int i=1; i <= numImages; i++) {
        NSString *textureName = [NSString stringWithFormat:@"monkey%i", i];
        SKTexture *SequenceTexture = [Atlas textureNamed:textureName];
        [Textures addObject:SequenceTexture];
        //NSLog(@"%@",Atlas); //show which image assets are being used.
        NSLog(@"%@",Textures); //show which image assets are being used.
    }
    
    // repeat the animation a few times
    SKAction *repeatAnimation = [SKAction animateWithTextures:Textures timePerFrame:0.1];
    SKAction *keepRepeatingAnimation = [SKAction repeatAction:repeatAnimation count:2];
    [_btnAnimal runAction:keepRepeatingAnimation];
    
}


- (void)sleepAnimal
{
    [_yawnSound play];
    
    // get reference to the atlas
    SKTextureAtlas *Atlas = [SKTextureAtlas atlasNamed:@"sleepmonkey"];
    // create an array to hold image textures
    NSMutableArray *Textures = [NSMutableArray array];
    
    // load the animation frames from the TextureAtlas
    int numImages = (int)Atlas.textureNames.count;
    for (int i=1; i <= numImages; i++) {
        NSString *textureName = [NSString stringWithFormat:@"monkey%02i", i];
        SKTexture *SequenceTexture = [Atlas textureNamed:textureName];
        [Textures addObject:SequenceTexture];
        NSLog(@"%@",Textures); //show which image assets are being used.
    }
    SKAction *repeatAnimation = [SKAction animateWithTextures:Textures timePerFrame:0.15];
    SKAction *keepRepeatingAnimation = [SKAction repeatAction:repeatAnimation count:1];
    [_btnAnimal runAction:keepRepeatingAnimation];
    
    
    //add "good night, monkey" text
    SKSpriteNode *goodnightMonkey = [SKSpriteNode spriteNodeWithImageNamed:@"goodnightMonkeyText"];
    goodnightMonkey.position = CGPointMake(380.0f, 80.0f);
    goodnightMonkey.zPosition = DrawingOrderOtherSprites;
    goodnightMonkey.alpha = 0.0;
    SKAction *fadeIn = [SKAction fadeAlphaTo:1.0 duration:2.0];
    [self addChild:goodnightMonkey];
    [goodnightMonkey runAction:fadeIn];
    
    
    

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



- (void)leaves2Touch
{
    
    // get reference to the atlas
    SKTextureAtlas *Atlas = [SKTextureAtlas atlasNamed:@"leaves2"];
    // create an array to hold image textures
    NSMutableArray *Textures = [NSMutableArray array];
    
    // load the animation frames from the TextureAtlas
    int numImages = (int)Atlas.textureNames.count;
    for (int i=1; i <= numImages; i++) {
        NSString *textureName = [NSString stringWithFormat:@"leaves%i", i];
        SKTexture *SequenceTexture = [Atlas textureNamed:textureName];
        [Textures addObject:SequenceTexture];
        NSLog(@"%@",Textures); //show which image assets are being used.
    }
    SKAction *repeatAnimation = [SKAction animateWithTextures:Textures timePerFrame:0.1];
    SKAction *keepRepeatingAnimation = [SKAction repeatAction:repeatAnimation count:2];
    [_btnLeaves2 runAction:keepRepeatingAnimation];
    
}


- (void)changeToNextScene
{
    Scene2 *nextScene = [Scene2 sceneWithSize:self.size];
    [self.view presentScene:nextScene transition:[SKTransition fadeWithDuration:0.5]];
}

- (void)changeToPrevScene
{
    MyScene *prevScene = [MyScene sceneWithSize:self.size];
    [self.view presentScene:prevScene transition:[SKTransition fadeWithDuration:0.5]];
}





-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    
    for (UITouch *touch in touches){
        CGPoint location = [touch locationInNode:self];
        
        
        if([_btnAnimal containsPoint:location])
        {
            NSLog(@"animal touch");
            if (_asleep == YES) {
                [self tickleAnimal];
            }
            else {
                [self sleepAnimal];
                _asleep = YES;
            }
            
        }
        
        if([_btnLeaves2 containsPoint:location]) {
            NSLog(@"leaves2 touch");
            [self leaves2Touch];
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


-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches){
        CGPoint location = [touch locationInNode:self];
        
        if([_btnNextScene containsPoint:location]) {
            NSLog(@"next scene touch ends");
            [self changeToNextScene];
        }
        if([_btnPrevScene containsPoint:location]) {
            NSLog(@"prev scene touch ends");
            [self changeToPrevScene];
        }
    }
}





-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
