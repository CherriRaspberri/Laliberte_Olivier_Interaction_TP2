# Laliberte_Olivier_Interaction_TP2
2e travail pour le cours d'interaction de 3e session en Techniques Multimédia à Montmorency.

## Concept :
Jeu vidéo de type "shoot them up" auto-scroller inspiré de [Gradius](https://en.wikipedia.org/wiki/Gradius).

Idées de base : 
- Auto-Scroller
- Vue bloquée vers le haut (pas de rotation)
- Personnage pouvant tirer sur des ennemis
- Obstacles dans la course (ennemis, terrain, etc.)
- Power-up pouvant aider à tirer plus vite, mais seulement pendant un certain temps

# Documentation :

### Niveau :
- Niveau en auto-scroller vertical
- Vue en top-down
- Murs sur les côtés (left, right) pour empêcher le player de sortir
- Murs avec collisions pouvant être utilisés comme obstacles

### Interactions :
- Collisions entre le player et le niveau
- Collisions entre le player et les obstacles

- Pause menu
- Controls menu

## Player (vaisseau)

Le player est équippé d'une propriété :
- Sprite2D
- CollisionPolygon2D
- Laser weapon (Node2D)

### Keybinds :
- W : up
- A: left
- S : down
- D : right
- Spacebar : tir

## Comètes 

Chaque comète est équippé d'une propriété :
- Sprite2D
- CollisionShape2D
- VisibleOnScreenNotifier2D

Le visible-notifier permet de détecter quand la comète sort de l'écran.

Chaque comète est équippée d'une fonction pour :
- Position de base
- Trajectoire
- Interaction de collision envers le player
- Interaction de collision envers les laser
- Interaction de sortie d'écran


### Comet_spawner :
Comet_spawner est l'entité qui fait spawner les comètes.
- spawn_comet() : génère une nouvelle comète
- set_comet_spawn_position() : donne une position de départ random en haut du viewport à la nouvelle comète.
- set_comet_trajectory() : donne un angle de trjectoire random à la nouvelle comète.
- Timer : fait spawner une comète à chaque (1) seconde(s).

### Interactions :
- explode(): interaction détruisant la comète quand elle entre en contact avec un laser
- on_visible_on_screen_notifier_2d_screen_exited() : interaction détruisant la comète quand elle sort de l'écran

## Menu :

Le menu est composé de :
- Bouton "Resume" : reprend le jeu
- Bouton "Quit" : quitte le jeu entièrement
- Background blur

Quand le menu est affiché, le reste des éléments derrière le menu sont gelés.

## Assets : 
- [Space shooter redux - Kenney](https://www.kenney.nl/assets/space-shooter-redux)
