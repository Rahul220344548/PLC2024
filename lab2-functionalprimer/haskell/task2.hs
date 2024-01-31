
onePlusone :: Int -> Int
onePlusone x = x + 1

main :: IO ()
main = do
    putStrLn "Welcome to the programme. Please enter your name"
    name <- getLine
    putStrLn("Hello " ++ name ++ ", hope you like Haskell.")
    let result = onePlusone 1 
    putStrLn $ "1 + 1 = " ++ show result
    