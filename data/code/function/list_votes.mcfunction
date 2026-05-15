scoreboard players reset @s list_votes

$execute if data storage browser plots[{join_id:$(id),votes:0}] run return run tellraw @s [{color:green,text:"This plot has "},{color:gold,text:"0"}," vote(s)"]
$tellraw @s [{color:green,text:"This plot has "},{color:gold,nbt:"plots[{join_id:$(id)}].votes",storage:browser}," vote(s)\n",{color:dark_green,text:"from:\n"},{color:light_purple,nbt:"plots[{join_id:$(id)}].voters[]",storage:browser}]
