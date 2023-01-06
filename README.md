# Scylla Summit 2023 Talk

This is the code for my talk on using Ansible to orchestrate ScyllaDB clusters.

`supervisorctl` is the process that runs it all.

added `fs.aio-max-nr = 1048576` to `/etc/sysctl.conf` per - https://groups.google.com/g/scylladb-users/c/891ppg9o7ZA

look into vagrant - https://cpp-driver.docs.scylladb.com/master/topics/testing/ccm/