import AppKit

let root = URL(fileURLWithPath: CommandLine.arguments.count > 1 ? CommandLine.arguments[1] : "img/editorial", isDirectory: true)
try FileManager.default.createDirectory(at: root, withIntermediateDirectories: true)
let orange = NSColor(srgbRed: 1, green: 0.302, blue: 0, alpha: 1)
let ink = NSColor(srgbRed: 0.055, green: 0.055, blue: 0.05, alpha: 1)
let ivory = NSColor(srgbRed: 0.957, green: 0.941, blue: 0.902, alpha: 1)
let blue = NSColor(srgbRed: 0.35, green: 0.55, blue: 0.65, alpha: 1)
func rect(_ x: CGFloat, _ y: CGFloat, _ w: CGFloat, _ h: CGFloat, _ c: NSColor) { c.setFill(); NSRect(x:x,y:y,width:w,height:h).fill() }
func text(_ s: String, _ x: CGFloat, _ y: CGFloat, _ size: CGFloat, _ color: NSColor, bold: Bool = false) {
    let font = NSFont(name: bold ? "HelveticaNeue-Bold" : "HelveticaNeue", size: size) ?? NSFont.systemFont(ofSize:size)
    (s as NSString).draw(at:NSPoint(x:x,y:y), withAttributes:[.font:font,.foregroundColor:color])
}
func line(_ x: CGFloat, _ y: CGFloat, _ w: CGFloat, _ color: NSColor) { rect(x,y,w,1,color) }
func star(_ x: CGFloat, _ y: CGFloat, _ size: CGFloat, _ color: NSColor) {
    let p = NSBezierPath(); p.move(to:NSPoint(x:x,y:y+size))
    for q in [NSPoint(x:x+size*0.17,y:y+size*0.17), NSPoint(x:x+size,y:y), NSPoint(x:x+size*0.17,y:y-size*0.17),NSPoint(x:x,y:y-size),NSPoint(x:x-size*0.17,y:y-size*0.17),NSPoint(x:x-size,y:y),NSPoint(x:x-size*0.17,y:y+size*0.17)] { p.line(to:q) }
    p.close();color.setFill();p.fill()
}
func canvas(_ name: String, _ w: Int, _ h: Int, _ bg: NSColor, _ body: () -> Void) {
    let rep = NSBitmapImageRep(bitmapDataPlanes:nil,pixelsWide:w,pixelsHigh:h,bitsPerSample:8,samplesPerPixel:4,hasAlpha:true,isPlanar:false,colorSpaceName:.deviceRGB,bytesPerRow:0,bitsPerPixel:0)!
    NSGraphicsContext.saveGraphicsState(); NSGraphicsContext.current = NSGraphicsContext(bitmapImageRep:rep)
    rect(0,0,CGFloat(w),CGFloat(h),bg);body();NSGraphicsContext.restoreGraphicsState()
    try! rep.representation(using:.png,properties:[:])!.write(to:root.appendingPathComponent(name+".png"))
}
for (name,label,n) in [("button-code","SOURCE CODE","01"),("button-labs","SWAGA LABS","02"),("button-murhub","MURHUB / UI","03")] {
    canvas(name,600,112,orange) {
        text(n,24,45,16,ink);text(label,75,39,27,ink,bold:true);text("↗",538,32,38,ink)
        line(24,20,552,ink)
    }
}
canvas("masthead",1400,100,ivory) {
    text("THERE NO WHALE",28,40,22,ink,bold:true);text("INDEPENDENT ENGINEERING JOURNAL",365,42,16,ink)
    text("BY MIHKIHTAH",1160,42,16,ink);line(28,23,1344,ink)
}
for (name,n,label) in [("divider-engineering","01","ENGINEERING / THE TOOLKIT"),("divider-experiments","02","EXPERIMENTS / THE PROCESS"),("divider-lab","03","IN THE LAB / SELECTED PROJECTS")] {
    canvas(name,1400,96,ink) {
        text(n,28,33,25,orange,bold:true);text(label,100,35,23,ivory,bold:true);star(1340,48,22,orange)
    }
}
canvas("toolkit",1400,370,ivory) {
    text("ENGINEERING TOOLKIT.",34,295,46,ink,bold:true);line(34,270,1332,ink)
    let columns:[(String,[String])] = [("APPLICATIONS",["Java 21+ / Kotlin","Spring Boot","Maven / Gradle"]),("PLATFORM",["AWS / Kubernetes","Docker / Terraform","GitHub Actions"]),("DATA & VISIBILITY",["PostgreSQL / Redis","Apache Kafka","Prometheus / Grafana"])]
    for (i,c) in columns.enumerated() {
        let x = CGFloat(34+i*460);text(c.0,x,220,20,orange,bold:true)
        for (j,t) in c.1.enumerated() {text(t,x,170-CGFloat(j*47),27,ink)}
    }
}
canvas("process",1400,285,orange) {
    text("UNDERSTANDING IS EARNED BY DOING.",34,218,36,ink,bold:true)
    for (i,c) in [("BUILD","Start with an experiment."),("OBSERVE","Look at what happens."),("EXPLAIN","Understand why it works.")].enumerated() {
        let x = CGFloat(34+i*460);line(x,190,390,ink);text("0\(i+1)",x,155,17,ink);text(c.0,x,95,40,ink,bold:true);text(c.1,x,51,23,ink)
    }
}
canvas("colophon",1400,180,ink) {
    text("QUESTION ASSUMPTIONS.",34,105,42,ivory,bold:true);text("BUILD THINGS. SHARE THE PROCESS.",36,54,24,orange,bold:true)
    text("@therenowhale / Mihkihtah",1030,31,19,ivory);star(1325,119,28,orange)
}
canvas("waterline",1400,42,blue) {
    for i in 0..<22 {star(CGFloat(i*67+15),21,8,ivory)}
}
print("Exported editorial PNG controls and infographics.")
