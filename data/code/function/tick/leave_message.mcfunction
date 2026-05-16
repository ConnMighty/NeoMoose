execute if score @s currentplot matches -1 run return fail
$tellraw @a[scores={currentplot=$(id)},name=!$(myname)] [{color:gray,text:"["},{color:aqua,text:"←",click_event:{action:"run_command",command:"/trigger spawn"},hover_event:{action:"show_text",value:[{selector:"@s"},{color:white,text:" joined lobby"},{color:gray,italic:1b,text:"\nClick to join"}]}},{color:gray,text:"] "},{selector:"@s"}]
