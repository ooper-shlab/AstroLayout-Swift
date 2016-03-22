//
//  AAPLViewController.swift
//  AstroLayout
//
//  Translated by OOPer in cooperation with shlab.jp, on 2015/6/29.
//
//
/*
	Copyright (C) 2015 Apple Inc. All Rights Reserved.
	See LICENSE.txt for this sample’s licensing information

	Abstract:
	This sample demonstrates how to properly activate and deactivate groups of constraints in response to a size class change. It also shows how to animate layout changes using UIView animations. This code leverages layout guides and anchors to reduce code overhead and allow for more complex layouts.
 */
//
//@import UIKit;
import UIKit
//
//@interface AAPLViewController : UIViewController
@objc(AAPLViewController)
class AAPLViewController: UIViewController {
//@end
//
//#import "AAPLViewController.h"
//
//@interface AAPLViewController () {
    /* Image views for each planet (created in -createPlanetViews). */
//    UIImageView *mercury;
    private var mercury: UIImageView!
//    UIImageView *venus;
    private var venus: UIImageView!
//    UIImageView *earth;
    private var earth: UIImageView!
//    UIImageView *mars;
    private var mars: UIImageView!
//    UIImageView *jupiter;
    private var jupiter: UIImageView!
//    UIImageView *saturn;
    private var saturn: UIImageView!
//    UIImageView *uranus;
    private var uranus: UIImageView!
//    UIImageView *neptune;
    private var neptune: UIImageView!

    /* To do a basic animation (-changeLayout:), all that's needed is to activate and deactivate an array of constraints. To do more sophisticated animations, holding on to individual constraints instead allows for more control (below). */
//    NSArray *compactConstraints;
    private var compactConstraints: [NSLayoutConstraint] = []
//    NSArray *regularConstraints;
    private var regularConstraints: [NSLayoutConstraint] = []
//    NSArray *sharedConstraints;
    private var sharedConstraints: [NSLayoutConstraint] = []

    /* Keeping these around for the more sophisticated animation between layouts found in -keyframeBasedLayoutChange:. If the animation is for a whole set of constraints at once (-changeLayout:), use an array of constraints as seen above with compactConstraints, regularConstraints, and sharedConstraints. */
//    NSLayoutConstraint *mercuryLeadingToTrailing;
    private var mercuryLeadingToTrailing: NSLayoutConstraint!
//    NSLayoutConstraint *venusLeadingToTrailing;
    private var venusLeadingToTrailing: NSLayoutConstraint!
//    NSLayoutConstraint *earthLeadingToTrailing;
    private var earthLeadingToTrailing: NSLayoutConstraint!
//    NSLayoutConstraint *marsLeadingToTrailing;
    private var marsLeadingToTrailing: NSLayoutConstraint!
//    NSLayoutConstraint *jupiterLeadingToTrailing;
    private var jupiterLeadingToTrailing: NSLayoutConstraint!
//    NSLayoutConstraint *saturnLeadingToTrailing;
    private var saturnLeadingToTrailing: NSLayoutConstraint!
//    NSLayoutConstraint *uranusLeadingToTrailing;
    private var uranusLeadingToTrailing: NSLayoutConstraint!
//    NSLayoutConstraint *neptuneLeadingToTrailing;
    private var neptuneLeadingToTrailing: NSLayoutConstraint!
//
//    NSLayoutConstraint *mercuryCenter;
    private var mercuryCenter: NSLayoutConstraint!
//    NSLayoutConstraint *venusCenter;
    private var venusCenter: NSLayoutConstraint!
//    NSLayoutConstraint *earthCenter;
    private var earthCenter: NSLayoutConstraint!
//    NSLayoutConstraint *marsCenter;
    private var marsCenter: NSLayoutConstraint!
//    NSLayoutConstraint *jupiterCenter;
    private var jupiterCenter: NSLayoutConstraint!
//    NSLayoutConstraint *saturnCenter;
    private var saturnCenter: NSLayoutConstraint!
//    NSLayoutConstraint *uranusCenter;
    private var uranusCenter: NSLayoutConstraint!
//    NSLayoutConstraint *neptuneCenter;
    private var neptuneCenter: NSLayoutConstraint!
//}
//@end
//
//@implementation AAPLViewController
//
//- (void)viewDidLoad {
    override func viewDidLoad() {
//    [super viewDidLoad];
        super.viewDidLoad()
//
//    self.view.backgroundColor = [UIColor blackColor];
        self.view.backgroundColor = UIColor.blackColor()
//
//    [self createPlanetViews];
        self.createPlanetViews()
//
//    [self createConstraints];
        self.createConstraints()
//
//    [self setUpGestures];
        self.setUpGestures()
//}
    }
//
//- (void)createConstraints {
    private func createConstraints() {
    /* Constraint creation methods. See comments in each method for more detail. */
//    [self planetSizes];
        self.planetSizes()
//
//    [self createCompactConstraints];
        self.createCompactConstraints()
//
//    [self createRegularConstraints];
        self.createRegularConstraints()

    /* Activate a set of constraints for initial layout. */
//    [NSLayoutConstraint activateConstraints: regularConstraints];
        NSLayoutConstraint.activateConstraints(regularConstraints)
//    [NSLayoutConstraint activateConstraints: sharedConstraints];
        NSLayoutConstraint.activateConstraints(sharedConstraints)
//}
    }

/* Method to set identifiers on an array of constraints, used several times in the code. Identifiers make it much easier to debug layout problems later. */
//- (void)setLayoutIdentifier:(NSString *)identifier forArray:(NSArray *)constraintsArray {
    private func setLayoutIdentifier(identifier: String, forArray constraintsArray: [NSLayoutConstraint]) {
//    for (NSLayoutConstraint *constraint in constraintsArray) {
        for constraint in constraintsArray {
//        constraint.identifier = identifier;
            constraint.identifier = identifier
//    }
        }
//}
    }
//
//MARK: - Planet views and constraints
//
//- (void)createPlanetViews {
    private func createPlanetViews() {
    /* Since 8 views are being created that have essentially identical setup code, just use a block to reduce code overhead.
     This could be also be done 'longhand' by setting up each planet with its own individual code, or in a separate method outside of this one rather than a block inside. */
//
//    UIImageView *(^planetCreate)(NSString *) = ^(NSString *planetName){
        func planetCreate(planetName: String) -> UIImageView {
//        UIImageView *planet = [[UIImageView alloc] initWithImage: [UIImage imageNamed: planetName]];
            let planet = UIImageView(image: UIImage(named: planetName)!)
//        [planet setTranslatesAutoresizingMaskIntoConstraints: NO];
            planet.translatesAutoresizingMaskIntoConstraints = false
//        planet.contentMode = UIViewContentModeScaleAspectFit;
            planet.contentMode = UIViewContentMode.ScaleAspectFit
//        planet.accessibilityIdentifier = planetName;
            planet.accessibilityIdentifier = planetName
        /* These identifiers show up in logs, allowing for easier layout debugging. */
//        [self.view addSubview: planet];
            self.view.addSubview(planet)
//
//        return planet;
            return planet
//    };
        }
//
//    mercury = planetCreate(@"Mercury");
//    venus = planetCreate(@"Venus");
//    earth = planetCreate(@"Earth");
//    mars = planetCreate(@"Mars");
//    jupiter = planetCreate(@"Jupiter");
//    saturn = planetCreate(@"Saturn");
//    uranus = planetCreate(@"Uranus");
//    neptune = planetCreate(@"Neptune");
        mercury = planetCreate("Mercury");
        venus = planetCreate("Venus");
        earth = planetCreate("Earth");
        mars = planetCreate("Mars");
        jupiter = planetCreate("Jupiter");
        saturn = planetCreate("Saturn");
        uranus = planetCreate("Uranus");
        neptune = planetCreate("Neptune");
//}
    }
//
//
//- (void)planetSizes {
    private func planetSizes() {
    /* Using Earth as the basis, create the sizes of the planets. This is easy to adjust in the future if needed for usability or accuracy.
     Also, constrain each planet's width to its own height so that the aspect ratio will be correct during layout.
     These sizes will adapt depending on the size of the environment the view is in so that all 8 planets will be visible. Notice that Earth's height is not directly created anywhere. This allows it to be a bit larger on larger screens (and cause the other planets to be larger as well) and shrink to fit on smaller screens (and reduce the other planets) while keeping the ratios constant. */
//
//    NSLayoutConstraint *mercuryHeight = [mercury.heightAnchor constraintEqualToAnchor: earth.heightAnchor multiplier: .38];
        let mercuryHeight = mercury.heightAnchor.constraintEqualToAnchor(earth.heightAnchor, multiplier: 0.38)
//    NSLayoutConstraint *mercuryWidth  = [mercury.widthAnchor constraintEqualToAnchor: mercury.heightAnchor multiplier: 1.];
        let mercuryWidth  = mercury.widthAnchor.constraintEqualToAnchor(mercury.heightAnchor, multiplier: 1.0)
//
//    NSLayoutConstraint *venusHeight   = [venus.heightAnchor constraintEqualToAnchor: earth.heightAnchor multiplier: .95];
        let venusHeight   = venus.heightAnchor.constraintEqualToAnchor(earth.heightAnchor, multiplier: 0.95)
//    NSLayoutConstraint *venusWidth    = [venus.widthAnchor constraintEqualToAnchor: venus.heightAnchor multiplier: 1.];
        let venusWidth    = venus.widthAnchor.constraintEqualToAnchor(venus.heightAnchor, multiplier: 1.0)
//
//    NSLayoutConstraint *marsHeight    = [mars.heightAnchor constraintEqualToAnchor: earth.heightAnchor multiplier: .53];
        let marsHeight    = mars.heightAnchor.constraintEqualToAnchor(earth.heightAnchor, multiplier: 0.53)
//    NSLayoutConstraint *marsWidth     = [mars.widthAnchor constraintEqualToAnchor: mars.heightAnchor multiplier: 1.];
        let marsWidth     = mars.widthAnchor.constraintEqualToAnchor(mars.heightAnchor, multiplier: 1.0)
//
//    NSLayoutConstraint *jupiterHeight = [jupiter.heightAnchor constraintEqualToAnchor: earth.heightAnchor multiplier: 11.2];
        let jupiterHeight = jupiter.heightAnchor.constraintEqualToAnchor(earth.heightAnchor, multiplier: 11.2)
//    NSLayoutConstraint *jupiterWidth  = [jupiter.widthAnchor constraintEqualToAnchor: jupiter.heightAnchor multiplier: 1.];
        let jupiterWidth  = jupiter.widthAnchor.constraintEqualToAnchor(jupiter.heightAnchor, multiplier: 1.0)
//
//    NSLayoutConstraint *saturnHeight  = [saturn.heightAnchor constraintEqualToAnchor: earth.heightAnchor multiplier: 9.45];
        let saturnHeight  = saturn.heightAnchor.constraintEqualToAnchor(earth.heightAnchor, multiplier: 9.45)
//    NSLayoutConstraint *saturnWidth   = [saturn.widthAnchor constraintEqualToAnchor: saturn.heightAnchor multiplier: 1.5];
        let saturnWidth   = saturn.widthAnchor.constraintEqualToAnchor(saturn.heightAnchor, multiplier: 1.5)
//
//    NSLayoutConstraint *uranusHeight  = [uranus.heightAnchor constraintEqualToAnchor: earth.heightAnchor multiplier: 4.];
        let uranusHeight  = uranus.heightAnchor.constraintEqualToAnchor(earth.heightAnchor, multiplier: 4.0)
//    NSLayoutConstraint *uranusWidth   = [uranus.widthAnchor constraintEqualToAnchor: uranus.heightAnchor multiplier: 1.];
        let uranusWidth   = uranus.widthAnchor.constraintEqualToAnchor(uranus.heightAnchor, multiplier: 1.0)
//
//    NSLayoutConstraint *neptuneHeight = [neptune.heightAnchor constraintEqualToAnchor: earth.heightAnchor multiplier: 3.88];
        let neptuneHeight = neptune.heightAnchor.constraintEqualToAnchor(earth.heightAnchor, multiplier: 3.88)
//    NSLayoutConstraint *neptuneWidth  = [neptune.widthAnchor constraintEqualToAnchor: neptune.heightAnchor multiplier: 1.];
        let neptuneWidth  = neptune.widthAnchor.constraintEqualToAnchor(neptune.heightAnchor, multiplier: 1.0)
//
//    NSLayoutConstraint *earthWidth    = [earth.widthAnchor constraintEqualToAnchor: earth.heightAnchor];
        let earthWidth    = earth.widthAnchor.constraintEqualToAnchor(earth.heightAnchor)
//
//    mercuryHeight.identifier = @"mercuryHeight";
//    mercuryWidth.identifier = @"mercuryWidth";
//    venusHeight.identifier = @"venusHeight";
//    venusWidth.identifier = @"venusWidth";
//    marsHeight.identifier = @"marsHeight";
//    marsWidth.identifier = @"marsWidth";
//    jupiterHeight.identifier = @"jupiterHeight";
//    jupiterWidth.identifier = @"jupiterWidth";
//    saturnHeight.identifier = @"saturnHeight";
//    saturnWidth.identifier = @"saturnWidth ";
//    uranusHeight.identifier = @"uranusHeight";
//    uranusWidth.identifier = @"uranusWidth ";
//    neptuneHeight.identifier = @"neptuneHeight";
//    neptuneWidth.identifier = @"neptuneWidth";
//    earthWidth.identifier = @"earthWidth";
        mercuryHeight.identifier = "mercuryHeight";
        mercuryWidth.identifier = "mercuryWidth";
        venusHeight.identifier = "venusHeight";
        venusWidth.identifier = "venusWidth";
        marsHeight.identifier = "marsHeight";
        marsWidth.identifier = "marsWidth";
        jupiterHeight.identifier = "jupiterHeight";
        jupiterWidth.identifier = "jupiterWidth";
        saturnHeight.identifier = "saturnHeight";
        saturnWidth.identifier = "saturnWidth ";
        uranusHeight.identifier = "uranusHeight";
        uranusWidth.identifier = "uranusWidth ";
        neptuneHeight.identifier = "neptuneHeight";
        neptuneWidth.identifier = "neptuneWidth";
        earthWidth.identifier = "earthWidth";
//
//    [NSLayoutConstraint activateConstraints: @[mercuryHeight, venusHeight, marsHeight, jupiterHeight, saturnHeight, uranusHeight, neptuneHeight, mercuryWidth, venusWidth, earthWidth, marsWidth, jupiterWidth, saturnWidth, uranusWidth, neptuneWidth]];
        NSLayoutConstraint.activateConstraints([mercuryHeight, venusHeight, marsHeight, jupiterHeight, saturnHeight, uranusHeight, neptuneHeight, mercuryWidth, venusWidth, earthWidth, marsWidth, jupiterWidth, saturnWidth, uranusWidth, neptuneWidth])
//}
    }
//
//#pragma mark - Compact layout
//
//- (void)createCompactConstraints {
    private func createCompactConstraints() {
    /* The constraints for a horizontally compact layout. Don't activate until needed. Don't bother to recreate constraints if they already exist. */
//    if (compactConstraints.count > 0) {
        if compactConstraints.count > 0 {
//        return;
            return
//    }
        }

    /* Simplify creating multiple similar constraints using a block. As with creating the planet views, this could be done individually or in a method outside of this one instead of a block, but since they are so similar, this reduces the amount of code required. Each planet gets its centerXAnchor set to the centerXAnchor of the superview. That means that, in a compact horizontal setting, the planets will be aligned by their centers in the middle of the superview. */
//
//    NSLayoutConstraint *(^createCenterXConstraint)(UIImageView *, NSString *) = ^(UIImageView *planetToCenter, NSString *identifierName){
        func createCenterXConstraint(planetToCenter: UIImageView, _ identifierName: String) -> NSLayoutConstraint {
//        NSLayoutConstraint *newConstraint = [planetToCenter.centerXAnchor constraintEqualToAnchor: self.view.centerXAnchor];
            let newConstraint = planetToCenter.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor)
//        newConstraint.identifier = identifierName;
            newConstraint.identifier = identifierName
//        return newConstraint;
            return newConstraint
//    };
        }
//
//    mercuryCenter = createCenterXConstraint(mercury, @"mercuryCenterX");
//    venusCenter   = createCenterXConstraint(venus, @"venusCenterX");
//    earthCenter   = createCenterXConstraint(earth, @"earthCenterX");
//    marsCenter    = createCenterXConstraint(mars, @"marsCenterX");
//    jupiterCenter = createCenterXConstraint(jupiter, @"jupiterCenterX");
//    saturnCenter  = createCenterXConstraint(saturn, @"saturnCenterX");
//    uranusCenter  = createCenterXConstraint(uranus, @"uranusCenterX");
//    neptuneCenter = createCenterXConstraint(neptune, @"neptuneCenterX");
        mercuryCenter = createCenterXConstraint(mercury, "mercuryCenterX");
        venusCenter   = createCenterXConstraint(venus, "venusCenterX");
        earthCenter   = createCenterXConstraint(earth, "earthCenterX");
        marsCenter    = createCenterXConstraint(mars, "marsCenterX");
        jupiterCenter = createCenterXConstraint(jupiter, "jupiterCenterX");
        saturnCenter  = createCenterXConstraint(saturn, "saturnCenterX");
        uranusCenter  = createCenterXConstraint(uranus, "uranusCenterX");
        neptuneCenter = createCenterXConstraint(neptune, "neptuneCenterX");
//
//    compactConstraints = @[mercuryCenter, venusCenter, earthCenter, marsCenter, jupiterCenter, saturnCenter, uranusCenter, neptuneCenter];
        compactConstraints = [mercuryCenter, venusCenter, earthCenter, marsCenter, jupiterCenter, saturnCenter, uranusCenter, neptuneCenter]
//}
    }
//
//#pragma mark - Regular layout
//
//- (void)createRegularConstraints {
    private func createRegularConstraints() {
    /* The constraints for a horizontally regular layout. Don't activate until needed. Constraints shared between the two layouts are also created here. Don't recreate constraints if they already exist. */

//    if (regularConstraints.count > 0 && sharedConstraints.count > 0) {
        if regularConstraints.count > 0 && sharedConstraints.count > 0 {
//        return;
            return
//    }
        }

    /* Initial setup of layout guides. Layout guides do not show up in the view; they are used as spacers for more complex layouts. Here are layout guides on either side of each planet. They base their widths off of each other to end up with the nice, slightly curved layout of the planets (bottom of this method). These are easier to track and involve less code than using 'dummy' spacer views. */
//    UILayoutGuide *(^newLayoutGuide)(NSString *) = ^(NSString *identifierName){
        func newLayoutGuide(identifierName: String) -> UILayoutGuide {
//        UILayoutGuide *newGuide = [[UILayoutGuide alloc] init];
            let newGuide = UILayoutGuide()
//        newGuide.identifier = identifierName;
            newGuide.identifier = identifierName
//        [self.view addLayoutGuide: newGuide];
            self.view.addLayoutGuide(newGuide)
//        return newGuide;
            return newGuide
//    };
        }
//
//    UILayoutGuide *leadingMercuryGuide = newLayoutGuide(@"leadingMercuryGuide");
//    UILayoutGuide *leadingVenusGuide = newLayoutGuide(@"leadingVenusGuide");
//    UILayoutGuide *leadingEarthGuide = newLayoutGuide(@"leadingEarthGuide");
//    UILayoutGuide *leadingMarsGuide = newLayoutGuide(@"leadingMarsGuide");
//    UILayoutGuide *leadingJupiterGuide = newLayoutGuide(@"leadingJupiterGuide");
//    UILayoutGuide *leadingSaturnGuide = newLayoutGuide(@"leadingSaturnGuide");
//    UILayoutGuide *leadingUranusGuide = newLayoutGuide(@"leadingUranusGuide");
//    UILayoutGuide *leadingNeptuneGuide = newLayoutGuide(@"leadingNeptuneGuide");
        let leadingMercuryGuide = newLayoutGuide("leadingMercuryGuide");
        let leadingVenusGuide = newLayoutGuide("leadingVenusGuide");
        let leadingEarthGuide = newLayoutGuide("leadingEarthGuide");
        let leadingMarsGuide = newLayoutGuide("leadingMarsGuide");
        let leadingJupiterGuide = newLayoutGuide("leadingJupiterGuide");
        let leadingSaturnGuide = newLayoutGuide("leadingSaturnGuide");
        let leadingUranusGuide = newLayoutGuide("leadingUranusGuide");
        let leadingNeptuneGuide = newLayoutGuide("leadingNeptuneGuide");
//
//    UILayoutGuide *trailingMercuryGuide = newLayoutGuide(@"trailingMercuryGuide");
//    UILayoutGuide *trailingVenusGuide = newLayoutGuide(@"trailingVenusGuide");
//    UILayoutGuide *trailingEarthGuide = newLayoutGuide(@"trailingEarthGuide");
//    UILayoutGuide *trailingMarsGuide = newLayoutGuide(@"trailingMarsGuide");
//    UILayoutGuide *trailingJupiterGuide = newLayoutGuide(@"trailingJupiterGuide");
//    UILayoutGuide *trailingSaturnGuide = newLayoutGuide(@"trailingSaturnGuide");
//    UILayoutGuide *trailingUranusGuide = newLayoutGuide(@"trailingUranusGuide");
//    UILayoutGuide *trailingNeptuneGuide = newLayoutGuide(@"trailingNeptuneGuide");
        let trailingMercuryGuide = newLayoutGuide("trailingMercuryGuide");
        let trailingVenusGuide = newLayoutGuide("trailingVenusGuide");
        let trailingEarthGuide = newLayoutGuide("trailingEarthGuide");
        let trailingMarsGuide = newLayoutGuide("trailingMarsGuide");
        let trailingJupiterGuide = newLayoutGuide("trailingJupiterGuide");
        let trailingSaturnGuide = newLayoutGuide("trailingSaturnGuide");
        let trailingUranusGuide = newLayoutGuide("trailingUranusGuide");
        let trailingNeptuneGuide = newLayoutGuide("trailingNeptuneGuide");
//
//    id topLayoutGuide = self.topLayoutGuide;
        let topLayoutGuide = self.topLayoutGuide
//
//    NSDictionary *planetsAndGuides = NSDictionaryOfVariableBindings(mercury, venus, earth, mars, jupiter, saturn, uranus, neptune, leadingMercuryGuide, leadingVenusGuide, leadingEarthGuide, leadingMarsGuide, leadingJupiterGuide, leadingSaturnGuide, leadingUranusGuide, leadingNeptuneGuide, trailingMercuryGuide, trailingVenusGuide, trailingEarthGuide, trailingMarsGuide, trailingJupiterGuide, trailingSaturnGuide, trailingUranusGuide, trailingNeptuneGuide, topLayoutGuide);
        let planetsAndGuides: [String: AnyObject] = [
            "mercury": mercury,
            "venus": venus,
            "earth": earth,
            "mars": mars,
            "jupiter": jupiter,
            "saturn": saturn,
            "uranus": uranus,
            "neptune": neptune,
            "leadingMercuryGuide": leadingMercuryGuide,
            "leadingVenusGuide": leadingVenusGuide,
            "leadingEarthGuide": leadingEarthGuide,
            "leadingMarsGuide": leadingMarsGuide,
            "leadingJupiterGuide": leadingJupiterGuide,
            "leadingSaturnGuide": leadingSaturnGuide,
            "leadingUranusGuide": leadingUranusGuide,
            "leadingNeptuneGuide": leadingNeptuneGuide,
            "trailingMercuryGuide": trailingMercuryGuide,
            "trailingVenusGuide": trailingVenusGuide,
            "trailingEarthGuide": trailingEarthGuide,
            "trailingMarsGuide": trailingMarsGuide,
            "trailingJupiterGuide": trailingJupiterGuide,
            "trailingSaturnGuide": trailingSaturnGuide,
            "trailingUranusGuide": trailingUranusGuide,
            "trailingNeptuneGuide": trailingNeptuneGuide,
            "topLayoutGuide": topLayoutGuide]

    /* Use the layout guides to create the vertical spacing. This could also be done with the planet views themselves. */
//    NSArray *topToBottom = [NSLayoutConstraint constraintsWithVisualFormat: @"V:|[topLayoutGuide]-[leadingMercuryGuide]-[leadingVenusGuide]-[leadingEarthGuide]-[leadingMarsGuide]-[leadingJupiterGuide][leadingSaturnGuide][leadingUranusGuide]-[leadingNeptuneGuide]-20-|"
        let topToBottom = NSLayoutConstraint.constraintsWithVisualFormat("V:|[topLayoutGuide]-[leadingMercuryGuide]-[leadingVenusGuide]-[leadingEarthGuide]-[leadingMarsGuide]-[leadingJupiterGuide][leadingSaturnGuide][leadingUranusGuide]-[leadingNeptuneGuide]-20-|",
//                                                                   options: 0
            options: [],
//                                                                   metrics: 0
            metrics: [:],
//                                                                     views: planetsAndGuides];
            views: planetsAndGuides)
//
//    sharedConstraints = topToBottom;
        sharedConstraints = topToBottom
//    [self setLayoutIdentifier: @"topToBottom" forArray: topToBottom];
        self.setLayoutIdentifier("topToBottom", forArray: topToBottom)

    /* Set up the horizontal relationships for the planets and their layout guides using the visual format language (VFL). */
//    void (^newHorizontalArray)(NSString *, NSString *) = ^(NSString *layoutString, NSString *arrayID){
        func newHorizontalArray(layoutString: String, _ arrayID: String) {
//        NSArray *horizontalConstraintsArray = [NSLayoutConstraint constraintsWithVisualFormat: layoutString
            let horizontalConstraintsArray = NSLayoutConstraint.constraintsWithVisualFormat(layoutString,
//                                                                                      options: NSLayoutFormatAlignAllCenterY
                options: NSLayoutFormatOptions.AlignAllCenterY,
//                                                                                      metrics: 0
                metrics: [:],
//                                                                                        views: planetsAndGuides];
                views: planetsAndGuides)
//        sharedConstraints = [sharedConstraints arrayByAddingObjectsFromArray: horizontalConstraintsArray];
            sharedConstraints += horizontalConstraintsArray
//        [self setLayoutIdentifier: arrayID forArray: horizontalConstraintsArray];
            self.setLayoutIdentifier(arrayID, forArray: horizontalConstraintsArray)
//    };
        }
//
//    newHorizontalArray(@"|[leadingMercuryGuide][mercury][trailingMercuryGuide]|", @"hMercury");
//    newHorizontalArray(@"|[leadingVenusGuide][venus][trailingVenusGuide]|", @"hVenus");
//    newHorizontalArray(@"|[leadingEarthGuide][earth][trailingEarthGuide]|", @"hEarth");
//    newHorizontalArray(@"|[leadingMarsGuide][mars][trailingMarsGuide]|", @"hMars");
//    newHorizontalArray(@"|[leadingJupiterGuide][jupiter][trailingJupiterGuide]|", @"hJupiter");
//    newHorizontalArray(@"|[leadingSaturnGuide][saturn][trailingSaturnGuide]|", @"hSaturn");
//    newHorizontalArray(@"|[leadingUranusGuide][uranus][trailingUranusGuide]|", @"hUranus");
//    newHorizontalArray(@"|[leadingNeptuneGuide][neptune][trailingNeptuneGuide]|", @"hNeptune");
        newHorizontalArray("|[leadingMercuryGuide][mercury][trailingMercuryGuide]|", "hMercury")
        newHorizontalArray("|[leadingVenusGuide][venus][trailingVenusGuide]|", "hVenus")
        newHorizontalArray("|[leadingEarthGuide][earth][trailingEarthGuide]|", "hEarth")
        newHorizontalArray("|[leadingMarsGuide][mars][trailingMarsGuide]|", "hMars")
        newHorizontalArray("|[leadingJupiterGuide][jupiter][trailingJupiterGuide]|", "hJupiter")
        newHorizontalArray("|[leadingSaturnGuide][saturn][trailingSaturnGuide]|", "hSaturn")
        newHorizontalArray("|[leadingUranusGuide][uranus][trailingUranusGuide]|", "hUranus")
        newHorizontalArray("|[leadingNeptuneGuide][neptune][trailingNeptuneGuide]|", "hNeptune")

    /* Make the leading guides the same height as their respective planets to ensure the vertical spacing looks right. This could be tweaked if needed to make the spacing less uniform or overlap a bit for when the planets aren't vertically aligned or if a different layout was desired. */
//    NSLayoutConstraint *(^guideHeightToPlanetHeight)(UILayoutGuide *, UIImageView *, NSString *) = ^(UILayoutGuide *layoutGuide, UIImageView *planet, NSString *identifier){
        func guideHeightToPlanetHeight(layoutGuide: UILayoutGuide, _ planet: UIImageView, _ identifier: String) -> NSLayoutConstraint {
//        NSLayoutConstraint *guideHeightToPlanet = [layoutGuide.heightAnchor constraintEqualToAnchor: planet.heightAnchor];
            let guideHeightToPlanet = layoutGuide.heightAnchor.constraintEqualToAnchor(planet.heightAnchor)
//        guideHeightToPlanet.identifier = identifier;
            guideHeightToPlanet.identifier = identifier
//        return guideHeightToPlanet;
            return guideHeightToPlanet
//    };
        }
//
//    NSLayoutConstraint *guideHeightToMercury = guideHeightToPlanetHeight(leadingMercuryGuide, mercury, @"guideHeightToMercury");
        let guideHeightToMercury = guideHeightToPlanetHeight(leadingMercuryGuide, mercury, "guideHeightToMercury")
//    NSLayoutConstraint *guideHeightToVenus   = guideHeightToPlanetHeight(leadingVenusGuide, venus, @"guideHeightToVenus");
        let guideHeightToVenus   = guideHeightToPlanetHeight(leadingVenusGuide, venus, "guideHeightToVenus")
//    NSLayoutConstraint *guideHeightToEarth   = guideHeightToPlanetHeight(leadingEarthGuide, earth, @"guideHeightToEarth");
        let guideHeightToEarth   = guideHeightToPlanetHeight(leadingEarthGuide, earth, "guideHeightToEarth")
//    NSLayoutConstraint *guideHeightToMars    = guideHeightToPlanetHeight(leadingMarsGuide, mars, @"guideHeightToMars");
        let guideHeightToMars    = guideHeightToPlanetHeight(leadingMarsGuide, mars, "guideHeightToMars")
//    NSLayoutConstraint *guideHeightToJupiter = guideHeightToPlanetHeight(leadingJupiterGuide, jupiter, @"guideHeightToJupiter");
        let guideHeightToJupiter = guideHeightToPlanetHeight(leadingJupiterGuide, jupiter, "guideHeightToJupiter")
//    NSLayoutConstraint *guideHeightToSaturn  = guideHeightToPlanetHeight(leadingSaturnGuide, saturn, @"guideHeightToSaturn");
        let guideHeightToSaturn  = guideHeightToPlanetHeight(leadingSaturnGuide, saturn, "guideHeightToSaturn")
//    NSLayoutConstraint *guideHeightToUranus  = guideHeightToPlanetHeight(leadingUranusGuide, uranus, @"guideHeightToUranus");
        let guideHeightToUranus  = guideHeightToPlanetHeight(leadingUranusGuide, uranus, "guideHeightToUranus")
//    NSLayoutConstraint *guideHeightToNeptune = guideHeightToPlanetHeight(leadingNeptuneGuide, neptune, @"guideHeightToNeptune");
        let guideHeightToNeptune = guideHeightToPlanetHeight(leadingNeptuneGuide, neptune, "guideHeightToNeptune")
//
//    sharedConstraints = [sharedConstraints arrayByAddingObjectsFromArray: @[guideHeightToMercury, guideHeightToVenus, guideHeightToEarth, guideHeightToMars, guideHeightToJupiter, guideHeightToSaturn, guideHeightToUranus, guideHeightToNeptune]];
        sharedConstraints += [guideHeightToMercury, guideHeightToVenus, guideHeightToEarth, guideHeightToMars, guideHeightToJupiter, guideHeightToSaturn, guideHeightToUranus, guideHeightToNeptune]

    /* Here, individual constraints need to be created (rather than bulk creation using a block) as each value is different. Fotunately, anchors make this very easy to do. Each planet is already tied to its leading and trailing layout guides, and now all that's needed is a ratio between the guides to space the planets properly. Trying to set up this alignment without guides is possible, but much less adaptive, and takes a lot more code. */
//
//    mercuryLeadingToTrailing = [leadingMercuryGuide.widthAnchor constraintEqualToAnchor: trailingMercuryGuide.widthAnchor multiplier: .02];
        mercuryLeadingToTrailing = leadingMercuryGuide.widthAnchor.constraintEqualToAnchor( trailingMercuryGuide.widthAnchor, multiplier: 0.02)
//    venusLeadingToTrailing   = [leadingVenusGuide.widthAnchor constraintEqualToAnchor: trailingVenusGuide.widthAnchor multiplier: .03];
        venusLeadingToTrailing   = leadingVenusGuide.widthAnchor.constraintEqualToAnchor(trailingVenusGuide.widthAnchor, multiplier: 0.03)
//    earthLeadingToTrailing   = [leadingEarthGuide.widthAnchor constraintEqualToAnchor: trailingEarthGuide.widthAnchor multiplier: .06];
        earthLeadingToTrailing   = leadingEarthGuide.widthAnchor.constraintEqualToAnchor(trailingEarthGuide.widthAnchor, multiplier: 0.06)
//    marsLeadingToTrailing    = [leadingMarsGuide.widthAnchor constraintEqualToAnchor: trailingMarsGuide.widthAnchor multiplier: .1];
        marsLeadingToTrailing    = leadingMarsGuide.widthAnchor.constraintEqualToAnchor(trailingMarsGuide.widthAnchor, multiplier: 0.1)
//    jupiterLeadingToTrailing = [leadingJupiterGuide.widthAnchor constraintEqualToAnchor: trailingJupiterGuide.widthAnchor multiplier: .2];
        jupiterLeadingToTrailing = leadingJupiterGuide.widthAnchor.constraintEqualToAnchor(trailingJupiterGuide.widthAnchor, multiplier: 0.2)
//    saturnLeadingToTrailing  = [leadingSaturnGuide.widthAnchor constraintEqualToAnchor: trailingSaturnGuide.widthAnchor multiplier: 1.];
        saturnLeadingToTrailing  = leadingSaturnGuide.widthAnchor.constraintEqualToAnchor(trailingSaturnGuide.widthAnchor, multiplier: 1.0)
//    uranusLeadingToTrailing  = [leadingUranusGuide.widthAnchor constraintEqualToAnchor: trailingUranusGuide.widthAnchor multiplier: 2.7];
        uranusLeadingToTrailing  = leadingUranusGuide.widthAnchor.constraintEqualToAnchor(trailingUranusGuide.widthAnchor, multiplier: 2.7)
//    neptuneLeadingToTrailing = [leadingNeptuneGuide.widthAnchor constraintEqualToAnchor: trailingNeptuneGuide.widthAnchor multiplier: 10];
        neptuneLeadingToTrailing = leadingNeptuneGuide.widthAnchor.constraintEqualToAnchor(trailingNeptuneGuide.widthAnchor, multiplier: 10)
//
//    mercuryLeadingToTrailing.identifier = @"leadingTrailingAnchorMercury";
//    venusLeadingToTrailing.identifier = @"leadingTrailingAnchorVenus";
//    earthLeadingToTrailing.identifier = @"leadingTrailingAnchorEarth";
//    marsLeadingToTrailing.identifier = @"leadingTrailingAnchorMars";
//    jupiterLeadingToTrailing.identifier = @"leadingTrailingAnchorJupiter";
//    saturnLeadingToTrailing.identifier = @"leadingTrailingAnchorSaturn";
//    uranusLeadingToTrailing.identifier = @"leadingTrailingAnchorUranus";
//    neptuneLeadingToTrailing.identifier = @"leadingTrailingAnchorNeptune";
        mercuryLeadingToTrailing.identifier = "leadingTrailingAnchorMercury";
        venusLeadingToTrailing.identifier = "leadingTrailingAnchorVenus";
        earthLeadingToTrailing.identifier = "leadingTrailingAnchorEarth";
        marsLeadingToTrailing.identifier = "leadingTrailingAnchorMars";
        jupiterLeadingToTrailing.identifier = "leadingTrailingAnchorJupiter";
        saturnLeadingToTrailing.identifier = "leadingTrailingAnchorSaturn";
        uranusLeadingToTrailing.identifier = "leadingTrailingAnchorUranus";
        neptuneLeadingToTrailing.identifier = "leadingTrailingAnchorNeptune";
//
//    regularConstraints = @[mercuryLeadingToTrailing, venusLeadingToTrailing, earthLeadingToTrailing, marsLeadingToTrailing, saturnLeadingToTrailing, jupiterLeadingToTrailing,  uranusLeadingToTrailing, neptuneLeadingToTrailing];
        regularConstraints = [mercuryLeadingToTrailing, venusLeadingToTrailing, earthLeadingToTrailing, marsLeadingToTrailing, saturnLeadingToTrailing, jupiterLeadingToTrailing,  uranusLeadingToTrailing, neptuneLeadingToTrailing]
//}
    }
//
//
//MARK: - Trait collection changes
//
//- (void) traitCollectionDidChange: (nullable UITraitCollection *) previousTraitCollection
//{
    override func traitCollectionDidChange(previousTraitCollection: UITraitCollection?) {
    /* Check the horizontal trait environment and adjust the layout accordingly. Only deactivate active constraints. */
//    if ([self.traitCollection containsTraitsInCollection: [UITraitCollection traitCollectionWithHorizontalSizeClass: UIUserInterfaceSizeClassCompact]]) {
        if self.traitCollection.containsTraitsInCollection(UITraitCollection(horizontalSizeClass: UIUserInterfaceSizeClass.Compact)) {
//        if ([(NSLayoutConstraint *)[regularConstraints objectAtIndex: 0] isActive]) {
            if regularConstraints[0].active {
//            [NSLayoutConstraint deactivateConstraints: regularConstraints];
                NSLayoutConstraint.deactivateConstraints(regularConstraints)
//            [NSLayoutConstraint activateConstraints: compactConstraints];
                NSLayoutConstraint.activateConstraints(compactConstraints)
//        }
            }
//    }
//    else {
        } else {
//        if ([(NSLayoutConstraint *)[compactConstraints objectAtIndex: 0] isActive]) {
            if compactConstraints[0].active {
//            [NSLayoutConstraint deactivateConstraints: compactConstraints];
                NSLayoutConstraint.deactivateConstraints(compactConstraints)
//            [NSLayoutConstraint activateConstraints: regularConstraints];
                NSLayoutConstraint.activateConstraints(regularConstraints)
//        }
            }
//    }
        }
//}
    }
//
//MARK: - Animations
//
//- (void)changeLayout:(UITapGestureRecognizer *)tapGesture {
    func changeLayout(tapGesture: UITapGestureRecognizer) {
    /* When screen is double-tapped, toggle between layouts and animate the change using UIView animation. */
//    if (tapGesture.state == UIGestureRecognizerStateEnded) {
        if tapGesture.state == UIGestureRecognizerState.Ended {
//        NSLayoutConstraint *regularConstraint = regularConstraints.firstObject;
            let regularConstraint = regularConstraints.first!
//        NSLayoutConstraint *compactConstraint = compactConstraints.firstObject;
            let compactConstraint = compactConstraints.first!
//        if (regularConstraint.active) {
            if regularConstraint.active {
//            [UIView animateWithDuration: 1.0
                UIView.animateWithDuration(1.0) {
//                             animations:^{
//                                 [NSLayoutConstraint deactivateConstraints: regularConstraints];
                    NSLayoutConstraint.deactivateConstraints(self.regularConstraints)
//                                 [NSLayoutConstraint activateConstraints: compactConstraints];
                    NSLayoutConstraint.activateConstraints(self.compactConstraints)
//                                 [self.view layoutIfNeeded];
                    self.view.layoutIfNeeded()
//                             }];
                }
//        }
//        else if (compactConstraint.active) {
            } else if compactConstraint.active {
//            [UIView animateWithDuration: 1.0
                UIView.animateWithDuration(1.0) {
//                             animations:^{
//                                 [NSLayoutConstraint deactivateConstraints: compactConstraints];
                    NSLayoutConstraint.deactivateConstraints(self.compactConstraints)
//                                 [NSLayoutConstraint activateConstraints: regularConstraints];
                    NSLayoutConstraint.activateConstraints(self.regularConstraints)
//                                 [self.view layoutIfNeeded];
                    self.view.layoutIfNeeded()
//                             }];
                }
//        }
            }
//    }
        }
//}
    }
//
//
//- (void)keyframeBasedLayoutChange:(UITapGestureRecognizer *)twoFingerDoubleTap {
    func keyframeBasedLayoutChange(twoFingerDoubleTap: UITapGestureRecognizer) {
    /* Keyframe animations give more control over how the transition looks. The different timings create different effects.
     If the control doesn't need to be this fine-grained, keeping a reference to the entire array of constraints is enough, as shown with the other tap gesture.
     Try adjusting the timing and options of the constraint changes and see how that affects the animation. */
//    if (twoFingerDoubleTap.state == UIGestureRecognizerStateEnded) {
        if twoFingerDoubleTap.state == UIGestureRecognizerState.Ended {
//        NSLayoutConstraint *regularConstraint = regularConstraints.firstObject;
            let regularConstraint = regularConstraints.first!
//        NSLayoutConstraint *compactConstraint = compactConstraints.firstObject;
            let compactConstraint = compactConstraints.first!
//        if (regularConstraint.active) {
            if regularConstraint.active {
//            [UIView animateKeyframesWithDuration: 1.5
                UIView.animateKeyframesWithDuration(1.5,
//                                           delay: 0.0
                    delay: 0.0,
//                                         options: UIViewKeyframeAnimationOptionCalculationModeLinear
                    options: UIViewKeyframeAnimationOptions.CalculationModeLinear,
//                                      animations:^{
                    animations: {
//                                          [self animateToCompact];
                        self.animateToCompact()
//                                      }
                    },
//                                      completion:^(BOOL finished) {
                    completion: {finished in
//
//                                      }];
                    })
//        }
//        else if (compactConstraint.active) {
            } else if compactConstraint.active {
//            [UIView animateKeyframesWithDuration: 1.5
                UIView.animateKeyframesWithDuration(1.5,
//                                           delay: 0.0
                    delay: 0.0,
//                                         options: UIViewKeyframeAnimationOptionCalculationModeLinear
                    options: UIViewKeyframeAnimationOptions.CalculationModeLinear,
//                                      animations:^{
                    animations: {
//                                          [self animateToRegular];
                        self.animateToRegular()
//                                      }
                    },
//                                      completion:^(BOOL finished) {
                    completion: {finished in
//
//                                      }];
                    })
//        }
            }
//    }
        }
//}
    }
//
//
//- (void)animateToRegular {
    private func animateToRegular() {
    /* For this set of animations, compact constraints (vertical line of planets) are deactivated and regular constraints (arc of planets) activated in small groups. All animations start at the same time but then take variable amounts of time to finish, leading to a wave effect. Change the durations or relative start times to see different effects.
     This is called from -keyframeBasedLayoutChange:. */
//    [UIView addKeyframeWithRelativeStartTime: 0.0
        UIView.addKeyframeWithRelativeStartTime(0.0, relativeDuration: 1.0) {
//                            relativeDuration: 1.0
//                                  animations:^{
//                                      [NSLayoutConstraint deactivateConstraints: @[mercuryCenter]];
            NSLayoutConstraint.deactivateConstraints([self.mercuryCenter])
//                                      [NSLayoutConstraint activateConstraints: @[mercuryLeadingToTrailing]];
            NSLayoutConstraint.activateConstraints([self.mercuryLeadingToTrailing])
//                                      [self.view layoutIfNeeded];
            self.view.layoutIfNeeded()
//                                  }];
        }
//    [UIView addKeyframeWithRelativeStartTime: 0.0
        UIView.addKeyframeWithRelativeStartTime(0.0, relativeDuration: 0.9) {
//                            relativeDuration: 0.9
//                                  animations:^{
//                                      [NSLayoutConstraint deactivateConstraints: @[venusCenter, neptuneCenter]];
            NSLayoutConstraint.deactivateConstraints([self.venusCenter, self.neptuneCenter])
//                                      [NSLayoutConstraint activateConstraints: @[venusLeadingToTrailing, neptuneLeadingToTrailing]];
            NSLayoutConstraint.activateConstraints([self.venusLeadingToTrailing, self.neptuneLeadingToTrailing])
//                                      [self.view layoutIfNeeded];
            self.view.layoutIfNeeded()
//                                  }];
        }
//    [UIView addKeyframeWithRelativeStartTime: 0.0
        UIView.addKeyframeWithRelativeStartTime(0.0, relativeDuration: 0.7) {
//                            relativeDuration: 0.7
//                                  animations:^{
//                                      [NSLayoutConstraint deactivateConstraints: @[earthCenter, uranusCenter]];
            NSLayoutConstraint.deactivateConstraints([self.earthCenter, self.uranusCenter])
//                                      [NSLayoutConstraint activateConstraints: @[earthLeadingToTrailing, uranusLeadingToTrailing]];
            NSLayoutConstraint.activateConstraints([self.earthLeadingToTrailing, self.uranusLeadingToTrailing])
//                                      [self.view layoutIfNeeded];
            self.view.layoutIfNeeded()
//                                  }];
        }
//    [UIView addKeyframeWithRelativeStartTime: 0.0
        UIView.addKeyframeWithRelativeStartTime(0.0, relativeDuration: 0.5) {
//                            relativeDuration: 0.5
//                                  animations:^{
//                                      [NSLayoutConstraint deactivateConstraints: @[marsCenter, jupiterCenter, saturnCenter]];
            NSLayoutConstraint.deactivateConstraints([self.marsCenter, self.jupiterCenter, self.saturnCenter])
//                                      [NSLayoutConstraint activateConstraints: @[marsLeadingToTrailing, jupiterLeadingToTrailing, saturnLeadingToTrailing]];
            NSLayoutConstraint.activateConstraints([self.marsLeadingToTrailing, self.jupiterLeadingToTrailing, self.saturnLeadingToTrailing])
//                                      [self.view layoutIfNeeded];
            self.view.layoutIfNeeded()
//                                  }];
        }
//}
    }
//
//- (void)animateToCompact {
    private func animateToCompact() {
//    /* For this set of animations, regular constraints (arc view) are deactivated and compact constraints (vertical line of planets) activated in small groups. The animations start slightly after one another, leading to a 'pulling inward' animation effect. Change the durations or relative start times to see different effects.
//     This is called from -keyframeBasedLayoutChange:. */
//    [UIView addKeyframeWithRelativeStartTime: 0.0
        UIView.addKeyframeWithRelativeStartTime(0.0, relativeDuration: 1.0) {
//                            relativeDuration: 1.0
//                                  animations:^{
//                                      [NSLayoutConstraint deactivateConstraints: @[marsLeadingToTrailing, jupiterLeadingToTrailing, saturnLeadingToTrailing]];
            NSLayoutConstraint.deactivateConstraints([self.marsLeadingToTrailing, self.jupiterLeadingToTrailing, self.saturnLeadingToTrailing])
//                                      [NSLayoutConstraint activateConstraints: @[marsCenter, jupiterCenter, saturnCenter]];
            NSLayoutConstraint.activateConstraints([self.marsCenter, self.jupiterCenter, self.saturnCenter])
//                                      [self.view layoutIfNeeded];
            self.view.layoutIfNeeded()
//                                  }];
        }
//    [UIView addKeyframeWithRelativeStartTime: 0.1
        UIView.addKeyframeWithRelativeStartTime(0.1, relativeDuration: 0.9) {
//                            relativeDuration: 0.9
//                                  animations:^{
//                                      [NSLayoutConstraint deactivateConstraints: @[earthLeadingToTrailing, uranusLeadingToTrailing]];
            NSLayoutConstraint.deactivateConstraints([self.earthLeadingToTrailing, self.uranusLeadingToTrailing])
//                                      [NSLayoutConstraint activateConstraints: @[earthCenter, uranusCenter]];
            NSLayoutConstraint.activateConstraints([self.earthCenter, self.uranusCenter])
//                                      [self.view layoutIfNeeded];
            self.view.layoutIfNeeded()
//                                  }];
        }
//    [UIView addKeyframeWithRelativeStartTime: 0.3
        UIView.addKeyframeWithRelativeStartTime(0.3, relativeDuration: 0.7) {
//                            relativeDuration: 0.7
//                                  animations:^{
//                                      [NSLayoutConstraint deactivateConstraints: @[venusLeadingToTrailing, neptuneLeadingToTrailing]];
            NSLayoutConstraint.deactivateConstraints([self.venusLeadingToTrailing, self.neptuneLeadingToTrailing])
//                                      [NSLayoutConstraint activateConstraints: @[venusCenter, neptuneCenter]];
            NSLayoutConstraint.activateConstraints([self.venusCenter, self.neptuneCenter])
//                                      [self.view layoutIfNeeded];
            self.view.layoutIfNeeded()
//                                  }];
        }
//    [UIView addKeyframeWithRelativeStartTime: 0.5
        UIView.addKeyframeWithRelativeStartTime(0.5, relativeDuration: 0.5) {
//                            relativeDuration: 0.5
//                                  animations:^{
//                                      [NSLayoutConstraint deactivateConstraints: @[mercuryLeadingToTrailing]];
            NSLayoutConstraint.deactivateConstraints([self.mercuryLeadingToTrailing])
//                                      [NSLayoutConstraint activateConstraints: @[mercuryCenter]];
            NSLayoutConstraint.activateConstraints([self.mercuryCenter])
//                                      [self.view layoutIfNeeded];
            self.view.layoutIfNeeded()
//                                  }];
        }
//
//}
    }
//
//MARK: - Gestures for animation
//
//- (void)setUpGestures {
    private func setUpGestures() {
    /* Double-tap will trigger the 'basic' layout animation. Double-tapping with two fingers (hold down option in the simulator to get multiple fingers) will trigger the keyframe animation. */
//    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget: self
//                                                                                action: @selector(changeLayout:)];
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(AAPLViewController.changeLayout(_:)))
//    doubleTap.numberOfTapsRequired = 2;
        doubleTap.numberOfTapsRequired = 2
//    doubleTap.numberOfTouchesRequired = 1;
        doubleTap.numberOfTouchesRequired = 1
//    [self.view addGestureRecognizer: doubleTap];
        self.view.addGestureRecognizer(doubleTap)
//
//    UITapGestureRecognizer *twoFingerDoubleTap = [[UITapGestureRecognizer alloc] initWithTarget: self
//                                                                                         action: @selector(keyframeBasedLayoutChange:)];
        let twoFingerDoubleTap = UITapGestureRecognizer(target: self, action: #selector(AAPLViewController.keyframeBasedLayoutChange(_:)))
//    twoFingerDoubleTap.numberOfTapsRequired = 2;
        twoFingerDoubleTap.numberOfTapsRequired = 2
//    twoFingerDoubleTap.numberOfTouchesRequired = 2;
        twoFingerDoubleTap.numberOfTouchesRequired = 2
//    [self.view addGestureRecognizer: twoFingerDoubleTap];
        self.view.addGestureRecognizer(twoFingerDoubleTap)
//}
    }
//
//@end
}