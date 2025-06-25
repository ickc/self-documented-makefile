Based on [Self-Documented Makefile](https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html). The key idea is that `make help` would be automatically generated from inline comments.

- Read [that article](https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html) for details.
- See [`makefile`](./makefile) as an example.
- Copy [`makefile.in`](./makefile.in) to your makefile and use the comment convention as in [`makefile`](./makefile) and it would just works.
- See [`help.awk`](./help.awk) to see the script that make this possible, and modify it to your liking.
