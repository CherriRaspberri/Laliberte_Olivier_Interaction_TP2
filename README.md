# Laliberte_Olivier_Interaction_TP2
2e travail pour le cours d'interaction de 3e session en Techniques Multimédia à Montmorency.

## Concept :
Jeu vidéo de type "shoot them up" auto-scroller inspiré de [Gradius](https://en.wikipedia.org/wiki/Gradius).

Idées de base : 
- Auto-Scroller
- Personnage pouvant tirer sur des ennemis
- Obstacles dans la course (ennemis, terrain, etc.)
- Power-up pouvant aider à tirer plus vite, mais seulement pendant un certain temps

## Documentation :

### Niveau :
- Niveau en auto-scroller vertical
- Vue en top-down
- Murs sur les côtés (left, right) pour empêcher le player de sortir
- Murs avec collisions pouvant être utilisés comme obstacles

### Vaisseau :
- Moveset en 4 directions (top, down, left, right)
- Vue bloquée vers le haut (pas de rotation)
- Peut tirer

### Keybinds :
- W : up
- A: left
- S : down
- D : right
- Spacebar : tir

### Interactions :
- Collisions entre le player et le niveau
- Collisions entre le player et les obstacles

- Pause menu
- Controls menu

## Comètes 

### Comet_spawner :
___
Comet_spawner est l'entité qui fait spawner les comètes.
- spawn_comet() : génère une nouvelle comète
- set_comet_spawn_position() : donne une position de départ random en haut du viewport à la nouvelle comète.
- set_comet_trajectory() : donne un angle de trjectoire random à la nouvelle comète.
- Timer : fait spawner une comète à chaque (1) seconde(s).

### Interactions :
- 

## Assets : 
- [Space shooter redux - Kenney](https://www.kenney.nl/assets/space-shooter-redux)
