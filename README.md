# Laliberte_Olivier_Interaction_TP2 : Space Race
2e travail pour le cours d'interaction de 3e session en Techniques Multimédia à Montmorency.

## Concept :
Jeu vidéo de type "shoot them up" inspiré de [Gradius](https://en.wikipedia.org/wiki/Gradius).

Idées de base : 
- Vue bloquée vers le haut (pas de rotation)
- Personnage pouvant tirer sur des ennemis
- Obstacles dans la course (interactions avec environnement)
- Menu principal / menu de pause

# Documentation 

### Niveau :
- Niveau en auto-scroller vertical
- Vue en top-down
- Murs sur les côtés (left, right) pour empêcher le player de sortir

Le auto-scroll est une illusion. L'image en fond loop en descendant vers le bas. Réalisé avec des gdshaders.

### Interactions :
- Collisions entre le player et les obstacles
- Collisions entre les obstacles et les laser
- Menu pause au contact d'une touche

## Player (vaisseau)
Le player est contrôlé manuellement par un joueur externe. Il peut tirer sur des obstacles et explose au contact de ceux-ci.

Le player est équippé d'une propriété :
- Sprite2D
- CollisionPolygon2D
- Hitbox (Area2D + CollisionShape2D)
- Laser weapon (Node2D)
- Camera2D

### Keybinds :

- A: left
- D : right
- Spacebar : tir
- Esc : ouvre le menu pause

### Interactions 
-  _on_hitbox_body_entered() : interaction qui détruit le player quand un obstacle passe sur sa hitbox

## Laser 

Chaque laser est équippé d'une propriété :
- Sprite2D
- CollisionShape2D
- VisibleOnScreenNotifier2D

Le visible-notifier permet de détecter quand le laser sort de l'écran.

Chaque laser est équippé d'une fonction pour :
- tirer
- interagir avec les comètes

### Laser_weapon :
Laser_weapon est l'entité qui permet de tirer les laser.

## Comètes 
Il existe deux entités de comète : "comet" et "comet_small".

Chaque comète (peu importe sa taille) est équippé d'une propriété :
- Sprite2D
- CollisionShape2D
- VisibleOnScreenNotifier2D

Le visible-notifier permet de détecter quand la comète sort de l'écran.

Chaque comète est équippée d'une fonction pour :
- Position de base
- Trajectoire
- Particules
- Sound fx
- spawn des comètes plus petites
- Interaction de collision envers le player
- Interaction de collision envers les laser
- Interaction de sortie d'écran

### Comet_small :
Comet_small est une instance de comète, mais avec des propriétés différentes.

Chaque comet_small a les mêmes propriétés et fonctions qu'une comète de base. Les changements sont :
- Taille : taille plus petite
- Sound fx : sound fx d'explosion différent
- Interaction avec les laser : ne va pas spawner des comètes plus petites

### Comet_spawner :
Comet_spawner est l'entité qui fait spawner les comètes.
- spawn_comet() : génère une nouvelle comète
- set_comet_spawn_position() : donne une position de départ random en haut du viewport à la nouvelle comète.
- set_comet_trajectory() : donne un angle de trjectoire random à la nouvelle comète.
- Timer : fait spawner une comète à chaque (1) seconde(s).

### Interactions :
- explode(): interaction détruisant la comète quand elle entre en contact avec un laser
- on_visible_on_screen_notifier_2d_screen_exited() : interaction détruisant la comète quand elle sort de l'écran

## Menus :

### Menu principal :
Le menu principal est composé de :
- Background
- Title
- Bouton "play" : commence une nouvelle partie
- Bouton "Quit" : ferme le jeu

Le menu principal est la première scène qui s'affiche lorsqu'un joueur lance le jeu.

### Menu pause :
Le menu pause est composé de :
- Bouton "Resume" : reprend le jeu
- Bouton "Quit" : quitte le jeu entièrement
- Background blur

Quand le menu pause est affiché, le reste des éléments derrière le menu sont gelés.

### Menu "Game over" :
Le menu game over est composé de : 
- Text
- Event listener : écoute les touches du clavier; quand la "spacebar" est appuyée, relance une nouvelle partie

Le menu Game over apparait uniquement et automatiquement lorsque le joueur perd la partie.

## Sons :
Plusieurs scripts de différents sons sont utilisés. Le fait de les séparer permet de jouer le son au complet, même si son élément parent disparaît.

Chaque son utilisé :
- Background music
- Laser shoot
- Comet explosion
- Comet_small explosion
- Player explosion
- Game over screen

## Assets : 
- [Space shooter redux - Kenney](https://www.kenney.nl/assets/space-shooter-redux)
- 
