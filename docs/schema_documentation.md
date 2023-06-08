# Schema Documentation

This documentation describes the database schema for the project.

## Tables
- [Addresses](#addresses)
- [Contacts](#contacts)
- [Contents](#contents)
- [Hours](#hours)
- [Logins](#logins)
- [Profiles](#profiles)
- [Services](#services)
- [Users](#users)
- [Verifications](#verifications)

---

## <a name="addresses"></a>Table: addresses

| Field        | Type         | Description                                  |
|--------------|--------------|----------------------------------------------|
| id           | integer      | ID of address                                |
| postal_code  | string       | Postal code of address                       |
| city         | string       | City of address                              |
| state        | string       | State of address                             |
| street       | string       | Street of address                            |
| created_at   | datetime     | Date and time of address creation            |
| updated_at   | datetime     | Date and time of the last address update     |
| user_id      | index        | Index to user_id column                      |

## <a name="contacts"></a>Table: contacts

| Field        | Type         | Description                                  |
|--------------|--------------|----------------------------------------------|
| id           | integer      | ID of contact                                |
| phone        | string       | Phone number of contact                      |
| email        | string       | Email address                                |
| whatsapp     | string       | Number of WhatsApp                           |
| created_at   | datetime     | Date and time of contact creation            |
| updated_at   | datetime     | Date and time of the last contact update     |

## <a name="contents"></a>Table: contents

| Field        | Type         | Description                                  |
|--------------|--------------|----------------------------------------------|
| id           | integer      | ID of content                                |
| description  | string       | Description of content                       |
| title        | string       | Title of content                             |
| created_at   | datetime     | Date and time of content creation            |
| updated_at   | datetime     | Date and time of the last content update     |
| profile_id   | index        | Index to profile_id column                   |

## <a name="hours"></a>Table: hours

| Field        | Type         | Description                                  |
|--------------|--------------|----------------------------------------------|
| id           | integer      | ID of hour                                   |
| init         | time         | Start time                                   |
| final        | time         | End time                                     |
| created_at   | datetime     | Date and time of hour creation               |
| updated_at   | datetime     | Date and time of the last hour update        |

## <a name="logins"></a>Table: logins

| Field        | Type         | Description                                    |
|--------------|--------------|------------------------------------------------|
| id           | integer      | ID of login                                    |
| audits       | jsonb        | Audits do login (array de JSON)                |
| logged       | boolean      | Indicates whether the user is logged in or not |
| created_at   | datetime     | Date and time of login creation                |
| updated_at   | datetime     | Date and time of the last login update         |
| user_id      | index        | Index to user_id column                        |

## <a name="profiles"></a>Table: profiles

| Field           | Type         | Description                                 |
|-----------------|--------------|---------------------------------------------|
| id              | integer      | ID of profile                               |
| fullname        | string       | Full name of user                           |
| slug_name       | string       | Profile name                                |
| age             | integer      | Age of user                                 |
| description     | string       | Profile description                         |
| document        | string       | User document                               |
| created_at      | datetime     | Date and time of profile creation           |
| updated_at      | datetime     | Date and time of the last profile update    |
| contact_id      | index        | Index to contact_id column                  |
| hour_id         | index        | Index to hour_id column                     |
| service_id      | index        | Index to service_id column                  |
| user_id         | index        | Index to user_id column                     |
| verification_id | index        | Index to verification_id column             |

## <a name="services"></a>Table: services

| Field        | Type         | Description                                  |
|--------------|--------------|----------------------------------------------|
| id           | integer      | ID of service                                |
| types        | integer      | Types of services (array of integers)        |
| created_at   | datetime     | Date and time of service creation            |
| updated_at   | datetime     | Date and time of the last service update     |

## <a name="users"></a>Table: users

| Field            | Type         | Description                                  |
|------------------|--------------|----------------------------------------------|
| id               | integer      | ID of user                                   |
| email            | string       | User email address                           |
| password         | string       | Password of user                             |
| confirm_password | string       | User password confirmation                   |
| created_at       | datetime     | Date and time of user creation               |
| updated_at       | datetime     | Date and time of the last user update        |

## <a name="verifications"></a>Table: verifications

| Field        | Type         | Description                                      |
|--------------|--------------|--------------------------------------------------|
| id           | integer      | ID of verification                               |
| valid        | boolean      | Indicates whether the check is valid or not      |
| created_at   | datetime     | Date and time of verification creation           |
| updated_at   | datetime     | Date and time of the last verification update    |
