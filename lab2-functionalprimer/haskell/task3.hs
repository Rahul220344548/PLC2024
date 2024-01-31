sgn x = if x < 0 then -1 
    else if x == 0 then 0 
    else 1


signum2 n | n < 0 = -1
          | n ==0 = 0 
          | otherwise = 1 

main = do
    putStrLn "Please enter a number"
    input <- getLine 
    let n = (read input :: Int)
    putStrLn( show (signum2 (n)) )
    
    