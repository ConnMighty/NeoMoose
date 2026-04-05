tp @s 0 62 0
spawnpoint @s 0 62 0
attribute @s minecraft:block_interaction_range base reset
data remove entity @s fall_distance
data remove entity @s Motion
data modify entity @s Health set value 20
clear @s
effect clear @s
gamemode adventure @s
item replace entity @s hotbar.4 with \
    carrot_on_a_stick\
    [\
        custom_data={\
            item:"navigator",\
        },\
        minecraft:custom_name={\
            extra:[\
                {\
                    bold:1b,\
                    color:"light_purple",\
                    italic:0b,\
                    text:"Click to Play",\
                    underlined:0b,\
                }\
            ],\
            text:"",\
        },\
        item_model="minecraft:compass",\
    ]
\
tag @s add gotnav