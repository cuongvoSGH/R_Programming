# Cuong Vo - 131116

# Algorithms Documentation
# Step 1:
#   Have to reduce the dimension of the action profiles. The input data is multi dimensions 
#   Using expand.grid() function to reduce dimension of action profiles to [number of player x Total action]
# Step 2:
#   For each action profiles, check for each player
#   If at that action profile, there is a other player has incentives to deviate from it, 
#   mark FALSE for that action profiles of this player, 
#   If no player have incentives to deviate, mark TRUE for this action profiles of this player
# Step 3:
#   Nash equilibrium is the action profiles that all player have TRUE in the action profiles 

# Example 1
game <- list(
  "player1" = array(c(1, 0, 0, 0, 0, 0, 0, 1), dim = c(2, 2, 2)),
  "player2" = array(c(1, 0, 0, 0, 0, 0, 0, 1), dim = c(2, 2, 2)),
  "player3" = array(c(1, 0, 0, 0, 0, 0, 0, 1), dim = c(2, 2, 2))
)

# Example 2
game <- list(
  "player1" = array(c(5, 10, 1, 2), dim = c(2, 2)),
  "player2" = array(c(5, 1, 10, 2), dim = c(2, 2))
)


getAllPureStrategyNE <- function(game_var){
  
  # This function use to check for whether player have incentive to derivative the move or not
  Action_Search <- function(current_step, new_flip, action_profiles, current_player, action_total, n_player){
    current_action_profiles <- c()
    for (e in 1:n_player){
      current_action_profiles <- c(current_action_profiles, action_profiles[current_step, e])
    }
    current_action_profiles[current_player] <- new_flip
    for (e in 1:action_total){
      tmp <- c()
      for (f in 1:n_player){
        tmp <- c(tmp, action_profiles[e,f])
      }
      if (sum(tmp == current_action_profiles) == n_player) {
        return(e)
      }
    }
  }
  
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
  nash_equi <- matrix(TRUE, nrow = total_action, ncol = n_player)
  
  # Check for each action profiles and for each player, each player check for each move type 
  for (i in 1:n_player){ 
    for (j in 1:total_action){ 
      for (k in 1:n_player){ 
        if (i != k) {
          for (h in 1:n_action[k]){ 
            if (h != profiles[j,k]) { 
              action <- Action_Search(j, h, profiles, k, total_action, n_player)
              if (profiles_amt[j,k] < profiles_amt[action,k]){
                nash_equi[j,i] = FALSE
                break
              }
            }
          }  
        }
        if (nash_equi[j,i] == FALSE) break
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

