termux_step_pre_configure() {
    LUA_H=$(dirname $(find /data/data/ -iname lua.h | grep luajit))
    sed -i "s/-I\$(WITH_LUAJIT)\/include\/luajit-2.1/-I${LUA_H//\//\\\/}/g" Makefile
}
