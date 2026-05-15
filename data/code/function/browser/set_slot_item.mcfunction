$execute unless score $visitsallowed_plot_$(join_id) var matches 1 run item replace block 0 32 0 container.$(slot) with $(item)[\
item_name=[\
    {text:"$(name)"}\
],\
lore=[\
    {color:gray,text:"$(desc)"},\
    "",\
    [{italic:0b,color:"green",text:"$(players)"},{italic:0b,color:gray,text:" playing "}],\
    [{italic:0b,color:"green",text:"$(votes)"},{italic:0b,color:gray,text:" votes "},{italic:0b,color:"green",text:"$(visits)"},{italic:0b,color:gray,text:" visits"}],\
    [{color:gray,text:"by "},{selector:"$(owner)"}],\
    [{italic:0b,color:dark_gray,text:"#"},{italic:0b,color:"#7d4b00",text:"$(join_id)"}],\
],\
custom_data={neobrowser:plot,neoui:true,join:$(join_id)},custom_model_data={strings:["plot item"]}\
]

$execute if score $visitsallowed_plot_$(join_id) var matches 1 run item replace block 0 32 0 container.$(slot) with $(item)[\
item_name=[\
    {text:"$(name)"}\
],\
lore=[\
    {color:gray,text:"$(desc)"},\
    "",\
    {italic:0b,color:red,text:"visits disabled"},\
    [{italic:0b,color:"green",text:"$(players)"},{italic:0b,color:gray,text:" playing "}],\
    [{italic:0b,color:"green",text:"$(votes)"},{italic:0b,color:gray,text:" votes "},{italic:0b,color:"green",text:"$(visits)"},{italic:0b,color:gray,text:" visits"}],\
    [{color:gray,text:"by "},{selector:"$(owner)"}],\
    [{italic:0b,color:dark_gray,text:"#"},{italic:0b,color:"#7d4b00",text:"$(join_id)"}],\
],\
custom_data={neobrowser:plot,neoui:true,join:$(join_id)},custom_model_data={strings:["plot item"]}\
]
