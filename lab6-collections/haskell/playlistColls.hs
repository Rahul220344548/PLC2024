module Main where

import Text.Printf

data Product
    = Product
        {
          product_name :: String
        , product_brand :: String
        }
    deriving (Eq)
-- Methods Check
instance Show Product where 
    show (Product name brand) = 
        printf "%s by %s" name brand
data Item
    = Piece
        {
            item_name :: String,
            item_performer :: String,
            item_length_secs :: Float
        }
    | Advert
        {
            item_product :: Product,
            item_length_secs :: Float
        }
    deriving (Eq)
-- Methods Check
isAdvert (Advert _ _) = True
isAdvert _ = False

-- Function ItemOK 
itemOK (Piece _ _ len) = 0 < len && len < 36000
itemOK (Advert _ len) = 0 < len && len < 120

instance (Show Item) where
    show (Piece name performer len) =
        printf "%s by %s (%.1fs)" name performer len
    show (Advert product len) =
        printf "Advert for %s (%.1fs)" (show product) len

piece1 = Piece "Moonlight" "C. Arrau" (17*60+26)
piece2 = Piece "Pathetique" "D. Barenboim" (16*60+49)
advert1 = Advert (Product "Bounty" "Mars") 15
advert2 = Advert (Product "Lux" "P&G") 14

playlist1 = [piece1, advert1, piece2, advert2]

lengths1 = [ item_length_secs item | item <- playlist1 ]

playlist1noAds = [ item | item <- playlist1, not (isAdvert item) ]

playlist2 = [piece2, advert1]

playlists = [playlist1, playlist2] -- a list of lists


-- Write a two-level list comprehension that constructs a list of all advertisements that
-- occur inside the multiple playlists in the variable playlists. Your comprehension
-- must depend on the global variable playlists, and no other global variable. 

adsFromPlaylists = [item | list <- playlists, item <- list, isAdvert item]  -- TASK 6.4(b)
rintf "playlist1noAds = %s\n" (show playlist1noAds)

-- Write a list comprehension that constructs a list of all pieces that are stored (among
-- other values) in the list in variable things. The comprehension must work according
-- to this specification no matter what the content of the variable things is. 
shortItemLenghts1 = [item_length_secs item | item <- playlist1, item_length_secs item < 20] 


main =
    do
    printf "playlist1 = %s\n" (show playlist1)
    printf "lenghts1 = %s\n" (show lengths1)
    printf "playlist1noAds = %s\n" (show playlist1noAds)
    printf "shortItemLenghts1 = %s\n" (show shortItemLenghts1)
    putStrLn ""
    printf "playlist2 = %s\n" (show playlist2)
    printf "playlists = %s\n" (show playlists)
    printf "adsFromPlaylists = %s\n" (show adsFromPlaylists)

