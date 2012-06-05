//
//  ViewController.m
//  GeoChallenge
//
//  Created by johanmazeyrat on 31/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize score;
@synthesize decompte;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    compteur = 0;
    points = 0;
    total = 0;
    distance = 0;
    temps = 0;
    etat = 0;
    x = 200;
    y = 200;
    timer1 = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(boucleJeu) userInfo:nil repeats:YES];
}

- (void)viewDidUnload
{
    [self setDecompte:nil];
    [self setScore:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

-(void) boucleJeu {
    temps++;
    decompte.text = [NSString stringWithFormat:@"%@%d",@"Temps restant = ", (10 - temps)];
    if(temps == 10) {
        temps = 0;
        points = 0;
        compteur++;
    }
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if(!etat) {
        aTouche = 1; // Le joueur a touché l'écran
        UITouch *touch = [[event allTouches] anyObject];
        CGPoint location = [touch locationInView:touch.view];
    
        //CALCUL POINTS
        distance = pow((abs(location.x - x)),2) + pow((abs(location.y - y)),2);
        distance = sqrt(distance);
        //NSLog(@"x = %f\ty = %f\n",location.x,location.y);
        //NSLog(@"distance = %d\n",distance);
        if(distance <= 300)
        {
            points = 100;
        }
        total = total + points;
        score.text = [NSString stringWithFormat:@"%@%d%@%d%@%d%@%d%@%d",@"Distance = ",distance,@"  Temps = ",temps,@"  Total = ",total,@"  Points = ",points,@"  Compteur = ",compteur];
        temps = 0;
        compteur++;
        if(compteur >= 3) {
            [timer1 invalidate];
            etat = 1;
        }
    }
}

@end
