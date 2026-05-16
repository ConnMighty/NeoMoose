data modify storage browser temp.visiting_disabled set value ""
$execute if score $visitsallowed_plot_$(join_id) var matches 1 run data modify storage browser temp.visiting_disabled set value "{italic:0b,color:red,text:'visits disabled'},"

function code:browser/set_slot_item with storage browser temp
