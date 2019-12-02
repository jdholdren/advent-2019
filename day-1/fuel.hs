main :: IO ()
main = do
	content <- readFile "./input.txt"
	let ls = lines content
	let nums = map convert ls
	let reqs = map fuelReq nums
	let total = sum reqs
	putStr $ show total

convert :: String -> Int
convert val = read val

fuelReq :: Int -> Int
fuelReq m =
	let req = div m 3 - 2
	in if m <= 0 || req < 0
	then 0
	else req + fuelReq req
