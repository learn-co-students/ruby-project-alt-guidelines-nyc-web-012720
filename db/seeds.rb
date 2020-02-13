#Designers (name)
gucci = Designer.create(name: "Gucci")
tomford = Designer.create(name: "Tom Ford")
chanel = Designer.create(name: "Chanel")
armani = Designer.create(name: "Giorgio Armani")
dior = Designer.create(name: "Christian Dior")
odlr = Designer.create(name: "Oscar de la Renta")
karl = Designer.create(name: "Karl Lagerfeld")


#Muses (name, height)
gigi = Muse.create(name: "Gigi Hadid", height:70)
cara = Muse.create(name: "Cara Delevingne", height:68)
kendall = Muse.create(name: "Kendall Jenner", height:70)
zendaya = Muse.create(name: "Zendaya", height:70)
heidi = Muse.create(name: "Heidi Klum", height:69)
tyra = Muse.create(name: "Tyra Banks", height:70)
kaia = Muse.create(name: "Kaia Jordan Gerber", height:69)
naomi = Muse.create(name: "Naomi Campbell", height:70)
karlie = Muse.create(name: "Karlie Kloss", height:72)
sara = Muse.create(name: "Sara Sampaio", height:68)


#FashionShows (designer_id)
# fs1 = FashionShow.create
# fs1.designer = gucci
# fs1.save
spring1 = FashionShow.create(season: "Spring", designer_id: gucci.id)
spring2 = FashionShow.create(season: "Spring", designer_id: dior.id)
spring3 = FashionShow.create(season: "Spring", designer_id: odlr.id)
spring4 = FashionShow.create(season: "Spring", designer_id: chanel.id)
spring5 = FashionShow.create(season: "Spring", designer_id: karl.id)

summer1 = FashionShow.create(season: "Summer", designer_id: armani.id)
summer2 = FashionShow.create(season: "Summer", designer_id: tomford.id)
summer3 = FashionShow.create(season: "Summer", designer_id: gucci.id)

fall1 = FashionShow.create(season: "Fall", designer_id: chanel.id)
fall2 = FashionShow.create(season: "Fall", designer_id: odlr.id)
fall3 = FashionShow.create(season: "Fall", designer_id: dior.id)
fall4 = FashionShow.create(season: "Fall", designer_id: tomford.id)
fall5 = FashionShow.create(season: "Fall", designer_id: karl.id)

winter1 = FashionShow.create(season: "Winter", designer_id: karl.id)
winter2 = FashionShow.create(season: "Winter", designer_id: dior.id)
winter3 = FashionShow.create(season: "Winter", designer_id: odlr.id)



#FashionShowMuses (muse_id, fashion_show_id)
# fm1 = FashionShowMuse.create
# fm1.fashion_show = f1 
# fm1.muse = gigi 
# fm1.save

fm1 = FashionShowMuse.create(muse_id: gigi.id, fashion_show_id: spring1.id)
fm2 = FashionShowMuse.create(muse_id: kendall.id, fashion_show_id: spring1.id)
fm3 = FashionShowMuse.create(muse_id: naomi.id, fashion_show_id: spring1.id)
fm4 = FashionShowMuse.create(muse_id: cara.id, fashion_show_id: spring1.id)
fm5 = FashionShowMuse.create(muse_id: kaia.id, fashion_show_id: spring1.id)
fm6 = FashionShowMuse.create(muse_id: karlie.id, fashion_show_id: spring1.id)

fm7 = FashionShowMuse.create(muse_id: zendaya.id, fashion_show_id: spring2.id)
fm8 = FashionShowMuse.create(muse_id: cara.id, fashion_show_id: spring2.id)
fm9 = FashionShowMuse.create(muse_id: kendall.id, fashion_show_id: spring2.id)
fm10 = FashionShowMuse.create(muse_id: gigi.id, fashion_show_id: spring2.id)
fm11 = FashionShowMuse.create(muse_id: sara.id, fashion_show_id: spring2.id)
fm12 = FashionShowMuse.create(muse_id: kaia.id, fashion_show_id: spring2.id)

fm13 = FashionShowMuse.create(muse_id: tyra.id, fashion_show_id: spring3.id)
fm14 = FashionShowMuse.create(muse_id: heidi.id, fashion_show_id: spring3.id)
fm15 = FashionShowMuse.create(muse_id: zendaya.id, fashion_show_id: spring3.id)
fm16 = FashionShowMuse.create(muse_id: naomi.id, fashion_show_id: spring3.id)
fm17 = FashionShowMuse.create(muse_id: kendall.id, fashion_show_id: spring3.id)
fm18 = FashionShowMuse.create(muse_id: gigi.id, fashion_show_id: spring3.id)

fm19 = FashionShowMuse.create(muse_id: heidi.id, fashion_show_id: spring4.id)
fm20 = FashionShowMuse.create(muse_id: tyra.id, fashion_show_id: spring4.id)
fm21 = FashionShowMuse.create(muse_id: sara.id, fashion_show_id: spring4.id)
fm22 = FashionShowMuse.create(muse_id: kaia.id, fashion_show_id: spring4.id)
fm23 = FashionShowMuse.create(muse_id: karlie.id, fashion_show_id: spring4.id)
fm24 = FashionShowMuse.create(muse_id: gigi.id, fashion_show_id: spring4.id)

fm25 = FashionShowMuse.create(muse_id: cara.id, fashion_show_id: spring5.id)
fm26 = FashionShowMuse.create(muse_id: sara.id, fashion_show_id: spring5.id)
fm27 = FashionShowMuse.create(muse_id: tyra.id, fashion_show_id: spring5.id)
fm28 = FashionShowMuse.create(muse_id: zendaya.id, fashion_show_id: spring5.id)
fm29 = FashionShowMuse.create(muse_id: kaia.id, fashion_show_id: spring5.id)
fm30 = FashionShowMuse.create(muse_id: heidi.id, fashion_show_id: spring5.id)

fm31 = FashionShowMuse.create(muse_id: gigi.id, fashion_show_id: summer1.id)
fm32 = FashionShowMuse.create(muse_id: kendall.id, fashion_show_id: summer1.id)
fm33 = FashionShowMuse.create(muse_id: zendaya.id, fashion_show_id: summer1.id)
fm34 = FashionShowMuse.create(muse_id: tyra.id, fashion_show_id: summer1.id)
fm35 = FashionShowMuse.create(muse_id: naomi.id, fashion_show_id: summer1.id)
fm36 = FashionShowMuse.create(muse_id: karlie.id, fashion_show_id: summer1.id)

fm37 = FashionShowMuse.create(muse_id: sara.id, fashion_show_id: summer2.id)
fm38 = FashionShowMuse.create(muse_id: cara.id, fashion_show_id: summer2.id)
fm39 = FashionShowMuse.create(muse_id: heidi.id, fashion_show_id: summer2.id)
fm40 = FashionShowMuse.create(muse_id: kaia.id, fashion_show_id: summer2.id)
fm41 = FashionShowMuse.create(muse_id: kendall.id, fashion_show_id: summer2.id)
fm42 = FashionShowMuse.create(muse_id: gigi.id, fashion_show_id: summer2.id)

fm43 = FashionShowMuse.create(muse_id: gigi.id, fashion_show_id: summer3.id)
fm44 = FashionShowMuse.create(muse_id: kendall.id, fashion_show_id: summer3.id)
fm45 = FashionShowMuse.create(muse_id: cara.id, fashion_show_id: summer3.id)
fm46 = FashionShowMuse.create(muse_id: zendaya.id, fashion_show_id: summer3.id)
fm47 = FashionShowMuse.create(muse_id: naomi.id, fashion_show_id: summer3.id)
fm48 = FashionShowMuse.create(muse_id: sara.id, fashion_show_id: summer3.id)

fm49 = FashionShowMuse.create(muse_id: tyra.id, fashion_show_id: fall1.id)
fm50 = FashionShowMuse.create(muse_id: heidi.id, fashion_show_id: fall1.id)
fm51 = FashionShowMuse.create(muse_id: karlie.id, fashion_show_id: fall1.id)
fm52 = FashionShowMuse.create(muse_id: cara.id, fashion_show_id: fall1.id)
fm53 = FashionShowMuse.create(muse_id: kaia.id, fashion_show_id: fall1.id)
fm54 = FashionShowMuse.create(muse_id: gigi.id, fashion_show_id: fall1.id)

fm55 = FashionShowMuse.create(muse_id: heidi.id, fashion_show_id: fall2.id)
fm56 = FashionShowMuse.create(muse_id: zendaya.id, fashion_show_id: fall2.id)
fm57 = FashionShowMuse.create(muse_id: kendall.id, fashion_show_id: fall2.id)
fm58 = FashionShowMuse.create(muse_id: tyra.id, fashion_show_id: fall2.id)
fm59 = FashionShowMuse.create(muse_id: sara.id, fashion_show_id: fall2.id)
fm60 = FashionShowMuse.create(muse_id: naomi.id, fashion_show_id: fall2.id)

fm61 = FashionShowMuse.create(muse_id: sara.id, fashion_show_id: fall3.id)
fm62 = FashionShowMuse.create(muse_id: karlie.id, fashion_show_id: fall3.id)
fm63 = FashionShowMuse.create(muse_id: naomi.id, fashion_show_id: fall3.id)
fm64 = FashionShowMuse.create(muse_id: kaia.id, fashion_show_id: fall3.id)
fm65 = FashionShowMuse.create(muse_id: tyra.id, fashion_show_id: fall3.id)
fm66 = FashionShowMuse.create(muse_id: heidi.id, fashion_show_id: fall3.id)

fm67 = FashionShowMuse.create(muse_id: zendaya.id, fashion_show_id: fall4.id)
fm68 = FashionShowMuse.create(muse_id: kendall.id, fashion_show_id: fall4.id)
fm69 = FashionShowMuse.create(muse_id: cara.id, fashion_show_id: fall4.id)
fm70 = FashionShowMuse.create(muse_id: gigi.id, fashion_show_id: fall4.id)
fm71 = FashionShowMuse.create(muse_id: sara.id, fashion_show_id: fall4.id)
fm72 = FashionShowMuse.create(muse_id: karlie.id, fashion_show_id: fall4.id)

fm73 = FashionShowMuse.create(muse_id: gigi.id, fashion_show_id: fall5.id)
fm74 = FashionShowMuse.create(muse_id: kendall.id, fashion_show_id: fall5.id)
fm75 = FashionShowMuse.create(muse_id: heidi.id, fashion_show_id: fall5.id)
fm76 = FashionShowMuse.create(muse_id: kaia.id, fashion_show_id: fall5.id)
fm77 = FashionShowMuse.create(muse_id: karlie.id, fashion_show_id: fall5.id)
fm78 = FashionShowMuse.create(muse_id: tyra.id, fashion_show_id: fall5.id)

fm79 = FashionShowMuse.create(muse_id: cara.id, fashion_show_id: winter1.id)
fm80 = FashionShowMuse.create(muse_id: zendaya.id, fashion_show_id: winter1.id)
fm81 = FashionShowMuse.create(muse_id: tyra.id, fashion_show_id: winter1.id)
fm82 = FashionShowMuse.create(muse_id: naomi.id, fashion_show_id: winter1.id)
fm83 = FashionShowMuse.create(muse_id: sara.id, fashion_show_id: winter1.id)
fm84 = FashionShowMuse.create(muse_id: karlie.id, fashion_show_id: winter1.id)

fm85 = FashionShowMuse.create(muse_id: zendaya.id, fashion_show_id: winter2.id)
fm86 = FashionShowMuse.create(muse_id: gigi.id, fashion_show_id: winter2.id)
fm87 = FashionShowMuse.create(muse_id: sara.id, fashion_show_id: winter2.id)
fm88 = FashionShowMuse.create(muse_id: karlie.id, fashion_show_id: winter2.id)
fm89 = FashionShowMuse.create(muse_id: kendall.id, fashion_show_id: winter2.id)
fm90 = FashionShowMuse.create(muse_id: kaia.id, fashion_show_id: winter2.id)

fm91 = FashionShowMuse.create(muse_id: cara.id, fashion_show_id: winter3.id)
fm92 = FashionShowMuse.create(muse_id: gigi.id, fashion_show_id: winter3.id)
fm93 = FashionShowMuse.create(muse_id: heidi.id, fashion_show_id: winter3.id)
fm94 = FashionShowMuse.create(muse_id: kaia.id, fashion_show_id: winter3.id)
fm95 = FashionShowMuse.create(muse_id: karlie.id, fashion_show_id: winter3.id)
fm96 = FashionShowMuse.create(muse_id: kendall.id, fashion_show_id: winter3.id)