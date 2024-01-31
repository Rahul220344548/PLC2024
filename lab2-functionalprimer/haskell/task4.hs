ask :: String -> IO ()
ask prompt =
  do
  putStrLn prompt
  line <- getLine
  if line == ""
    then ask (prompt ++ "i")
    else if line == "quit" then putStrLn "quiting..."
    else do
      putStrLn ("you said: " ++ reverse line)
      ask prompt


main :: IO ()
main =
  do
  let prompt = "please say something"
  ask prompt 