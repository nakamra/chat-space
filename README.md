ChatSpaceのDB設計
===================
-----
####message table
| column | type | null  |key  |
|:-----:|:-----:|:-----:|:-----:|
| body | text | true |
| image | string | true |
| group_id | integer | false |t.references :group, foreign_key: true|
| user_id | integer| false |t.references :user, foreign_key: true|

####user table
| column | type | null |key |
|:-----:|:-----:|:-----:|:-----:|
| name | string | false   |add_index :name |
| e-mail | string | false |add_index :e-mail, unique: true|
| password | string | false |add_index :password  |

####group table
| column | type | null |key |
|:-----:|:-----:|:-----:|:-----:|
| user_id | integer |false ||
| group_id | integer |false||































<!-- == README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>. -->
