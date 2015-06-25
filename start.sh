#!/bin/bash -e

fetch-crl
/usr/sbin/crond -n
