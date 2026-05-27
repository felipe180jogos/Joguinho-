# Protótipo Top-Down Idle Tycoon (Godot 4)

Este repositório contém a **estrutura base e a lógica** para um protótipo 2D Top-Down com mecânicas Idle Tycoon.

## Sistemas implementados

- Movimento do jogador + câmera 2D adaptável.
- Interação com patos por clique rápido/longo.
- Áudio espacial por distância jogador↔pato.
- Loja com atualização de estoque a cada 20s e notificação no carrinho.
- Compra do item **Amogus** com inventário em UI.
- Plantio do item no chão para gerar renda passiva (+10 a cada 20s).

## Estrutura

- `scripts/GameManager.gd`: estados globais do jogo (moedas, inventário, loja).
- `scripts/player/PlayerController.gd`: movimentação top-down.
- `scripts/player/CameraFollow.gd`: câmera seguindo jogador.
- `scripts/world/DuckNPC.gd`: clique rápido/longo + áudio espacial.
- `scripts/ui/ShopUI.gd`: UI da loja, compra e notificação.
- `scripts/ui/InventoryUI.gd`: slot visual do inventário.
- `scripts/ui/CoinsUI.gd`: placar de moedas em tempo real.
- `scripts/tycoon/PlacementController.gd`: plantio no mapa.
- `scripts/tycoon/TycoonPlant.gd`: cronômetro de renda passiva.

## Como configurar no Godot (uma vez)

1. **Abra o projeto** no Godot 4.
2. Em **Project > Project Settings > Autoload**, adicione `scripts/GameManager.gd` com o nome `GameManager`.
3. Monte sua cena principal com os nós e scripts:
   - Player (`CharacterBody2D`) com `scripts/player/PlayerController.gd`.
   - Câmera (`Camera2D`) com `scripts/player/CameraFollow.gd`.
   - Pato(s) (`Area2D`) com `scripts/world/DuckNPC.gd`.
   - Controlador de plantio (Node/Node2D) com `scripts/tycoon/PlacementController.gd`.
   - UI da loja com `scripts/ui/ShopUI.gd`.
   - UI do inventário com `scripts/ui/InventoryUI.gd`.
   - UI de moedas com `scripts/ui/CoinsUI.gd`.
4. Configure os Inputs no projeto:
   - `move_up`, `move_down`, `move_left`, `move_right`
   - `interact_click`
5. No Inspector, ajuste os `@export` de cada script (referências de nós, sprites, áudio e distâncias).

## Como jogar (passo a passo)

1. Rode a cena principal com **F5** (ou **F6** se ela já estiver aberta).
2. Ande com o personagem usando as teclas configuradas (`move_*`, normalmente WASD/setas).
3. Clique nos patos:
   - Clique curto (**menos de 0,5s**) toca som curto.
   - Clique longo (**mais de 0,5s**) toca som longo.
4. Espere até **20 segundos** para a loja atualizar estoque (o carrinho entra em alerta).
5. Clique no carrinho para abrir a loja.
6. Clique em **Obter** para pegar o item **Amogus**:
   - A loja fecha.
   - O alerta do carrinho apaga.
   - O item aparece no inventário.
7. Com o item no inventário, clique em um espaço livre da grama para plantar.
8. Após plantar, o item começa a gerar renda passiva:
   - A cada **20 segundos** toca um som no mapa.
   - Você recebe **+10 moedas** no placar.

## Dicas de debug rápido

- Se não mover: confira os Inputs `move_*`.
- Se a loja não abrir: valide os caminhos de nós exportados no `ShopUI.gd`.
- Se pato não tocar som: confira os `AudioStreamPlayer2D` e as referências do player no `DuckNPC.gd`.
- Se não plantar: cheque o `PlacementController.gd` (área válida + item no inventário).
