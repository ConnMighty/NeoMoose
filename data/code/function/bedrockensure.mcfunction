$setblock $(id)0000 61 0 test_block[mode=start]

$execute if block $(id)0000 61 0 test_block positioned $(id)0000 61 0 unless entity @n[type=marker,tag=PLOT,distance=..1] run summon marker $(id)0000 61 0 {Tags:["PLOT"]}