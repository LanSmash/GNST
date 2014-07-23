
//  Scene2.m
//  Good Night, Sleep Tight
//
//  Created by carahewitt on 22/07/2014.
//  Copyright (c) 2014 cara hewitt. All rights reserved.
//


#import "MyScene.h"
#import "Scene1.h"
#import "Scene2.h"
#import "Scene3.h"
#import "EndScene.h"
#import "DrawingOrder.h"
#import <AVFoundation/AVFoundation.h>

@implementation Scene2 {
    
    SKSpriteNode *_btnAnimal;
    SKSpriteNode *_btnNextScene;
    SKSpriteNode *_btnPrevScene;
    SKSpriteNode *_btnBarnBackWall;
    AVAudioPlayer *_moonSound;
    AVAudioPlayer *_giggleSound;
    AVAudioPlayer *_yawnSound;
    BOOL _asleep;

}




-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        

        

        
        // add the barn background
        _btnBarnBackWall = [SKSpriteNode spriteNodeWithImageNamed:@"barnbackwall"];
        _btnBarnBackWall.position = CGPointMake(526.0f,300.0f);
        _btnBarnBackWall.zPosition = DrawingOrderBackground;
        [self addChild:_btnBarnBackWall];
    
        
      
        
        // add the non-interactive foreground image assets
        SKSpriteNode *barnroof = [SKSpriteNode spriteNodeWithImageNamed:@"s2foreground"];
        barnroof.position = CGPointMake(size.width/2, size.height/2);
        barnroof.zPosition = DrawingOrderForeground;
        [self addChild:barnroof];
        
        
        
        // add the animal
        _btnAnimal = [SKSpriteNode spriteNodeWithImageNamed:@"chicken"];
        _btnAnimal.position = CGPointMake(505.0f,395.0f);
        _btnAnimal.zPosition = DrawingOrderOtherSprites;
        [self addChild:_btnAnimal];
        

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
        NSURL *giggleURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"chicken-asleep" ofType:@"mp3"]];
        _giggleSound = [[AVAudioPlayer alloc] initWithContentsOfURL:giggleURL error:nil];
        NSURL *yawnURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"chicken-awake" ofType:@"mp3"]];
        _yawnSound = [[AVAudioPlayer alloc] initWithContentsOfURL:yawnURL error:nil];
        
        [self addBarnContainer:size];

        
    }
    return self;
}






- (void)tickleAnimal
{
    [_yawnSound stop];
    [_giggleSound play];
    
    
    SKTextureAtlas *Atlas = [SKTextureAtlas atlasNamed:@"chicken"];
    // create an array to hold image textures
    NSMutableArray *Textures = [NSMutableArray array];
    
    // load the animation frames from the TextureAtlas
    int numImages = (int)Atlas.textureNames.count;
    for (int i=1; i <= numImages; i++) {
        NSString *textureName = [NSString stringWithFormat:@"chicken%02i", i];
        SKTexture *SequenceTexture = [Atlas textureNamed:textureName];
        [Textures addObject:SequenceTexture];
        //NSLog(@"%@",Atlas); //show which image assets are being used.
        NSLog(@"%@",Textures); //show which image assets are being used.
    }
    
    // repeat the animation a few times
    SKAction *repeatAnimation = [SKAction animateWithTextures:Textures timePerFrame:0.15];
    SKAction *keepRepeatingAnimation = [SKAction repeatAction:repeatAnimation count:2.5];
    [_btnAnimal runAction:keepRepeatingAnimation];
    
}


- (void)sleepAnimal
{
    [_yawnSound play];
    
    // get reference to the atlas
    SKTextureAtlas *Atlas = [SKTextureAtlas atlasNamed:@"chicken"];
    // create an array to hold image textures
    NSMutableArray *Textures = [NSMutableArray array];
    
    // load the animation frames from the TextureAtlas
    int numImages = (int)Atlas.textureNames.count;
    for (int i=1; i <= numImages; i++) {
        NSString *textureName = [NSString stringWithFormat:@"chicken%02i", i];
        SKTexture *SequenceTexture = [Atlas textureNamed:textureName];
        [Textures addObject:SequenceTexture];
        NSLog(@"%@",Textures); //show which image assets are being used.
    }
    SKAction *repeatAnimation = [SKAction animateWithTextures:Textures timePerFrame:0.15];
    SKAction *keepRepeatingAnimation = [SKAction repeatAction:repeatAnimation count:1.8];
    [_btnAnimal runAction:keepRepeatingAnimation];
    
    
    //add "good night, monkey" text
    SKSpriteNode *goodnightMonkey = [SKSpriteNode spriteNodeWithImageNamed:@"goodnight-chicken"];
    goodnightMonkey.position = CGPointMake(520.0f, 180.0f);
    goodnightMonkey.zPosition = DrawingOrderOtherSprites;
    goodnightMonkey.alpha = 0.0;
    SKAction *fadeIn = [SKAction fadeAlphaTo:1.0 duration:2.0];
    [self addChild:goodnightMonkey];
    [goodnightMonkey runAction:fadeIn];
    

    
}






-(void) addBarnContainer:(CGSize)size {

    SKNode *bottomEdge = [SKNode node];
    bottomEdge.physicsBody = [SKPhysicsBody bodyWithEdgeFromPoint:CGPointMake(0,35) toPoint:CGPointMake(size.width, 35)];
    
    SKNode *leftEdge = [SKNode node];
    leftEdge.physicsBody = [SKPhysicsBody bodyWithEdgeFromPoint:CGPointMake(1,size.height) toPoint:CGPointMake(1, 1)];
    
    SKNode *rightEdge = [SKNode node];
    rightEdge.physicsBody = [SKPhysicsBody bodyWithEdgeFromPoint:CGPointMake(630,size.height) toPoint:CGPointMake(630, 1)];
    
    [self addChild:bottomEdge];
    [self addChild:leftEdge];
    [self addChild:rightEdge];
    
    
    
}






- (void)changeToNextScene
{
    Scene3 *nextScene = [Scene3 sceneWithSize:self.size];
    [self.view presentScene:nextScene transition:[SKTransition fadeWithDuration:0.5]];
}

- (void)changeToPrevScene
{
    Scene1 *prevScene = [Scene1 sceneWithSize:self.size];
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
        else
            if([_btnBarnBackWall containsPoint:location])
            {
                NSLog(@"barn touch");
                SKSpriteNode *egg = [SKSpriteNode spriteNodeWithImageNamed:@"egg"];
                egg.position = location;
                egg.zPosition = DrawingOrderOtherSprites;
                //add a physics body
                egg.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:egg.frame.size.width/2];
                [self addChild:egg];
                SKAction *playSFX = [SKAction playSoundFileNamed:@"plop.mp3" waitForCompletion:NO];
                [self runAction:playSFX];
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