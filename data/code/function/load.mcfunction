# forceload spawn
forceload remove all
forceload add 0 0 0 0

# gamerules
gamerule doMobSpawning false
gamerule mobGriefing false
gamerule doFireTick false
gamerule doImmediateRespawn true
gamerule locatorBar false
gamerule announceAdvancements false

# scores
scoreboard objectives add var dummy
scoreboard objectives add count dummy
scoreboard objectives add left custom:minecraft.leave_game
scoreboard objectives add died deathCount
scoreboard objectives add use used:carrot_on_a_stick
scoreboard objectives add currentplot dummy
scoreboard objectives add id dummy
scoreboard objectives setdisplay list id

# neoedit scores
scoreboard objectives add ne_x1 dummy
scoreboard objectives add ne_y1 dummy
scoreboard objectives add ne_z1 dummy
scoreboard objectives add ne_x2 dummy
scoreboard objectives add ne_y2 dummy
scoreboard objectives add ne_z2 dummy

# triggers
scoreboard objectives add join trigger
scoreboard objectives add spawn trigger
scoreboard objectives add gamemode trigger
scoreboard objectives add myplotsettings trigger
    scoreboard objectives add default_visitor_gamemode trigger
    scoreboard objectives add give_plotbuilding_items trigger
    scoreboard objectives add allow_visits trigger
    scoreboard objectives add allow_visitor_block_interactions trigger
    scoreboard objectives add disableothertriggers trigger
\

# teams
team add neomoose
team modify neomoose prefix [{color:"#ff96ff",text:"ɴᴇᴏᴍᴏᴏꜱᴇ"},{color:dark_gray,text:" | "}]
team modify neomoose color light_purple

team add neoadmin
team modify neoadmin prefix [{color:"#FF0033",text:"ɴᴇᴏᴀᴅᴍɪɴ"},{color:dark_gray,text:" | "}]
team modify neoadmin color red

team add default
team modify default color white

# load message
execute at @a run playsound block.note_block.bit master @a ~ ~ ~ 2 1.3
tellraw @a { "color": "#49cbff", "text": "NeoMoose Datapack Loaded"}