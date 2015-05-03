Jungle Disk seems to no longer be under active development. The server managment
client requires libnotify.so.1, however arch only has libnotify.so.4. I could have
tried dealing with that dependency, but decided that this might be a more fun way
of doing that. It actually works much better then I would have thought it would
have.

To Launch

```
docker run -ti --rm \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    jungledisk
```

Got the idea from [here][1]


[1]: http://fabiorehm.com/blog/2014/09/11/running-gui-apps-with-docker/
