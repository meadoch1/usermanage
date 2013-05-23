User Manage Web Application

The User Manage application is a standard Rails 3.2.x web
application.  It can be installed on any system which meets the
requirements of Ruby 1.9.3 and Rails 3.2.x.

Please contact your system administrator to have it installed and made
accessible to you.


Development and System Admin Security Notes:

*  If this application is installed to manage users of a system with
   any sensitive data it should only installed within a secure environment
   as it does not yet have authentication and authorization built into
   it.  Take all appropriate network, firewall, or other security
   measures merrited by the data in the system you install it for.

*  This system by default uses SQLLite as it's database source.  You
   can adjust this by altering the Gemfile and config/database.yml to
   your needs.

*  To setup a new database issue the following commands:
       rake db:migrate
       rake db:seed
