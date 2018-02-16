# Structure of the project and update instructions

- setup.sh is the only script to run to setup the whole environment, it calls setup.sh in the subdirectories
- each subdirectory setup part of the environment, try to keep them atomic, so that they can be mixed in different ways depending on the needs
- create individual setup.sh so that they can be rerun multiple time, this helps development of other content
-- start cleaning up what you redo on reruns
-- skip steps that are already done, expecially if heavy to run (e.g. do not install a component if already done)
- when possible run components in docker container and start with docker-composer (see agents as example), use a docker-composer.yml for each component
