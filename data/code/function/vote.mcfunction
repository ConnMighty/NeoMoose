scoreboard players reset @s vote

# owner can't vote for their own plot
$execute if score @s id matches $(id) run return run tellraw @s {color:red,italic:1b,text:"You can't vote for your own plot!"}

# you can only vote once
$execute if data storage browser plots[{join_id:$(id),voters:["$(name)"]}] run return run tellraw @s {color:red,italic:1b,text:"You've already voted for this plot!"}
$tellraw @a[scores={currentplot=$(id)}] [{bold:1b,italic:1b,selector:"@s"},{bold:1b,color:green,italic:1b,text:" voted for this plot!"}]
execute at @s run playsound entity.player.levelup master @a ~ ~ ~ 2

# increase votes by 1
scoreboard players reset @s vote_math
$execute store result score @s vote_math run data get storage browser plots[{join_id:$(id)}].votes
scoreboard players add @s vote_math 1
$execute store result storage browser plots[{join_id:$(id)}].votes int 1 run scoreboard players get @s vote_math

# add name to voters list
$data modify storage browser plots[{join_id:$(id)}].voters append value "$(name)"
