$execute unless data storage browser plots[$(id)].item run data remove storage browser plots[$(id)]

data modify storage browser temp.item set value ""
data modify storage browser temp.name set value ""
data modify storage browser temp.desc set value ""
data modify storage browser temp.join_id set value ""
data modify storage browser temp.votes set value 0
data modify storage browser temp.visits set value 0
data modify storage browser temp.players set value 0
data modify storage browser temp.owner set value "unknown"
$data modify storage browser temp.item set from storage browser plots[$(id)].item
$data modify storage browser temp.name set from storage browser plots[$(id)].name
$data modify storage browser temp.desc set from storage browser plots[$(id)].desc
$data modify storage browser temp.join_id set from storage browser plots[$(id)].join_id
$data modify storage browser temp.votes set from storage browser plots[$(id)].votes
$data modify storage browser temp.visits set from storage browser plots[$(id)].visits
$data modify storage browser temp.players set from storage browser plots[$(id)].players
$data modify storage browser temp.owner set from storage browser plots[$(id)].owner
function code:browser/calc_plot_player with storage browser temp

function code:browser/set_slot_item with storage browser temp
