# Nginx Performance Optimization - Web Stack Debugging Task

## Task Overview

This task is aimed at optimizing the Nginx web server to handle high traffic loads more efficiently by minimizing failed requests. The goal is to improve the server's performance under heavy load using ApacheBench, a popular tool for HTTP server benchmarking.

## Task Objective

We observed that our Nginx web server was experiencing a significant number of failed requests when subjected to a high volume of HTTP requests. Specifically, out of 2000 requests sent, 943 requests failed. The objective of this task is to tune the Nginx configuration to handle all requests successfully, reducing the number of failed requests to zero.

## Tools Used

- **Nginx:** The web server being configured and optimized.
- **ApacheBench (ab):** A benchmarking tool used to simulate HTTP requests to the server and test its performance under load.
- **Puppet:** A configuration management tool used to apply configuration changes.

## Initial Test Results

Before optimization, the test using ApacheBench showed:

- Total requests: 2000
- Failed requests: 943
- Non-2xx responses: 1057

## Optimization Steps

To address the high number of failed requests, we optimized the Nginx configuration by adjusting the worker processes and worker connections. This optimization aims to improve the server's ability to handle a high number of simultaneous connections.

### Key Changes in `0-the_sky_is_the_limit_not.pp`

- **Increased Worker Processes:** Set the number of worker processes to the number of available CPU cores. This allows Nginx to handle multiple requests concurrently.
- **Increased Worker Connections:** Increased the number of worker connections that each worker process can handle. This allows each process to manage more connections simultaneously.

Here’s a snippet of what the Puppet configuration might look like:

```puppet
# 0-the_sky_is_the_limit_not.pp
# Puppet configuration file to optimize Nginx performance

exec { 'fix--for-nginx':
    command => '/usr/sbin/nginx -s reload',
    path    => '/usr/bin:/usr/sbin:/bin:/sbin',
}

