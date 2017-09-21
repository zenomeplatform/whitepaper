Zenome.io White Paper Build 
-----

Build docker image:

```
docker build -t my_latex .
```

Compile tex sources:

```
docker run -t -i --volume $PWD:/workdir:z --workdir /workdir my_latex make
```

