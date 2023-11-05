# Cuong Vo - 131116

# Algorithms Documentation

game <- list(
  "player1" = array(c(1, 0, 0, 1), dim = c(2, 2)),
  "player2" = array(c(1, 0, 0, 1), dim = c(2, 2))
)

getAllPureStrategyNE <- function(game_var){

  # Initial for data processing
  game_index <- list()
    n_player <- length(game_var)
  n_action <- dim(game_var[[1]])
  
  # Create action profile for each player
  for (i in (1 : n_player)){
    d <- dim(game_var[[i]])[i]
    game_index <- c(game_index, list(array(1:d)))
  }
  profiles <- expand.grid(game_index)
  names(profiles) <- names(game_var)
  
  # Create amount profile for each player
  profiles_amt <- data.frame(as.vector(game_var[[1]]))
  for (i in (2 : n_player)) {
    profiles_amt <- cbind(profiles_amt, as.vector(game_var[[i]]))
  }
  names(profiles_amt) <- names(profiles)
  
  # Initial for nash equi calculating
  total_action <- dim(profiles)[1]
  nash_equi <- matrix(FALSE, nrow = total_action, ncol = n_player)
  
  # Nash equilibrium calculating - Highlight for the best move that not depend on other player's move
  for (i in (1 : n_player)){
    for (j in (1 : n_action[i])){
      action_list <- c()
      for (k in (1 : total_action)){
        if (profiles[k,i] == j) {
          action_list <- c(action_list, profiles_amt[k,i])   
        }
      }
      best_move <- max(action_list)
      for (k in (1 : total_action)){
        if ((profiles[k,i] == j) && (profiles_amt[k,i] == best_move)){
          nash_equi[k,i] = TRUE
        }
      }
    }
  }
  
  # Initial for get data
  n = dim(nash_equi)[1]
  m = dim(nash_equi)[2]
  result_nash = list()
  name_res = c()
  tmp = c()
  
  # Nash equilibrium get result
  for (i in (1 : n)){
    flag = 1
    for (j in (1 : m)){
      if (nash_equi[i,j] == FALSE) flag = 0 
    }
    if (flag == 1){ # If action is highlight for all player
      name_res <- c(name_res, paste(profiles[i,], collapse = ''))
      tmp = c()
      for (j in (1 : m)){
        tmp <- c(tmp, profiles[i,j])
      } 
      result_nash <- c(result_nash, list(tmp))
    }
  }

  names(result_nash) <- name_res
  return(result_nash)
}

getAllPureStrategyNE(game)

