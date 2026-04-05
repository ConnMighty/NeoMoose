execute at @s run playsound ui.button.click master @s ~ ~ ~ .3

$dialog show @s {type:"minecraft:multi_action",title:"",body:{type:"minecraft:plain_message",contents:"enter the id of the player that you want to visit:"},inputs:[{type:"minecraft:text",key:"id",label:["(your id is: $(myid)$(macroend)