### Overview

This document details the modeling conventions to use for tables, attributes and constraints definition in the Loris SQL database. These guidelines should be followed when submitting a Pull Request to the Loris repository as well as when reviewing the PR of a peer developer.

***Disclosure:** Due to the previous lack of standard in modeling, we acknowledge that existing tables do not abide by the rules described below. As the codebase and database are being cleaned-up, the existing infrastructure will be re-designed to follow this guideline.*

### Table

- The table name should be in **snake_case**.  
  - The table name should **start** with an **lower case letter**.
  - The table name made of **multiple word** should use an **underscore** in order to separate each of them.
- The table name should be in **singular form**.
- The table name should contain **English words** only in order to be understanded by most.
- The table name should **not contain abbreviation**.
- The table name should be a **noun**, as concise as possible.
  - *When choosing the name of a table containing data for a **single entity in Loris** such as a Candidate, Session, User, recommended names for these entities are `candidate`, `session` and `user`.*
- When a **single word is not sufficient** to describe a table, the ordering of the words in the name should reveal the concern of the table in a broad-to-specific manner. 
  - *i.e. A table containing the consent information of a candidate would be named `candidate_consent`, candidate being the broader concern and just `consent` is not sufficiently informative to rule out user consents and examiner consents. A table containing the consent types would be called as such `consent_type`.*
- **Accronym** are permitted only if the name would be to long and the accronym is **commonly used by the community**. The accronym should **only contain upper case letter**.
- When creating a table representing a **relation between two or more tables**. Regardless of the relation type (one-to-many, many-to-one or one-to-one), the table should have a composite name as such `table1_table2_rel`.
  - *i.e. the table mapping users to their permissions would be named `user_permission_rel` where `user` is the name of the Users' entity table and `permission` is the name of the Permissions' entity table*

### Field

- The field name should be in **UpperCamelCase**.
  - The field name should **start** with an **Upper case letter**.
  - The field name should **not contain underscore**.
- The field name should be in **singular form**.
- The field name should contain **English word** only in order to be understanded by most.
- The field name should **not contain abbreviation**.
- **Accronym** are permitted only if the name would be to long and the accronym is **commonly used by the community**. The accronym should **only contain upper case letter**.
- The **primary key** field of a table should of type `int`.
- The **primary key** field of a table should be named `<TableName>ID`.  
  - *i.e. the name of the primary identifier of the `candidate` table should be `CandidateID`.*
- When adding a field which serves as a **foreign key to another table** in the database, the field should follow the same convention as above `ReferenceTableNameID`. 
  - *i.e. The session table would have a primary identifier field named `sessionID` and a foreign key reference to the `candidate` table with a field named `CandidateID`.*
- When two(2) fields refer to the **same foreign key id**, a qualifier should be added to the name.
  - *i.e. Two fields pointing to the candidateID in the same table should be named like in `ParentCandidateID` and `ChildCandidateID`.
- **Date** fields should not be named `Date` but more concisely like `DateStart`. `Date` should be at the beginning of the name followed by the qualifier.
- **No ENUM attributes** should be used. Instead a lookup table to refer to possible choices should be used.

#### Field Ordering

- The primary key is always in the first field.
- Fix size fields are to be positioned before variable size fields.  
  1 Numeric, Date, Char  
  2 Varchar (indexed field first)  
  3 Text, Json  
  4 Blob  
- Mandatory fields should be place before optional attributes of the same type.


### Constraints

- The constraint name should be **specifically declared**, do not rely on default naming.
- The constraint name should be in **singular form**.
- The constraint name should be of the **proper format**:
  - **Primary key** `<table_name>_ID_PK`
  - **Unique key** `<table_name>_<ColumnName(s)>_UK`
  - **Foreign key** `<table_name>_<ColemnName>_<ref_table_name>_<RefColumnName>_FK`
  - **Check constraint** `<table_name>_<ColumnName>_<Check>_CK`
- A **foreign key** constraint definition should contain `ON DELETE` and `ON UPDATE` clause. Do not rely on default behavior.

### Other parameters
- Be explicit instead of implicit. 
- Engine should be InnoDB for all tables unless specific requirement demand. `ENGINE=InnoDB`.
- Character set is UTF-8 `CHARSET=utf8`.


