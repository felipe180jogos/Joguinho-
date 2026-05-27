# Protótipo Top-Down Idle Tycoon (Godot 4)

## Resposta rápida (o que você precisa para jogar)

Você **não precisa baixar jogo pronto daqui**.
Este repositório tem **scripts (código)** para montar o protótipo no Godot.

Para jogar, você tem 2 caminhos:

1. **Mais fácil (recomendado):** pedir para alguém te enviar o projeto Godot já montado (`.zip` com cenas prontas).
2. **Manual:** você mesmo cria o projeto no Godot e conecta os scripts deste repositório.

---

## Opção 1 — Quero o jogo pronto (mais fácil)

Peça um arquivo `.zip` do projeto Godot já configurado, contendo:

- `project.godot`
- pasta `scenes/` (cenas prontas)
- pasta `scripts/` (estes scripts)
- pasta `assets/` (imagens/sons)

Depois:

1. Abra o Godot 4.
2. Clique em **Import**.
3. Selecione o arquivo `project.godot` da pasta extraída.
4. Clique em **Run Project (F5)**.

Se você **não tem** esse `.zip`, use a Opção 2.

---

## Opção 2 — Montar manualmente no Godot (com estes scripts)

### 1) Criar projeto

1. Abra o Godot 4.
2. Clique em **New Project**.
3. Escolha uma pasta e crie o projeto.

### 2) Copiar scripts

Copie a pasta `scripts/` deste repositório para dentro do seu projeto Godot.

### 3) Configurar Autoload

1. Abra **Project > Project Settings > Autoload**.
2. Adicione `scripts/GameManager.gd` com nome **GameManager**.

### 4) Configurar Inputs

Em **Project > Project Settings > Input Map**, crie:

- `move_up`
- `move_down`
- `move_left`
- `move_right`
- `interact_click`

### 5) Criar cena principal e ligar scripts

Você precisa criar nós e anexar:

- Player (`CharacterBody2D`) -> `scripts/player/PlayerController.gd`
- Camera (`Camera2D`) -> `scripts/player/CameraFollow.gd`
- Duck (`Area2D`) -> `scripts/world/DuckNPC.gd`
- PlacementController (`Node2D`) -> `scripts/tycoon/PlacementController.gd`
- ShopUI (`CanvasLayer`) -> `scripts/ui/ShopUI.gd`
- InventoryUI (`CanvasLayer`) -> `scripts/ui/InventoryUI.gd`
- CoinsUI (`CanvasLayer`) -> `scripts/ui/CoinsUI.gd`

Também precisa colocar os nós filhos esperados (ex.: `AudioStreamPlayer2D` no pato e na planta, botões/labels da UI) e preencher os `@export` no Inspector.

### 6) Rodar

Pressione **F5** para jogar.

---

## Gameplay (depois que estiver montado)

1. Ande com o personagem.
2. Clique curto no pato (< 0,5s) toca som curto.
3. Clique longo no pato (> 0,5s) toca som longo.
4. Espere 20s para a loja entrar em alerta.
5. Abra loja no carrinho e clique em **Obter**.
6. Item vai para inventário.
7. Clique no chão para plantar.
8. A cada 20s, ganha +10 moedas.

---

## Importante

Se você quiser, eu posso te passar na próxima mensagem um **passo a passo com print mental da árvore de nós** (nome de cada nó certinho), para você só copiar e funcionar.
