
ChatSpaceのDB設計
===================
-----
####messages table
| column | type | null  |key  |
|:-----:|:-----:|:-----:|:-----:|
| body | text | true |
| image | string | true |
| group_id | integer | false |t.references :group, foreign_key: true|
| user_id | integer| false |t.references :user, foreign_key: true|

####users table
| column | type | null |key |
|:-----:|:-----:|:-----:|:-----:|
| name | string | false   |add_index :name |
| e-mail | string | false |add_index :e-mail, unique: true|
| password | string | false |add_index :password  |

####groups table
| column | type | null |key |
|:-----:|:-----:|:-----:|:-----:|
| group_name | string |false ||
| message_id | integer |false |t.references :message, foreign_key: true|
| user_id   | integer | false |t.references :user, foreign_key: true|

####groups_users table
| column | type | null |key |
|:-----:|:-----:|:-----:|:-----:|
| user_id | integer |false |t.references :user, foreign_key: true|
| group_id | integer |false|t.references :group, foreign_key: true|
