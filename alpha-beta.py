def alphabeta(node, depth, alpha, beta, maximizingPlayer):
    if depth == 0 or game_over(node):
        return evaluate(node)
    
    if maximizingPlayer:
        value = -float("inf")
        for child in generate_moves(node):
            value = max(value, alphabeta(child, depth - 1, alpha, beta, False))
            alpha = max(alpha, value)
            if alpha >= beta:
                break  # Beta cut-off
        return value
    else:
        value = float("inf")
        for child in generate_moves(node):
            value = min(value, alphabeta(child, depth - 1, alpha, beta, True))
            beta = min(beta, value)
            if beta <= alpha:
                break  # Alpha cut-off
        return value

def minimax_alpha_beta(node, depth, maximizingPlayer):
    alpha = -float("inf")
    beta = float("inf")
    if maximizingPlayer:
        best_value = -float("inf")
        for child in generate_moves(node):
            value = alphabeta(child, depth - 1, alpha, beta, False)
            if value > best_value:
                best_value = value
                best_move = child
            alpha = max(alpha, best_value)
        return best_move
    else:
        best_value = float("inf")
        for child in generate_moves(node):
            value = alphabeta(child, depth - 1, alpha, beta, True)
            if value < best_value:
                best_value = value
                best_move = child
            beta = min(beta, best_value)
        return best_move

# Example usage
initial_state = create_initial_state()
best_move = minimax_alpha_beta(initial_state, 4, True)
