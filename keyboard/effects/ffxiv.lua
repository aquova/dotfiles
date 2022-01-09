-- keyleds script for Final Fantasy XIV

black = tocolor('black')
wasd = keyleds.groups[keyleds.config.wasd] or keyleds.db
hotkeys = keyleds.groups[keyleds.config.hotkeys] or keyleds.db
character = keyleds.groups[keyleds.config.character] or keyleds.db
logs = keyleds.groups[keyleds.config.logs] or keyleds.db
modifier_keys = keyleds.groups[keyleds.config.modifiers] or keyleds.db
misc_keys = keyleds.groups[keyleds.config.misc] or keyleds.db

num_modifiers = 0

function init()
    buffer = RenderTarget:new()
    buffer:fill(black)

    set_group(wasd, tocolor('aqua'))
    set_group(hotkeys, tocolor('red'))
    set_group(character, tocolor('blue'))
    set_group(logs, tocolor('yellow'))
    set_group(modifier_keys, tocolor('green'))
    set_group(misc_keys, tocolor('green'))
end

function set_group(group, color)
    for i = 1, #group do
        local key = group[i]
        buffer[key] = color
    end
end

function onKeyEvent(key, isPress)
    if group_contains(key, modifier_keys) then
        if isPress then
            num_modifiers = num_modifiers + 1
        else
            num_modifiers = num_modifiers - 1
        end

        if num_modifiers == 2 then
            set_group(hotkeys, tocolor('tomato'))
        elseif num_modifiers == 1 then
            set_group(hotkeys, tocolor('orangered'))
        else
            set_group(hotkeys, tocolor('red'))
        end
    end
end

function group_contains(key, group)
    for i = 1, #group do
        local k = group[i]
        if k == key then
            return true
        end
    end
    return false
end

function render(ms, target)
    target:blend(buffer)
end
