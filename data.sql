use mydb;

-- Type

INSERT INTO Type 
VALUES
(1, "Normal"),
(2, "Fire"),
(3, "Water"),
(4, "Grass"),
(5, "Electric"),
(6, "Ice"),
(7, "Fighting"),
(8, "Poison"),
(9, "Ground"),
(10, "Flying"),
(11, "Psychic"),
(12, "Bug"),
(13, "Rock"),
(14, "Ghost"),
(15, "Dragon"),
(16, "Dark"),
(17, "Steel"),
(18, "Fairy");

-- Type vs Type

-- Definimos una variable para el valor base
SET @base_value = 1.0;

-- Insertamos los valores de la relación entre cada par de tipos en la tabla "type_vs_type"
INSERT INTO Type_vs_Type (`Type_idType`, `Type_idType1`, `value`)
SELECT t1.idType, t2.idType, IFNULL((@base_value * 
    CASE
        WHEN t1.name = "Normal" THEN
            CASE
                WHEN t2.name IN ("Rock", "Steel") THEN 0.5
                WHEN t2.name = "Ghost" THEN 0
                ELSE 1
            END
        WHEN t1.name = "Fire" THEN
            CASE
                WHEN t2.name IN ("Fire", "Water", "Rock", "Dragon") THEN 0.5
                WHEN t2.name IN ("Grass", "Ice", "Bug", "Steel") THEN 2
                WHEN t2.name = "Fire" THEN 0.5
                ELSE 1
            END
        WHEN t1.name = "Water" THEN
            CASE
                WHEN t2.name IN ("Water", "Grass", "Dragon") THEN 0.5
                WHEN t2.name IN ("Fire", "Ground", "Rock") THEN 2
                ELSE 1
            END
        WHEN t1.name = "Grass" THEN
            CASE
                WHEN t2.name IN ("Fire", "Grass", "Poison", "Flying", "Bug", "Dragon", "Steel") THEN 0.5
                WHEN t2.name IN ("Water", "Ground", "Rock") THEN 2
                ELSE 1
            END
        WHEN t1.name = "Electric" THEN
            CASE
                WHEN t2.name IN ("Electric", "Grass", "Dragon") THEN 0.5
                WHEN t2.name IN ("Water", "Flying") THEN 2
                WHEN t2.name = "Ground" THEN 0
                ELSE 1
            END
        WHEN t1.name = "Ice" THEN
            CASE
                WHEN t2.name IN ("Fire", "Water", "Ice", "Steel") THEN 0.5
                WHEN t2.name IN ("Grass", "Ground", "Flying", "Dragon") THEN 2
                ELSE 1
            END
        WHEN t1.name = "Fighting" THEN
            CASE
                WHEN t2.name IN ("Poison", "Flying", "Psychic", "Bug", "Fairy") THEN 0.5
                WHEN t2.name IN ("Normal", "Ice", "Rock", "Dark", "Steel") THEN 2
                WHEN t2.name = "Ghost" THEN 0
                ELSE 1
            END
        WHEN t1.name = "Poison" THEN
            CASE
                WHEN t2.name IN ("Steel") THEN 0
				WHEN t2.name IN ("Grass", "Fairy") THEN 2
				WHEN t2.name IN ("Poison", "Psychic", "Ground", "Ghost") THEN 0.5
				ELSE 1
			END
		WHEN t1.name = "Ground" THEN
			CASE
				WHEN t2.name IN ("Grass", "Bug") THEN 0.5
				WHEN t2.name IN ("Fire", "Electric", "Poison", "Rock", "Steel") THEN 2
				WHEN t2.name = "Flying" THEN 0
				ELSE 1
			END
		WHEN t1.name = "Flying" THEN
			CASE
				WHEN t2.name IN ("Electric", "Rock", "Steel") THEN 0.5
				WHEN t2.name IN ("Grass", "Fighting", "Bug") THEN 2
				ELSE 1
			END
		WHEN t1.name = "Psychic" THEN
			CASE
				WHEN t2.name IN ("Steel", "Psychic") THEN 0.5
				WHEN t2.name IN ("Fighting", "Poison") THEN 2
				WHEN t2.name = "Dark" THEN 0
				ELSE 1
			END
		WHEN t1.name = "Bug" THEN
			CASE
				WHEN t2.name IN ("Fire", "Fighting", "Poison", "Flying", "Ghost", "Steel", "Fairy") THEN 0.5
				WHEN t2.name IN ("Grass", "Psychic", "Dark") THEN 2
				ELSE 1
			END
		WHEN t1.name = "Rock" THEN
			CASE
				WHEN t2.name IN ("Fighting", "Ground", "Steel") THEN 0.5
				WHEN t2.name IN ("Fire", "Ice", "Flying", "Bug") THEN 2
				ELSE 1
			END
		WHEN t1.name = "Ghost" THEN
			CASE
				WHEN t2.name IN ("Normal") THEN 0
				WHEN t2.name IN ("Psychic", "Ghost") THEN 2
                WHEN t2.name IN ("Dark") THEN 0.5
				ELSE 1
			END
		WHEN t1.name = "Dragon" THEN
			CASE
				WHEN t2.name = "Fairy" THEN 0
				WHEN t2.name = "Steel" THEN 0.5
				WHEN t2.name = "Dragon" THEN 2
				ELSE 1
			END
		WHEN t1.name = "Dark" THEN
			CASE
				WHEN t2.name IN ("Fighting", "Dark", "Fairy") THEN 0.5
				WHEN t2.name IN ("Psychic", "Ghost") THEN 2
				ELSE 1
			END
		WHEN t1.name = "Steel" THEN
			CASE
				WHEN t2.name IN ("Fire", "Water", "Electric", "Steel") THEN 0.5
				WHEN t2.name IN ("Ice", "Rock", "Fairy") THEN 2
				ELSE 1
			END
		WHEN t1.name = "Fairy" THEN
			CASE
				WHEN t2.name IN ("Fire", "Poison", "Steel") THEN 0.5
				WHEN t2.name IN ("Fighting", "Dragon", "Dark") THEN 2
				ELSE 1
			END
		ELSE 1
END), 1) AS value from Type t1, Type t2;

-- Pokemon

INSERT INTO Pokemon
VALUES
(1, 'Bulbasaur', 'There is a plant seed on its back right from the day this Pokémon is born. The seed slowly grows larger.', 1),
(2, 'Ivysaur', 'When the bulb on its back grows large, it appears to lose the ability to stand on its hind legs.', 1),
(3, 'Venusaur', 'The flower on its back catches the sun\'s rays. The sunlight is then absorbed and used for energy.', 1),
(4, 'Charmander', 'The flame on its tail shows the strength of its life force. If it is weak, the flame also burns weakly.', 1),
(5, 'Charmeleon', 'It has a barbaric nature. In battle, it whips its fiery tail around and slashes away with sharp claws.', 1),
(6, 'Charizard', 'It spits fire that is hot enough to melt boulders. It may cause forest fires by blowing flames.', 1),
(7, 'Squirtle', 'When it retracts its long neck into its shell, it squirts out water with vigorous force.', 1),
(8, 'Wartortle', 'It is recognized as a symbol of longevity. If its shell has algae on it, that Wartortle is very old.', 1),
(9, 'Blastoise', 'The jets of water it spouts from the rocket cannons on its shell can punch through thick steel.', 1),
(10, 'Caterpie', 'For protection, it releases a horrible stench from the antennae on its head to drive away enemies.', 1),
(11, 'Metapod', 'Its shell is as hard as an iron slab. It is vulnerable only when its shell is open.', 1),
(12, 'Butterfree', 'In battle, it flaps its wings at great speed to release highly toxic dust into the air.', 1),
(13, 'Weedle', 'Beware of the sharp stinger on its head. It hides in grass and bushes where it eats leaves.', 1),
(14, 'Kakuna', 'It remains virtually immobile while it clings to a tree. However, on the inside, it is extremely active.', 1),
(15, 'Beedrill', 'May appear in a swarm. Flies at violent speeds, all the while stabbing with the toxic stinger on its rear.', 1),
(16, 'Pidgey', 'Very docile. If attacked, it will often kick up sand to protect itself rather than fight back.', 1),
(17, 'Pidgeotto', 'This Pokémon is full of vitality. It constantly flies around its large territory in search of prey.', 1),
(18, 'Pidgeot', 'When hunting, it skims the surface of water at high speed to pick off unwary prey such as Magikarp.', 1),
(19, 'Rattata', 'Bites anything when it attacks. Small and very quick, it is a common sight in many places.', 1),
(20, 'Raticate', 'It uses its whiskers to maintain its balance. It apparently slows down if they are cut off.', 1),
(21, 'Spearow', 'Eats bugs in grassy areas. It has to flap its short wings at high speed to stay airborne.', 1),
(22, 'Fearow', 'With its huge and magnificent wings, it can keep aloft without ever having to land for rest.', 1),
(23, 'Ekans', 'Moves silently and stealthily. Eats the eggs of birds, such as Pidgey and Spearow, whole.', 1),
(24, 'Arbok', 'The frightening patterns on its belly have been studied. Six variations have been confirmed.', 1),
(25, 'Pikachu', 'When several of these Pokémon gather, their electricity could build and cause lightning storms.', 1),
(26, 'Raichu', 'If the electrical sacs become excessively charged, Raichu plants its tail in the ground and discharges.', 1),
(27, 'Sandshrew', 'Burrows deep underground in arid locations far from water. It only emerges to hunt for food.', 1),
(28, 'Sandslash', 'Curls up into a spiny ball when threatened. It can roll while curled up to attack or escape.', 1),
(29, 'Nidoran♀', 'Although small, its venomous barbs render this Pokémon dangerous. The female has smaller horns.', 1),
(30, 'Nidorina', 'The female\'s horn develops slowly. Prefers physical attacks such as clawing and biting.', 1),
(31, 'Nidoqueen', 'Tough scales cover the sturdy body of this Pokémon. It appears that the scales grow in cycles.', 1),
(32, 'Nidoran♂', 'Stiffens its ears to sense danger. The larger its horns, the more powerful its secreted venom.', 1),
(33, 'Nidorino', 'An aggressive Pokémon that is quick to attack. The horn on its head secretes a powerful venom.', 1),
(34, 'Nidoking', 'Its steel-like hide adds to its powerful tackle. Its horns are so hard, they can pierce a diamond.', 1),
(35, 'Clefairy', 'Its magical and cute appeal has many admirers. It is rare and found only in certain areas.', 1),
(36, 'Clefable', 'A timid fairy Pokémon that is rarely seen. It will run and hide the moment it senses people.', 1),
(37, 'Vulpix', 'At the time of its birth, Vulpix has one white tail. The tail separates into six if this Pokémon receives plenty of love from its Trainer.', 1),
(38, 'Ninetales', 'According to an enduring legend, 9 noble saints were united and reincarnated as this Pokémon.', 1),
(39, 'Jigglypuff', 'Uses its alluring eyes to enrapture its foe. It then sings a pleasing melody that lulls the foe to sleep.', 1),
(40, 'Wigglytuff', 'The body is soft and rubbery. When angered, it will suck in air and inflate itself to an enormous size.', 1),
(41, 'Zubat', 'Forms colonies in perpetually dark places. Uses ultrasonic waves to identify and approach targets.', 1),
(42, 'Golbat', 'It attacks in a stealthy manner, without warning. Its sharp fangs are used to bite and to suck blood.', 1),
(43, 'Oddish', 'During the day, it keeps its face buried in the ground. At night, it wanders around sowing its seeds.', 1),
(44, 'Gloom', 'The honey it drools from its mouth smells so atrocious, it can curl noses more than a mile away.', 1),
(45, 'Vileplume', 'The larger its petals, the more toxic pollen it contains. Its big head is heavy and hard to hold up.', 1),
(46, 'Paras', 'Burrows to suck tree roots. The mushrooms on its back grow by drawing nutrients from the bug host.', 1),
(47, 'Parasect', 'The bug host is drained of energy by the mushrooms on its back. They appear to do all the thinking.', 1),
(48, 'Venonat', 'Its large eyes act as radar. In a bright place, you can see that they are clusters of many tiny eyes.', 1),
(49, 'Venomoth', 'The wings are covered with dustlike scales. Every time it flaps its wings, it looses highly toxic dust.', 1),
(50, 'Diglett', 'Lives about one yard underground where it feeds on plant roots. It sometimes appears above ground.', 1),
(51, 'Dugtrio', 'A team of Diglett triplets. It triggers huge earthquakes by burrowing 60 miles underground.', 1),
(52, 'Meowth', 'Adores circular objects. Wanders the streets on a nightly basis to look for dropped loose change.', 1),
(53, 'Persian', 'Although its fur has many admirers, it is tough to raise as a pet because of its fickle meanness.', 1),
(54, 'Psyduck', 'While lulling its enemies with its vacant look, this wily Pokémon will use psychokinetic powers.', 1),
(55, 'Golduck', 'Often seen swimming elegantly by lakeshores. It is often mistaken for the Japanese monster Kappa.', 1),
(56, 'Mankey', 'An agile Pokémon that lives in trees. It angers easily and will not hesitate to attack anything.', 1),
(57, 'Primeape', 'Always furious and tenacious to boot. It will not abandon chasing its quarry until it is caught.', 1),
(58, 'Growlithe', 'Very protective of its territory. It will bark and bite to repel intruders from its space.', 1),
(59, 'Arcanine', 'A legendary Pokémon in China. Many people are charmed by its grace and beauty while running.', 1),
(60, 'Poliwag', 'Its newly grown legs prevent it from walking well. It appears to prefer swimming over walking.', 1),
(61, 'Poliwhirl', 'Capable of living in or out of water. When out of water, it sweats to keep its body slimy.', 1),
(62, 'Poliwrath', 'An adept swimmer at both the front crawl and breaststroke. Easily overtakes the best human swimmers.', 1),
(63, 'Abra', 'Using its ability to read minds, it will identify impending danger and teleport to safety.', 1),
(64, 'Kadabra', 'It emits special alpha waves from its body that induce headaches just by being close.', 1),
(65, 'Alakazam', 'Its brain can outperform a supercomputer. Its intelligence quotient is said to be 5,000.', 1),
(66, 'Machop', 'Loves to build its muscles. It trains in all styles of martial arts to become even stronger.', 1),
(67, 'Machoke', 'The belt around its waist holds back its energy. Without it, this Pokémon would be unstoppable.', 1),
(68, 'Machamp', 'Using its heavy muscles, it throws powerful punches that can send the victim clear over the horizon.', 1),
(69, 'Bellsprout', 'A carnivorous Pokémon that traps and eats bugs. It uses its root feet to soak up needed moisture.', 1),
(70, 'Weepinbell', 'It spits out PoisonPowder to immobilize the enemy and then finishes it with a spray of Acid.', 1),
(71, 'Victreebel', 'Said to live in huge colonies deep in jungles, although no one has ever returned from there.', 1),
(72, 'Tentacool', 'Its body is virtually composed of water. It shoots strange beams from its crystal-like eyes.', 1),
(73, 'Tentacruel', 'The tentacles are normally kept short. On hunts, they are extended to ensnare and immobilize prey.', 1),
(74, 'Geodude', 'Found in fields and mountains. Mistaking them for boulders, people often step or trip on them.', 1),
(75, 'Graveler', 'Rolls down slopes to move. It rolls over any obstacle without slowing or changing its direction.', 1),
(76, 'Golem', 'Once it sheds its skin, its body turns tender and whitish. Its hide hardens when it\'s exposed to air.', 1),
(77, 'Ponyta', 'Capable of jumping incredibly high. Its hooves and sturdy legs absorb the impact of a hard landing.', 1),
(78, 'Rapidash', 'Very competitive, this Pokémon will chase anything that moves fast in the hopes of racing it.', 1),
(79, 'Slowpoke', 'Incredibly slow and sluggish. It is quite content to loll about without worrying about the time. It is said to feel no pain, even if its tail is bitten.', 1),
(80, 'Slowbro', 'The Shellder that latches onto Slowpoke\'s tail is said to feed on the host\'s leftover scraps.', 1),
(81, 'Magnemite', 'The units at the sides of its body generate antigravity energy to keep it aloft in the air.', 1),
(82, 'Magneton', 'Formed by several Magnemite that link together. They frequently appear when sunspots flare up.', 1),
(83, 'Farfetch\'d', 'The stalk this Pokémon carries in its wings serves as a sword to cut down opponents. ', 1),
(84, 'Doduo', 'A bird that makes up for its poor flying with its fast running. It nests in the ground using holes dug with its beak.', 1),
(85, 'Dodrio', 'An odd species that is rarely found. The three heads respectively represent joy, sadness, and anger.', 1),
(86, 'Seel', 'The protruding horn on its head is very hard. It is used for bashing through thick ice.', 1),
(87, 'Dewgong', 'Its entire body is a snowy white. Unharmed by even intense cold, it swims powerfully in icy waters.', 1),
(88, 'Grimer', 'Appears in filthy areas. Thrives by sucking up polluted sludge that is pumped out of factories.', 1),
(89, 'Muk', 'Smells so awful, it can cause fainting. Through degeneration of its nose, it lost its sense of smell.', 1),
(90, 'Shellder', 'Its hard shell repels any kind of attack. It is vulnerable only when its shell is open.', 1),
(91, 'Cloyster', 'When attacked, it launches its horns in quick volleys. Its innards have never been seen.', 1),
(92, 'Gastly', 'Born from gases, anyone would faint if engulfed by its gaseous body, which contains poison.', 1),
(93, 'Haunter', 'Because of its ability to slip through block walls, it is said to be from another dimension.', 1),
(94, 'Gengar', 'Under a full moon, this Pokémon likes to mimic the shadows of people and laugh at their fright.', 1),
(95, 'Onix', 'As it digs through the ground, it absorbs many hard objects. This is what makes its body so solid.', 1),
(96, 'Drowzee', 'Puts enemies to sleep then eats their dreams. Occasionally gets sick from eating bad dreams.', 1),
(97, 'Hypno', 'When it locks eyes with an enemy, it will use a mix of PSI moves such as Hypnosis and Confusion.', 1),
(98, 'Krabby', 'Its pincers are not only powerful weapons, they are used for balance when walking sideways.', 1),
(99, 'Kingler', 'The larger pincer has 10,000-horsepower crushing force. The smaller pincer packs a punch of 300 horsepower.', 1),
(100, 'Voltorb', 'Usually found in power plants. Easily mistaken for a Poke Ball, it has zapped many people.', 1),
(101, 'Electrode', 'It stores electric energy under very high pressure. It often explodes with little or no provocation.', 1),
(102, 'Exeggcute', 'Often mistaken for eggs. When disturbed, they quickly gather and attack in swarms.', 1),
(103, 'Exeggutor', 'Legend has it that on rare occasions, one of its heads will drop off and continue on as an EXEGGCUTE.', 1),
(104, 'Cubone', 'Wears the skull of its deceased mother. Its cries echo inside the skull and come out as a sad melody.', 1),
(105, 'Marowak', 'The bone it holds is its key weapon. It throws the bone skillfully like a boomerang to KO targets.', 1),
(106, 'Hitmonlee', 'When in a hurry, its legs lengthen progressively. It runs smoothly with extra long, loping strides.', 1),
(107, 'Hitmonchan', 'Its punches slice the air. They are launched at such high speed, even a slight graze could cause a burn.', 1),
(108, 'Lickitung', 'Its tongue can be extended like a chameleon\'s. It leaves a tingling sensation when it licks enemies.', 1),
(109, 'Koffing', 'If one gets close enough to it when it expels poisonous gas, the gas swirling inside it can be seen.', 1),
(110, 'Weezing', 'When it inhales poisonous gases from garbage, its body expands, and its insides liquefy.', 1),
(111, 'Rhyhorn', 'Its massive bones are 1000 times harder than human bones. It can easily knock a trailer flying.', 1),
(112, 'Rhydon', 'Its horn, which rotates like a drill, destroys tall buildings with one strike. It stands on its hind legs.', 1),
(113, 'Chansey', 'A rare and elusive Pokémon that is said to bring happiness to those who manage to get it.', 1),
(114, 'Tangela', 'Its identity is obscured by masses of thick, blue vines. The vines are said to never stop growing.', 1),
(115, 'Kangaskhan', 'The infant rarely ventures out of its mother\'s protective pouch until it is three years old.', 1),
(116, 'Horsea', 'Known to shoot down flying bugs with precision blasts of ink from the surface of the water.', 1),
(117, 'Seadra', 'Capable of swimming backwards by rapidly flapping its wing-like pectoral fins and stout tail.', 1),
(118, 'Goldeen', 'Its dorsal, pectoral, and tail fins wave elegantly in water. That is why it is known as the water dancer.', 1),
(119, 'Seaking', 'It is the male\'s job to make a nest by carving out boulders in a stream using the horn on its head.', 1),
(120, 'Staryu', 'An enigmatic Pokémon that can effortlessly regenerate any appendage it loses in battle.', 1),
(121, 'Starmie', 'Its shining, multicolored body is beautiful. However, it is also mysterious, so very few have seen it.', 1),
(122, 'Mr. Mime', 'If interrupted while it is miming, it will slap around the offender with its broad hands.', 1),
(123, 'Scyther', 'With ninja-like agility and speed, it can create the illusion that there is more than one.', 1),
(124, 'Jynx', 'It speaks a language similar to that of humans. However, it seems to use dancing to communicate.', 1),
(125, 'Electabuzz', 'Electricity runs across the surface of its body. In darkness, its entire body glows a whitish blue.', 1),
(126, 'Magmar', 'Its body always burns with an orange glow that enables it to hide perfectly among flames.', 1),
(127, 'Pinsir', 'If it fails to crush the victim in its pincers, it will swing it around and toss it hard.', 1),
(128, 'Tauros', 'A rowdy Pokémon with a lot of stamina. Once running, it won\'t stop until it hits something.', 1),
(129, 'Magikarp', 'It is virtually worthless in terms of both power and speed. It is the most weak and pathetic Pokémon in the world.', 1),
(130, 'Gyarados', 'Rarely seen in the wild. Huge and vicious, it is capable of destroying entire cities in a rage.', 1),
(131, 'Lapras', 'A gentle soul that can read the minds of people. It can ferry people across the sea on its back.', 1),
(132, 'Ditto', 'Capable of copying an enemy\'s genetic code to instantly transform itself into a duplicate of the enemy.', 1),
(133, 'Eevee', 'Its genetic code is irregular. It may mutate if it is exposed to radiation from element Stones.', 1),
(134, 'Vaporeon', 'Lives close to water. Its long tail is ridged with a fin which is often mistaken for a mermaid\'s.', 1),
(135, 'Jolteon', 'It accumulates negative ions in the atmosphere to blast out 10000-volt lightning bolts.', 1),
(136, 'Flareon', 'When storing thermal energy in its body, its temperature could soar to over 1600 degrees.', 1),
(137, 'Porygon', 'A Pokémon that consists entirely of programming code. Capable of moving freely in cyberspace.', 1),
(138, 'Omanyte', 'An ancient Pokémon that was recovered from a fossil. It swims by cleverly twisting its 10 tentacles about.', 1),
(139, 'Omastar', 'Sharp beaks ring its mouth. Its shell was too big for it to move freely, so it became extinct.', 1),
(140, 'Kabuto', 'A Pokémon that was resurrected from a fossil using modern science. It swam in ancient seas.', 1),
(141, 'Kabutops', 'A slim and fast swimmer. It slices its prey with its sharp sickles and drinks the body fluids.', 1),
(142, 'Aerodactyl', 'A ferocious, prehistoric Pokémon that goes for the enemy\'s throat with its serrated, sawlike fangs.', 1),
(143, 'Snorlax', 'Very lazy. Just eats and sleeps. As its rotund bulk builds, it becomes steadily more slothful.', 1),
(144, 'Articuno', 'A legendary bird Pokémon that is said to appear to doomed people who are lost in icy mountains.', 1),
(145, 'Zapdos', 'A legendary bird Pokémon that is said to appear from clouds while dropping enormous lightning bolts.', 1),
(146, 'Moltres', 'Known as the legendary bird of fire. Every flap of its wings creates a dazzling flash of flames.', 1),
(147, 'Dratini', 'Long considered a mythical Pokémon until recently when a small colony was found living underwater.', 1),
(148, 'Dragonair', 'A mystical Pokémon that exudes a gentle aura. Has the ability to change climate conditions.', 1),
(149, 'Dragonite', 'It is said that somewhere in the ocean lies an island where these gather. Only they live there.', 1),
(150, 'Mewtwo', 'It was created by a scientist after years of horrific gene splicing and DNA engineering experiments.', 1),
(151, 'Mew', 'So rare that it is still said to be a mirage by many experts. Only a few people have seen it worldwide.', 1);

-- Pokemon type
INSERT INTO Pokemon_has_Type 
VALUES
-- Bulbasaur
(1, 4),
(1, 8),
-- Ivysaur
(2, 4),
(2, 8),
-- Venusaur
(3, 4),
(3, 8),
-- Charmander
(4, 2),
-- Charmeleon
(5, 2),
-- Charizard
(6, 2),
(6, 10),
-- Squirtle
(7, 3),
-- Wartortle
(8, 3),
-- Blastoise
(9, 3),
-- Caterpie
(10, 12),
-- Metapod
(11, 12),
-- Butterfree
(12, 12),
(12, 10),
-- Weedle
(13, 12),
(13, 8),
-- Kakuna
(14, 12),
(14, 8),
-- Beedrill
(15, 12),
(15, 8),
-- Pidgey
(16, 1),
(16, 10),
-- Pidgeotto
(17, 1),
(17, 10),
-- Pidgeot
(18, 1),
(18, 10),
-- Rattata
(19, 1),
-- Raticate
(20, 1),
-- Spearow
(21, 1),
(21, 10),
-- Fearow
(22, 1),
(22, 10),
-- Ekans
(23, 8),
-- Arbok
(24, 8),
-- Pikachu
(25, 5),
-- Raichu
(26, 5),
-- Sandshrew
(27, 9),
-- Sandslash
(28, 9),
-- Nidoran♀
(29, 8),
-- Nidorina
(30, 8),
-- Nidoqueen
(31, 8),
(31, 9),
-- Nidoran♂
(32, 8),
-- Nidorino
(33, 8),
-- Nidoking
(34, 8),
(34, 9),
-- Clefairy
(35, 18),
-- Clefable
(36, 18),
-- Vulpix
(37, 2),
-- Ninetales
(38, 2),
-- Jigglypuff
(39, 18),
(39, 1),
-- Wigglytuff
(40, 18),
(40, 1),
-- Zubat
(41, 8),
(41, 10),
-- Golbat
(42, 8),
(42, 10),
-- Oddish
(43, 4),
(43, 8),
-- Gloom
(44, 4),
(44, 8),
-- Vileplume
(45, 4),
(45, 8),
-- Paras
(46, 12),
(46, 4),
-- Parasect
(47, 12),
(47, 4),
-- Venonat
(48, 12),
(48, 8),
-- Venomoth
(49, 12),
(49, 8),
-- Diglett
(50, 9),
-- Dugtrio
(51, 9),
-- Meowth
(52, 1),
-- Persian
(53, 1),
-- Psyduck
(54, 3),
-- Golduck
(55, 3),
-- Mankey
(56, 7),
-- Primeape
(57, 7),
-- Growlithe
(58, 2),
-- Arcanine
(59, 2),
-- Poliwag
(60, 3),
-- Poliwhirl
(61, 3),
-- Poliwrath
(62, 3),
(62, 7),
-- Abra
(63, 11),
-- Kadabra
(64, 11),
-- Alakazam
(65, 11),
-- Machop
(66, 7),
-- Machoke
(67, 7),
-- Machamp
(68, 7),
-- Bellsprout
(69, 4),
(69, 8),
-- Weepinbell
(70, 4),
(70, 8),
-- Victreebel
(71, 4),
(71, 8),
-- Tentacool
(72, 3),
(72, 8),
-- Tentacruel
(73, 3),
(73, 8),
-- Geodude
(74, 13),
(74, 9),
-- Graveler
(75, 13),
(75, 9),
-- Golem
(76, 13),
(76, 9),
-- Ponyta
(77, 2),
-- Rapidash
(78, 2),
-- Slowpoke
(79, 3),
(79, 11),
-- Slowbro
(80, 3),
(80, 11),
-- Magnemite
(81, 5),
(81, 17),
-- Magneton
(82, 5),
(82, 17),
-- Farfetch'd
(83, 1),
(83, 10),
-- Doduo
(84, 1),
(84, 10),
-- Dodrio
(85, 1),
(85, 10),
-- Seel
(86, 3),
-- Dewgong
(87, 3),
(87, 6),
-- Grimer
(88, 8),
-- Muk
(89, 8),
-- Shellder
(90, 3),
-- Cloyster
(91, 3),
(91, 6),
-- Gastly
(92, 14),
(92, 8),
-- Haunter
(93, 14),
(93, 8),
-- Gengar
(94, 14),
(94, 8),
-- Onix
(95, 13),
(95, 9),
-- Drowzee
(96, 11),
-- Hypno
(97, 11),
-- Krabby
(98, 3),
-- Kingler
(99, 3),
-- Voltorb
(100, 5),
-- Electrode
(101, 5),
-- Exeggcute
(102, 4),
(102, 11),
-- Exeggutor
(103, 4),
(103, 11),
-- Cubone
(104, 9),
-- Marowak
(105, 9),
-- Hitmonlee
(106, 7),
-- Hitmonchan
(107, 7),
-- Lickitung
(108, 1),
-- Koffing
(109, 8),
-- Weezing
(110, 8),
-- Rhyhorn
(111, 13),
(111, 9),
-- Rhydon
(112, 13),
(112, 9),
-- Chansey
(113, 1),
-- Tangela
(114, 4),
-- Kangaskhan
(115, 1),
-- Horsea
(116, 3),
-- Seadra
(117, 3),
-- Goldeen
(118, 3),
-- Seaking
(119, 3),
-- Staryu
(120, 3),
-- Starmie
(121, 3),
(121, 11),
-- Mr. Mime
(122, 18),
(122, 11),
-- Scyther
(123, 12),
(123, 10),
-- Jynx
(124, 6),
(124, 11),
-- Electabuzz
(125, 5),
-- Magmar
(126, 2),
-- Pinsir
(127, 12),
-- Tauros
(128, 1),
-- Magikarp
(129, 3),
-- Gyarados
(130, 3),
(130, 10),
-- Lapras
(131, 3),
(131, 6),
-- Ditto
(132, 1),
-- Eevee
(133, 1),
-- Vaporeon
(134, 3),
-- Jolteon
(135, 5),
-- Flareon
(136, 2),
-- Porygon
(137, 1),
-- Omanyte
(138, 3),
(138, 13),
-- Omastar
(139, 3),
(139, 13),
-- Kabuto
(140, 3),
(140, 13),
-- Kabutops
(141, 3),
(141, 13),
-- Aerodactyl
(142, 13),
(142, 10),
-- Snorlax
(143, 1),
-- Articuno
(144, 6),
(144, 10),
-- Zapdos
(145, 5),
(145, 10),
-- Moltres
(146, 2),
(146, 10),
-- Dratini
(147, 15),
-- Dragonair
(148, 15),
-- Dragonite
(149, 15),
(149, 10),
-- Mewtwo
(150, 11),
-- Mew
(151, 11);
