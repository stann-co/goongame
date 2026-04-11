///@desc there's 1 in x chance that this returns true
function chance(_chance = 1){
    return irandom(_chance-1) == 0
}