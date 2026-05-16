tag @s add old

setblock ~ ~ ~ barrier

rotate @s facing entity @p eyes

tp @s[y_rotation=-45..44] ~ ~ ~ 0 0
tp @s[y_rotation=45..134] ~ ~ ~ 90 0
tp @s[y_rotation=135..180] ~ ~ ~ 180 0
tp @s[y_rotation=-180..-136] ~ ~ ~ 180 0
tp @s[y_rotation=-135..-46] ~ ~ ~ -90 0
