data modify storage browser temp.item set value ""
data modify storage browser temp.name set value ""
data modify storage browser temp.desc set value ""
data modify storage browser temp.join_id set value ""
$data modify storage browser temp.item set from storage browser plots[$(id)].item
$data modify storage browser temp.name set from storage browser plots[$(id)].name
$data modify storage browser temp.desc set from storage browser plots[$(id)].desc
$data modify storage browser temp.join_id set from storage browser plots[$(id)].join_id

function code:browser/set_slot_item with storage browser temp
