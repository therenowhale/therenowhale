from pathlib import Path
from html import escape

root = Path(__file__).parent
assets = root/'img/identity'
assets.mkdir(parents=True, exist_ok=True)
cream, orange, ink, green = '#F4F0E6', '#FF4D00', '#11120F', '#183729'
def text(x,y,label,size=20,color=ink,serif=False,extra=''):
    font='Georgia, Times New Roman, serif' if serif else 'Arial, Helvetica, sans-serif'
    return f'<text x="{x}" y="{y}" fill="{color}" font-size="{size}" font-family="{font}" {extra}>{escape(label)}</text>'
def svg(name,h,body,bg=cream,w=1200):
    (assets/name).write_text(f'<svg xmlns="http://www.w3.org/2000/svg" width="{w}" height="{h}" viewBox="0 0 {w} {h}"><rect width="{w}" height="{h}" fill="{bg}"/>{body}</svg>')
def rule(y):return f'<path d="M40 {y}H1160" stroke="{ink}" stroke-width="1"/>'
for filename,label,index in [('projects.svg','EXPLORE MY PROJECTS','01'),('labs.svg','SWAGA LABS','02')]:
    svg(filename,92,text(24,55,index,15)+text(68,57,label,22,extra='font-weight="700"')+text(430,60,'↗',30),orange,480)

b=text(40,38,'01 / ENGINEERING TOOLKIT',15,extra='letter-spacing="2"')+rule(61)
b+=text(40,125,'From the JVM to the cloud.',56,orange,True)
groups=[('APPLICATIONS',['Java 21+ / Kotlin','Spring Boot','Maven / Gradle']),('PLATFORM',['AWS / Kubernetes','Docker / Terraform','GitHub Actions']),('DATA & VISIBILITY',['PostgreSQL / Redis','Apache Kafka','Prometheus / Grafana'])]
for i,(title,items) in enumerate(groups):
    x=40+i*390
    b+=text(x,193,title,16,orange,extra='letter-spacing="1.5"')
    for j,item in enumerate(items):b+=text(x,239+j*39,item,23)
svg('toolkit.svg',365,b)

b=text(40,38,'02 / HOW I LEARN',15,cream,extra='letter-spacing="2"')
b+=text(40,119,'Understanding is earned by doing.',51,orange,True)
for i,(title,caption) in enumerate([('Build','Start with a real experiment.'),('Observe','Look at what actually happens.'),('Explain','Understand why it works.')]):
    x=40+i*390
    b+=text(x,188,f'0{i+1}',16,orange)+text(x,236,title,35,cream)+text(x,279,caption,19,cream)
    if i<2:b+=text(x+330,236,'→',30,orange)
b+=text(40,338,'QUESTION ASSUMPTIONS. SHARE THE PROCESS.',14,cream,extra='letter-spacing="2"')
svg('learning.svg',375,b,green)

b=text(40,66,'STAY CURIOUS. MAKE THINGS.',24,cream,extra='letter-spacing="2"')+text(936,65,'THERE NO WHALE',15,cream)
svg('footer.svg',112,b,ink)

for filename,number,title,subtitle,detail,bg,fg in [
    ('project-swagalabs.svg','01 / COLLECTIVE','Swaga Labs','Independent products. Shared curiosity.','SOFTWARE / EXPERIMENTS',orange,ink),
    ('project-murhub.svg','02 / PRODUCT','Murhub','Beauty. People. Discovery.','KOTLIN / PRODUCT ENGINEERING',green,cream),
    ('project-whale.svg','03 / LEARNING','There No Whale','Learn in public. Think for yourself.','JAVA / PRACTICE / COMMUNITY',cream,ink)]:
    b=text(32,38,number,13,fg,extra='letter-spacing="2"')
    b+=text(32,118,title,53,fg,True)+text(32,164,subtitle,19,fg)
    b+=text(32,226,detail,12,fg,extra='letter-spacing="1.5"')+text(516,226,'↗',29,fg)
    svg(filename,260,b,bg,580)

b=text(40,40,'03 / SYSTEMS I WORK WITH',15,extra='letter-spacing="2"')
nodes=[(40,100,250,'APPLICATION','Java / Kotlin / Spring'),(475,100,250,'EVENTS','Kafka'),(910,100,250,'DATA','PostgreSQL / Redis'),(475,260,250,'PLATFORM','AWS / Kubernetes')]
for x,y,w,title,caption in nodes:
    b+=f'<rect x="{x}" y="{y}" width="{w}" height="108" rx="2" fill="{green}"/>'
    b+=text(x+20,y+38,title,15,cream)+text(x+20,y+76,caption,18,cream)
b+=f'<path d="M290 154H475M725 154H910M600 208V260" stroke="{orange}" stroke-width="3" fill="none"/>'
b+=text(335,140,'publish',13)+text(785,140,'persist',13)+text(620,240,'deploy & operate',13)
b+=text(40,409,'A conceptual toolkit map — project architecture depends on the problem.',17)
svg('systems.svg',445,b)

b=text(40,40,'04 / THE PRINCIPLE',15,cream,extra='letter-spacing="2"')
b+=text(40,120,'No single authority.',64,orange,True)+text(40,191,'Keep asking why.',64,cream,True)
b+=text(40,252,'Experiment. Read the source. Form your own understanding.',21,cream)
svg('manifesto.svg',295,b,ink)

star='<path d="M256 70Q270 242 442 256Q270 270 256 442Q242 270 70 256Q242 242 256 70Z" fill="#F4F0E6"/>'
svg('avatar.svg',512,star,orange,512)
