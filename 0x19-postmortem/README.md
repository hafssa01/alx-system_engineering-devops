# Postmortem: Web Application Outage

## Issue Summary

- **Duration of the outage**: August 20, 2024, from 10:00 AM to 12:30 PM UTC (2.5 hours).
- **Impact**: The entire web application was down. Users experienced a "504 Gateway Timeout" error. Approximately 85% of users were unable to access the service during this period.
- **Root Cause**: The root cause of the outage was an unexpected overload on the primary database server caused by a misconfigured database query that led to high CPU usage and timeouts.

## Timeline

- **10:00 AM** - Monitoring alert triggered due to high CPU usage on the database server.
- **10:05 AM** - Users started reporting issues accessing the web application. Reports indicated "504 Gateway Timeout" errors.
- **10:10 AM** - Initial investigation started. Engineers checked the web server logs for connectivity issues.
- **10:30 AM** - Network issues ruled out as the cause. The investigation shifted focus to the database server.
- **11:00 AM** - Identified a newly deployed feature with a poorly optimized SQL query, causing high CPU usage.
- **11:15 AM** - The issue was escalated to the database management team for resolution.
- **11:30 AM** - Decision made to roll back the latest deployment to mitigate the impact.
- **12:00 PM** - Rollback completed. CPU usage started to normalize.
- **12:30 PM** - Full service was restored, and users were able to access the application without issues.

## Root Cause and Resolution

- **Root Cause**: The issue was traced back to a recently deployed feature containing a SQL query that performed a non-indexed search on a large database table. This query caused excessive CPU usage on the database server, leading to slow response times. Consequently, the web server timed out while waiting for responses, resulting in "504 Gateway Timeout" errors for users.
  
- **Resolution**: The immediate fix was to roll back the recent deployment, which removed the problematic query. This rollback reduced the CPU load on the database server and resolved the service timeouts. After rollback, the development team analyzed the query, added necessary indexes, and restructured it for better performance.

## Corrective and Preventative Measures

1. **Enhance Code Review Processes**: Implement a stricter code review process focusing on database query optimization and indexing.
2. **Implement Database Query Monitoring**: Introduce real-time monitoring and alerting for slow-running queries.
3. **Stress Testing for New Deployments**: Conduct stress testing on all new features to simulate high load and identify potential bottlenecks before deployment.
4. **Audit Existing Queries**: Review and optimize existing queries in the database to prevent similar issues.
5. **Phased Deployment Strategy**: Adopt a phased deployment approach with automatic rollback capabilities to reduce the impact of new issues.
6. **Training**: Provide training sessions for the development team on writing efficient SQL queries and using indexing effectively.

## Tasks to Address the Issue

- [ ] Patch and update the database server for better performance.
- [ ] Configure monitoring tools to track query performance metrics.
- [ ] Develop a standard operating procedure for stress testing new deployments.
- [ ] Perform a full audit of all database queries to optimize them.
- [ ] Update the deployment process to include phased releases and rollback plans.
- [ ] Organize training sessions for developers on SQL optimization and best practices.

