fade_time = keyleds.config.delay or 1
bg_color = tocolor(keyleds.config.bg) or tocolor('purple')
echo_color = tocolor(keyleds.config.echo) or tocolor('red')

buffer = RenderTarget:new()
buffer:fill(bg_color)

function onKeyEvent(key, isPress)
    if isPress then
        buffer[key] = echo_color
    else
        buffer[key] = fade(2, bg_color)
    end
end

function render(ms, target)
    target:blend(buffer)
end
