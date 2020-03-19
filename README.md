# boost-shared-mem

Playing around with boost shared memory

## Instructions

1. `docker-compose up --build`
2. Attach to created chile container
3. Run executable `./test child` to run the child version

## More ideas

* Combine with a messaging server to change memory on the parent, then publish to the child things have changed.
  * Could do another random number guesser?

## Sources

* https://www.boost.org/doc/libs/1_55_0/doc/html/interprocess/quick_guide.html