waitUntil {!isNull player && player == player};
if(player diarySubjectExists "rules")exitwith{};

player createDiarySubject ["changelog","Change Log"];
player createDiarySubject ["serverrules","Règles du serveur."];
player createDiarySubject ["policerules","Règles Police"];
player createDiarySubject ["safezones","Zones Safe (No Killing)"];
//player createDiarySubject ["civrules","Règles civil"];
player createDiarySubject ["illegalitems","Ressource Illégale"];
//player createDiarySubject ["gangrules","Règles de gang"];
//player createDiarySubject ["terrorrules","Règles rebelle"];
player createDiarySubject ["controls","Racourcis clavier"];

/*  Example
	player createDiaryRecord ["", //Container
		[
			"", //Subsection
				"
				TEXT HERE<br/><br/>
				"
		]
	];
*/
	player createDiaryRecord["changelog",
		[
			"Official Change Log",
				"
					The official change log can be found on the BIS forums (search Altis Life RPG)
				"
		]
	];
	
	player createDiaryRecord["changelog",
		[
			"Custom Change Log",
				"
					This section is meant for people doing their own edits to the mission, DO NOT REMOVE THE ABOVE.
				"
		]
	];

		player createDiaryRecord ["serverrules",
		[
			"Exploitation de bug", 
				"
				Ceci est considérer comme étant des abus ou des exploits bug et vous risquez le ban .<br/><br/>

				1. Se déconnecter volontairement lors d'une arrestation, d'un taz, ou lors d'une quelconque action RP .<br/>
				2. Dupliquer des items et/ou de l'argent. Si un envoie d'un montant anormal d'argent est effectué, il doit être signalé à un Admin ou à un modérateur sans attendre.<br/>
				3. Utiliser des objets ne faisant pas partie de la mission amènera un ban. Si un hacker fait spawn des objets ou véhicules ne faisant pas partie de la mission, ne les utilisez pas et prévenez un Admin !<br/>
				4. Abuser de bug ou des mécaniques du jeu sera puni.<br/>
				5. Le Free kill est interdit où que ce soit. Ainsi que le suicide afin d'éviter d’être sanctionnée.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord["safezones",
		[
			"Safe Zones",
				"
					Ces zones sont des endroits ou il est interdit de tuer, écraser, exploser,... délibérément. Si vous êtes surpris a faire l'une de ces dites choses, vous serez sanctioné!<br/><br/>
					
					Tout les vendeurs de véhicules <br/>
					Toutes les armureries<br/>
					Tout les camps rebelles<br/>
					Toutes les zones donateur<br/><br/>
				"
		]
	];
					
	
	player createDiaryRecord ["serverrules",
		[
			"Risque de bannissement permanent", 
				"
				Voici les choses qui peuvent vous faire bannir de manière permanente et sans avertissement.<br/><br/>
				
				1. L'utilisation de Hack.<br/>
				2. L'utilisation de Cheat.<br/>
				3. l'exploitation de bug et autres. (rubrique 'Exploitation de bug').<br/>
				4. Avoir été kicker plus de 3 fois par des admins.<br/>
				5. Le troll est passible de ban.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Interaction avec la Police", 
				"
				Faire l'une de ces choses de manière abusive peut entraîner des sanctions a votre égard.<br/><br/>
				
				1. Les Civils peuvent être arrêter pour avoir fouiller dans les sac ou les coffres de véhicule de la police. Un abus peux etre considérer comme du troll.<br/>
				2. Les civils peuvent être arrêter pour le simple faite de suivre pendant une certaine durée les forces de police.<br/>
				3. Les civils ou les rebelles qui tue un policier sans raison Rp sera considérer comme commettant du free kill et sera sanctionné comme tel.<br/>
				4. Suivre ou harceler un policier sera considérer comme du troll et sera passible d'un ban permanent du serveur.<br/>
				5. Le fait d’empêcher un policier d’exécuter son devoir peu amener a votre arrestation. Si vous le faite constamment, ce sera considérer comme du troll.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Navigation", 
				"
				Faire l'une de ces choses de manière abusive peut entraîner des sanctions a votre égard.<br/><br/>
				
				1. pousser un bateau qui n'est pas le vôtre juste pour embêter votre monde sera sanctionner<br/>
				2. Poussez un bateau avec l'intention de tuer quelqu'un ou de taper quelqu'un n'est pas Rp et est passible d'une sanction.<br/>
				3. Écraser délibérément les nageurs ou plongeur est interdit et passible d'une sanction..<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Aviation", 
				"
				Faire l'une de ces choses de manière abusive peut entraîner des sanctions a votre égard.<br/><br/>
				
				1. Écraser son hélicoptère de façon délibérer et non rp sur une ville, un bâtiment, des véhicules ou autres est interdit et sera passible de ban. <br/>
				2. Le survol des villes ainsi que le stationnement en ville sans autorisation de la police est illégale. Vous risquez donc une amende ainsi que votre arrestation. Le survol a basse altitude des villes de manière répéter et non Rp peuvent être sanctionnée d'un kick ou d'un ban.<br/>
				3. Voler un hélicoptère pour aller l’écraser est interdit et est considérer comme du non Rp. Il est passible d'un ban.
				4. Il est interdit de détruire délibérément les hélicoptères d'ennemis pour les embêter. Cela pourra être sanctionner d'un ban.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Vehicules", 
				"
				Faire l'une de ces choses de manière abusive peut entraîner des sanctions a votre égard.<br/><br/>
				
				1. Il est interdit d’écraser délibérément quelqu'un sans raison RP valable. De même, le fait de se jeter sous les roue d'un véhicule de manière abusive sera considérer comme du troll et sera passible de sanction..<br/>
				2. Il est interdit de délibérément chercher a faire un frontale avec d'autres véhicule quel qu’il soit. Ceci pourra être considérer comme du free kill et sanctionable.<br/>
				3. Il est interdit de foncer délibérément dans d'autre véhicule pour les faire exploser. Ceci sera considérer comme étant du troll et sera passible de sanction.<br/>
				4. Chercher constamment a voler un véhicule qui ne vous appartient pas afin de troller les joueurs sera sanctionner par un ban du serveur. <br/>
				5. Il est interdit de chercher a crasher son véhicule délibérément sur d'autre véhicule ou sur des bâtiments juste pour le faire exploser. Que se soit le votre ou non!! Cela pourra être sanctionnée de ban ou de kick.<br/>
				6. Il est interdit de détruire volontairement les véhicules onéreux (qui coûte chère) d'autres joueur juste pour les embêter. Cela pourra être passible d'un ban.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Règles de Communication ", 
				"
				Voici les règles de communications du serveur.<br/><br/>
				
				1. Il est interdit de parler, mettre de la musique ou flooder sur le Side channel pour quelque raison que ce soit.<br/>
				2. Spammer n'importe quel channel sera passible d'une sanction.<br/>
				3. Si vous voulez discuter avec vos amis, le serveur Teamspeak du serveur est a votre disposition. Les policiers doivent se trouver sur le Teamspeak quant ils jouent.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Kill", 
				"
				Faire l'une de ces choses peut entraîner des sanctions a votre égard.<br/><br/>
				
				1. Vous ne pouvez pas tuer de personne sans raison Rp.<br/>
				2. Déclarer une rébellion n'est pas une raison pour tuer tout le monde, même si cela concerne la police.<br/>
				3. Une fusillade sans raison rp, démarrée par des Policiers ou civils / rebelles sera considérée comme du Freekill.<br/>
				4. Si vous ne faites pas partie d'une scène de crime et ne voulez pas mourir, COUREZ. Si vous mourrez, vous serez le seul responsable.<br/>
				5. Tuer quelqu'un pour se protéger soi-même ou quelqu'un d'autre sera considéré comme légitime défense..<br/>
				6. Commettre un crime parce qu'une personne ne veut pas vous donner 10$ ou pour toute autre raison du même genre, peut être considéré comme du FreeKill. Une exception existe si votre vie est en danger.<br/><br/>
				
				Ceux-ci sont tous jugés par les administrateurs au cas par cas.<br/><br/>
				"
		]
	];
	player createDiaryRecord ["serverrules",
		[
			"Règles des nouvelles vie", 
				"
				Les règles de nouvelles vie s'applique a tout le monde.<br/><br/>
				
				Faire l'une de ces choses peut entraîner des sanctions a votre égard.<br/><br/>

				1. Si vous êtes tuer, vous devez attendre 20 minutes avant de pouvoir a nouveau vous rendre sur les lieux. (hors temps de trajet).<br/>
				2. Si vous mourez, vous ne pourrez pas faire vengeance vous même.<br/>
				3. Si vous vous êtes fait freekill, ce n'est pas une nouvelle vie.<br/>
				4. Se suicider manuellement n'est pas une nouvelle vie.<br/><br/>
				"
		]
	];

	player createDiaryRecord ["serverrules",
		[
			"Admin", 
				"
				Un admin a toujours raison dans la mesure ou il applique le règlement. Ce dernier doit aussi être impartial dans tout les situations. <br/><br/>
				"
		]
	];
	
// Police Section
	player createDiaryRecord ["policerules",
		[
			"Negociation",
				"
				Si il y a lieu d'avoir des négociation, seul un officier ou un sous officier peut prendre le rôle de négociateur.<br/><br/>
				"
		]
	];
	player createDiaryRecord ["policerules",
		[
			"Les commissariat",
				"
				1. Les commissariat sont des zones dites militaire et donc strictement interdites au civils. Toutes personnes ayant pénétrer dans ces zones sans y être invitée se verront raccompagner en dehors ou arrêter sur le champs.
				2. Tout hélicoptère qui stationne au dessus dans un commissariat pourra être inviter quitter les lieu ou pourra être endommager sur le champs et sans sommation.<br/>
				2. Si un poste de police est prit d'assaut, toute les force de police seront appelée pour le reprendre ou le protéger.<br/>
				3. Lors d'un assaut sur la banque, toute les forces de polices doivent se rendre sur les lieu pour la protéger. Les petits délits doivent etre laisser sans suite.<br/>
				4. Le tazzer est l'arme prioritaire a utiliser. Si vraiment il n'y a aucune autre solution ou si votre vie ou celle d'autre personne est en danger, vous etes autoriser a utiliser la force meurtrière.<br/>
				5. Aucun policier ne peut se permettre de tirer à l'aveuglette dans n'importe quelle situation.<br/>
				6. Les officiers doivent toujours évacuer les civils en cas d'attaque de banque ou de bâtiment et également garantir leur sécurité.<br/>
				7. Toutes personnes se trouvant au niveau de la banque et qui refuse de circuler dans le périmètre de sécurité devra être arrêter sur le champ et être emmener dans le commissariat le plus proche.<br/>
				8. La police peut faire appelle a des groupes de volontaire pour garder la banque et les assister en cas de prise de banque.<br/><br/>
				"
		]
	];
	player createDiaryRecord ["policerules",
		[
			"Aviation",
				"
				1. Aucun hélicoptère ne peux se poser dans les villes ou au alentour sans l'autorisation des plus haut gradé de la police. La police peux autoriser un atérrisage a certain endroit de la ville et vous escorter dans la ville.<br/>
				2. Il est interdit de poser un hélicoptère sur les routes.<br/>
				3. La police peut interdire le vol au dessus de certaine zone pendant un certain temps.<br/>
				4. Les hélicoptère ont interdiction de voler au dessus des villes a moins de 200 m d’altitude.<br/>
				5. Les hélicoptère ne peuvent pas rester en stationnaire au dessus d'une ville sauf pour les forces de polices lors d'opération.<br/><br/>

				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Zone illégale.", 
				"
				1. Les zones rebelles ne sont pas des zones illégale. Même si aucun policier ne peux y mettre les pieds sans faire un raid, on ne peux pas arrêter quelqu'un sous prétexte qu'il sort ou qu'il entre dans cette zone.<br/>
				2. Il est interdit de rentrer dans les zones illégale sans qu'il y ai un raid en cour sur ces dites zones. ( Activités illégale donc risque de mort)<br/>
				3. Si vous pourchassez quelqu'un dans une zone illégale, appeler du renfort et attendez les pour y pénétrer.<br/>
				4. En aucun cas un policier peut rentrer et rester dans une zone illégale sans qu'un raid aie lieu dans la dite zone.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Patrouille", 
				"
				1. Les patrouilles de police peuvent se faire sur toute l’île d'Altis dans le but de rechercher la sécurité des civil, la recherche de véhicule abandonnée ou dans le cadre d'intervention ou de patrouille dites de dissuasion.<br/>
				2. Les patrouilles de polices dans les villes peuvent être effectuer a pied ou en véhicule dans les villes. Une fois en dehors des villes, les patrouille doivent se faire en véhicule.<br/>
				3. Les patrouilles proche des zones dites illégale sont interdites. La police n'est pas censé connaître les lieu de ces zones.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Points de contrôle", 
				"
				Les policiers sont appeler a contrôler certaines zones stratégique de l’île afin de lutter contre l'illégalité et assurez la sécurité des civils.<br/><br/>
				
				1. Un point de contrôle peut être utiliser par un minimum de 2 agents afin de controler les deux sens de circulations. <br/>
				2. Vous pouvez crée une zone de contre mobile a condition de signaler votre position par des cônes de signalisation 300 mètre minimum avant le barrage.<br/>
				3. Les points de contrôle mobile ne peuvent être installer a moins de 1 km des zones illégale sans avoir reçu d'information de civil.<br/>
				4. Tout les points de contrôles ne sont pas spécialement marquer sur la carte.<br/><br/>


				Procédure de contrôle dans un barrage routier:<br/>
				1. Demander au conducteur d’arrêter son véhicule a une distance de sécurité et d'éteindre le moteur.<br/>
				2. Demander au conducteur et au passager si il sont en possession d'une arme dans les main ou dans leur sac.<br/>
				3. Demander au conducteur et au passager de sortir du véhicule. Si ils sont armées, vous leur dites avant de baisser leur arme dès qu'il descende du véhicule et vous leur laisse le temps nécessaire a cet effet.( Ceci en les gardant enjoue avec votre tazer.)<br/>
				4. Demandez leur d’où ils viennent et ou il se rendent.<br/>
				5. Demandez leur si ils accepte de se soumettre a une fouille. (si ils sont armée, dites leur que vous allez les fouiller pour vérifier leur permit de port d'arme)<br/>
				6. Si il accepte, vous pouvez alors les menotter et les fouiller.<br/>
				7. Si ils refusent de se soumettre a une fouilles, vous devez les laissez repartir sauf si vous avez pu constater une infraction de la loi.<br/>
				8. Une fois la fouille terminée, vous devez les laissez regagner leur véhicule et les laisser repartir sans encombre..<br/>
				9. Si le véhicule ou une des personnes est en infraction avec la loi, vous pouvez le retenir sur place et lui mettre l'amende. (si l’infraction est grave, vous devez laisser les autres personnes repartir avec le véhicule (si possible ou les raccompagner quelque par ou ils peuvent reprendre la route par leur propre moyen si le véhicule est en infraction également)<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Vehicules", 
				"
				1. Il y a des places bien définie pour garer vos véhicules en ville. Si vos véhicules sont mal stationnée, ils peuvent être envoyer à la fourrière ou vous pouvez recevoir une amende.<br/>
				2. Les véhicules abandonnés , endommager ou sans propriétaire a proximité sera envoyez a la fourrière dans les plus bref délais.<br/>
				3. Les bateaux doivent être garer correctement sur le rivage.<br/>
				4. Tout véhicule qui ne se sera pas déplacer depuis un certain temps se verra envoyez a la fourrière.<br/>
				5. En cas de doute, vous devez toujours vérifiez si le conducteur est présent dans les environs avant de l'envoyez a la fourrière.<br/>
				6. La mise en fourrière des véhicule est important car cela permet de garder les villes propre et peu encombrer..<br/>
				7. Les véhicules armée de la police peuvent être utiliser pour arrêter des criminels mais doivent servir uniquement pour stopper le véhicule et non a le détruire. De même, il est interdit de tirer sur des personnes a pied avec ce genre de véhicule.<br/><br/>
				"
		]
	];

	player createDiaryRecord ["policerules",
		[
			"Vitesse", 
				"
				Les limitations de vitesse doivent être respecter par tous et en particulier les forces de polices qui doivent montrer l'exemple.<br/><br/>
				
				1.Limitation de vitesse dans les rues des villes : 30 km/h<br/>
				2.Limitation de vitesse dans les avenues des villes et sur les petites routes : 50 km/h<br/>
				3.Limitation de vitesse dans les zones dangereuses : 70 km/h <br/>
				4.Limitation de vitesse sur les routes principales d'Altis : 100km/h<br/>
				5.Limitation de vitesse sur la Grande route d'Altis : 150 km/h »<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Patrouille de police", 
				"
				1. Les policier peuvent patrouiller dans chaque ville sans demande au plus haut gradé.<br/>
				2. Chaque cadet doivent être encadrer par un policier pus haut gradé lors de sortie en dehors des villes.<br/>
				3. Lors des patrouilles en dehors des villes, les policiers doivent être au minimum 2 par véhicule.<br/>
				4. Les policiers ne peuvent pas rester et se pavaner en plein dans la ville. Si il se ballade en ville , c'est pour faire régner la loi.<br/>
				5. Le plan delta ne peut être déclencher a chaque instant.<br/>
				6. Les postes de police sont interdit au civil . Ceux ci ne peuvent se rendre dedans que sur autorisation d'un Caporal ou d'un plus haut gradé. <br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Arrestation et amende",
				"
				Vous pouvez envoyez en prison seulement les grand criminel ainsi que les personnes qui refuse de payez l'amende. Pour ce faire, référez vous au tableau des amendes.<br/><br/>

				1. Vous ne pouvez pas arrêter quelqu'un qui a déjà payez son amende.<br/>
				2. Vous devez informer le suspect de la raison pour laquelle il est mit au arrêt.<br/>
				3. Si un civil est rechercher par l'état, vous devez l’arrêter et êtes autoriser a tazer si le besoin s'en fait ressentir. Utiliser la force l'étal qu'en cas de besoin.<br/><br/>


				Les amendes sont des avertissement a la population civil qui violent la loi mais ne sont pas un grande menace. <br/><br/>

				1. Les amendes doivent suivre le barème de prix fixé par l'état.<br/>
				2. Les amendes doivent être mise en fonction des lois qui on été violer.<br/>
				3. Si la personne refuse de payer l'amande, vous devez l'arreter.<br/>
				4. Si vous mettez une amende excessive ou qui n'as pas lieu d'avoir une amende, le civil pourra porter plainte contre vous et vous risquer d’être suspendu immédiatement ou de passer devant le tribunal.<br/><br/>
				
				La liste des infraction ainsi que le barème des amende vous sera délivrez lors de votre formation et devra rester sur vous lors de vos patrouilles. ( La rubrique Barème des amendes sera votre carnet de note.) <br/><br/>
				
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Barème des amendes",
				"
				Voici un barème a respecter impérativement lors de la mise des amendes.<br/><br/>
				
				Trouble à l’ordre public et crimes :<br/>
				
				1.Insulte ou provocation envers la police : 7 500$<br/>
				2.Racket / vol: 20 000$ <br/>
				3.Vol a main armée : 35 000$<br/>
				4.Dégradation de bien public : 1 500$ pour chaque bien endommagé<br/>
				5.Tentative de corruption : 20 000$<br/>
				6.Délit de fuite : 15 000$ + confiscation du véhicule<br/>
				7.Port de tenue illégale : 10 000$<br/>
				8.Possession de produit illégal : 75 % de la valeur saisie <br/>
				9.Tentative de meurtre : 35 000$ (40 000$ sur un policier)<br/>
				10.Meurtre : 60 000$ (75 000$ sur un policier)<br/>
				11.Évasion : 40 000$<br/>

				Réglementation sur les armes :<br/>
				
				1.Port d’arme légale en ville (arme tenu en main) : 5 000$<br/>
				2.Port d’arme illégale : 50 000$ + saisie <br/>
				3.Port d’arme sans licence : 30 000 + saisie<br/>
				4.Port de matériel militaire / rebelle en ville : 10 000$ + saisie <br/>

				Réglementation liée au code de la route & de l’aviation civils :<br/>
				
				Extrait du code de la route :<br/>
				
				1.Limitation de vitesse dans les rues des villes : 30 km/h<br/>
				2.Limitation de vitesse dans les avenues des villes et sur les petites routes : 50 km/h<br/>
				3.Limitation de vitesse dans les zones dangereuses : 70 km/h <br/>
				4.Limitation de vitesse sur les routes principales d'Altis : 100km/h<br/>
				5.Limitation de vitesse sur la Grande route d'Altis : 150 km/h »<br/><br/>
				
				Excès de vitesse :<br/>
				
				1.Entre 5 et 10 km/h de plus que la limite légales : 3 000$<br/>
				2.Entre 10 et 20 km/h de plus que la limite légales : 5 000$<br/>
				3.Entre 20 et 40 km/h de plus que la limite légales : 7 500$ <br/>
				4.Supérieur à 40km/h : 15 000$ + saisie<br/>
				5.Refus de STOP/Priorité : 500$<br/>
				6.Conduite dangereuse : 3 000$<br/>
				7.Stationnement interdit : 1 000$ + saisie du véhicule (si absence du propriétaire)<br/>
				8.Conduite en hors-piste : 2 500$<br/>
				9.Défaut de permis (voiture) : 7 500$ + saisie du véhicule<br/>
				10.Défaut de permis (camion) : 20 000$ + saisie du véhicule<br/>
				11.Tentative de vol de véhicule : 2 500 $ <br/>
				12.Tentative de vol de véhicule de Police : 5 000$<br/>
				13.Vol de véhicule : 12 500$ <br/>
				14.Vol de véhicule de Police : 25 000$<br/>
				15.Vol de camion : 25 000$<br/>
				
				16.Défaut de lumière et signalisation la nuit (tout véhicule) : 2 500$<br/>
				17.Défaut de permis de pilote : 30 000$<br/>
				18.Atterrissage non autorisé en ville ou dans des zones sécurisées : 40 000$ + saisie de l’hélicoptère<br/><br/>
				"
		]
	];
		
	player createDiaryRecord ["policerules",
		[
			"Armes et équipements", 
				"
				Ces armes sont disponible dans toutes les armureries et sont des armes légal. Vous avez donc le droit d'en posséder a condition d'avoir votre license.<br/><br/>

				Voici les armes et équipement qui sont légal pour les civil:<br/>
				1. Le Rook<br/>
				2. Le Zubr<br/>
				3. Le 4-five<br/>
				4. La PDW2000<br/>
				5. Les viseur ACO<br/>
				6. Les grenades fumigène<br/>
				7. La Sting SMG<br/><br/>
				

				Toutes les autres armes(Y compris le P07 silencieux qui est une arme de la police) sont illégal.<br/><br/>

				1. Le port d'arme en ville est strictement interdit. Vous devez le mettre dans votre sac.<br/>
				2. Le port d'arme hors des villes est autoriser mais lors d'un contrôle avec un officier de police, celui ci doit abaisser son arme(appuyez 2 fois sur Ctrl) et se soumettre  au contrôle.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Utilisation du Tazer",
				"
				Le Taser (Silenced P07) est la seul arme non létal. C'est avec celui ci que les policiers doivent exercer la plupart de leur contrôle.<br/><br/>

				1. Le tazer doit toujours être utiliser pour chaque intervention. En cas de problème, vous immobiliser la personne avec votre arme pour le menotter.<br/>
				2. Il est interdit de tazer au hasard des civils ou autres. Tout policier vu en train de faire cela sera suspendu sur le champ.<br/>
				3. Vous devez toujours utiliser votre tazer en conformiter avec la loi.<br/><br/>
				"
		]
	];

	player createDiaryRecord ["policerules",
		[
			"Raid / Camping",
				"
				Le raid est une opération de la police sur des zones bien précise afin de stopper des traficans de drogue ou pour reprendre le contrôle de certaines zone. <br/><br/>

				1. Afin de piller une zone, les policiers doivent être au moins 4, dont l'un doit être un sergent ou au-dessus. <br/>
				2. Tous les civils dans une zone de raid peuvent être retenus et fouillés. Si rien d'illégal est trouvé, vous avez le droit de les garder jusqu'a la fin des opérations. <br/>
				3. Lorsqu'une zone est sécuriser, les policiers doivent la quitter et reprendre leur patrouille.<br/>
				4. Si des personnes recherchées sont trouvées, vous pouvez procéder à leur arrestation.<br/>
				5. La force létale n’est autorisée que si la situation l’exige.<br/>
				6. Une zone ne peut pas être attaquée de nouveau pendant 1 heure après un RAID.<br/>
				7. Si le RAID est un échec (Mort des agents), le prochain RAID qui s'effectuera dans cette zone devra être plus conséquent que la premier étant donnée l'aspect dangereux de la zone en question.<br/>
				9. Les forces en raid ne peuvent pas rester plus de 30 minutes sur place. Si ils n'ont rien pris comme bandit, ils peuvent se faire relever par une nouvelle unités de raid ou alors doivent quitter la zone et reprendre leur patrouille.<br/><br/>

				Le camping signifie que des personnes reste a un certain endroit afin d'attendre leur cible.<br/><br/>

				1. Les points de contrôle ne sont pas considérer comme une zone qui peut être occuper pour une durée indéterminée par la police<br/>
				2. La police a l'obligation de faire régner la loi et l'ordre dans les villes. Ils seront donc fort présent dans celle ci.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Grade de la police",
				"
				Pour chaque grade de police, le salaire sera augmenter et de nouveaux équipement seront disponible a l'achat. De même, certaine licence seront accessible au force de police et déverrouillera de nouveau équipement.<br/><br/>

				Chaîne de commandement de la Police:<br/>
				
				Officier :<br/>
				
				1. Chef de la Police<br/>
				2. Chef Adjoint<br/>
				3. Commandant<br/>
				
				Sous Officier :<br/>
				
				4. Capitaine<br/>
				5. Lieutenant<br/>
				6. Sous Lieutenant<br/>
				7. Sergent Chef<br/>
				8. Sergent<br/>
				
				Agent :<br/>
				
				9. Caporal<br/>
				10. Officier<br/>
				11. Cadet<br/><br/>

				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Utilisation de la force létal.",
				"
				1. L'utilisation de la force létal n'est autorisé que pour la protection de votre vie, la vie vie d'un de vos collègue ou la vie de civils, si et seulement si la force non létale ne serait pas efficace.<br/>
				2. L'or d'un exercice de tir, il est interdit a tout policier de pointer a l'arme létale autre choses qu'une cible en carton. <br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Règle du Teamspeak",
				"
				1. Tout les policier doivent obligatoirement se trouver sur le TS pour pouvoir jouer. Si un policier ne se trouve pas sur le TS, il sera kicker instantanément. Si cela venais a se répéter, il sera suspendu de ces fonctions.<br/>
				2. Le TS est un lieu ou on peut régler rapidement les problème et beaucoup plus facile pour discuter ou contacter un admin. Vous avez donc tout a y gagner en rejoignant notre TS.<br/><br/>
				"
		]
	];
	
	
// Illegal Items Section
	player createDiaryRecord ["illegalitems",
		[
			"Règle Rebelle",
				"
				Un rebelle est une personne qui s'oppose contre un gouvernement et prend les armes. Cependant, éviter de prendre ce terme au pied de la lettre et jouer fair play s'il vous plais. :) Cela profitera a tout le monde. <br/><br/>
				1. La rébellion n'autorise pas le free kill !!!!<br/>
				2. La résistance et la rébellion contre le gouvernement n'autorise pas pour autant de braquer la banque sans cesse ou de faire sans cesse des prise d'otages. Varier un maximum vos actions.<br/>
				3. Toute action doit avoir un sens et aura des conséquences.<br/>
				4. Toute attaque doit avoir un objectif RP . N'attaquer pas une zone juste pour le fun.<br/><br/>
				"
		]
	];
	player createDiaryRecord ["illegalitems",
		[
			"Règles des gangs",
				"
				1. Être dans un gang n'est pas illégal, ce sont les action de ceux ci qui le sont généralement.<br/>
				2. Être dans une zone de gang n'est pas illégal. Ce n'est que lorsque vous participé à leur  activités qui sont illégales.<br/>
				3. Les Gangs peuvent détenir et contrôler des zones et des ressources. D'autres gangs peuvent attaquer une zone d'un gang rivale.<br/>
				4. Pour déclarer la guerre à un autre gang, le leader doit l'annoncer à tous les membres de son gangs et doit également en faire la notification sur le forum. <br/><br/>
				" 
		]
	];
	player createDiaryRecord ["illegalitems",
		[
			"Véhicule Illégale",
				"
				Tout civil contrôlé avec les véhicule ci dessous seront arrêter et risqueront la prison ou une amende.<br/><br/>

				1. Iffrit<br/>
				2. Tout véhicule armée<br/>
				3. Hunter<br/>
				4. Tout véhicule de la police.<br/>
				5. Tout véhicule dit rebelle<br/><br/>
				"
		]
	];
	player createDiaryRecord ["illegalitems",
		[
			"Arme et équipement Illégale",
				"
				 Les équipements ainsi que les armes suivant sont considéré comme étant Illégale:<br/><br/>

				1. Toutes armes de la polices a savoir la série MX ainsi que la MK 200. <br/>
				2. La Katiba <br/>
				3. La TRG <br/>
				4. La Mk.20 <br/>
				5. La Mk.18 <br/>
				6. Le SDAR Rifle<br/>
				7. L'ACP-C2<br/>
				8. Le P07 (Taser)<br/>
				9. Tout objets à détonation sauf les fumigènes.(Grenades, roquette, charge explosive,...)<br/>
				10. Les viseurs autres que les ACO.<br/>
				11. Tout silencieux pour fusil.<br/>
				12. Les équipements d'armes de la Polices <br/>
				13. Le M320.<br/>
				14. La Zafir.<br/>
				15. Le lance roquette.<br/>
				16. Tout équipement dit rebelle<br/><br/>
				"
		]
	];
	player createDiaryRecord ["illegalitems",
		[
			"Ressources Illégale.",
				"
				Les éléments suivant sont considéré comme étant Illégale:<br/><br/>
				1. La Tortue<br/>
				2. La Cocaïne<br/>
				3. L'Heroïne<br/>
				4. Le Cannabis<br/>
				5. La Marijuana<br/>
				6. l'Alcool de contrebande<br/>
				7. Les armes restaurée<br/>
				8. Les cigares<br/><br/>
				"
		]
	];

	
// Controls Section

	player createDiaryRecord ["controls",
		[
			"raccourcis clavier.",
				"
				Y: Ouvrir le menu du joueur<br/>
				U: Verrouiller ou déverrouiller le véhicule.<br/>
				F: Sirène des policier ou infirmier<br/>
				T: Chercher dans le véhicule<br/>
				Shift gauche + R: menotter (policier seulement)<br/>
				Shift gauche + G: Assommer quelqu'un(Civil et rebelle seulement. Utiliser pour voler quelqu'un)<br/>
				Left Windows: Main Interaction key which is used for picking up items/money, interacting with cars (repair,etc) and for cops to interact with civilians. Can be rebound to a single key like H by pressing ESC->Configure->Controls->Custom->Use Action 10<br/>
				Shift gauche + L: Activer les gyrophares (Si vous êtes policier ou ambulancier).<br/><br/>
				"
		]
	];