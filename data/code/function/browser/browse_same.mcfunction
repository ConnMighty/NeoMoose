clear @s *[custom_data~{neoui:true}]

execute store result storage browser temp.change_page.page int 1 run scoreboard players get @s browser_page

function code:browser/browse with storage browser temp.change_page
