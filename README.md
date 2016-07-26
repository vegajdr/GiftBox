# GiftBOX

* Back end API to support the Gentoo gift application

**API Documentation**
----
  In order to create an account a request needs to be sent to the following endpoint. A token will be sent back in the response which needs to be sent in the header for authorization: { Authorization: token }

* **URL**

  /register

* **Method:**

  `POST`

*  **URL Params**

   **Required:**

   **Optional:**

* **Data Params**

    **Required:**

    `email=[string]`
    `password=[string]`
    `username=[string]`
    `first_name=[string]`
    `last_name=[string]`


* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `{
                    "user": {
                      "id": 9,
                      "email": "test@gentoo.com",
                      "created_at": "2016-07-26T18:50:47.647Z"
                    },
                    "token": "401f1dacf-6423e-4969-87b9-d2he6c66294c",
                    "token_expires": "2016-08-09T18:50:47.664Z"
                  }`

* **Error Response:**

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{ error : "Log in" }`

  OR

  * **Code:** 422 UNPROCESSABLE ENTRY <br />
    **Content:** `{ error : "Email Invalid" }`




* **Notes:**

  Sends back token that needs to be stored for further authentication inside the Gentoo app

----

* **URL**

  /:username/friends

* **Method:**

  `POST`

*  **URL Params**

   **Required:**

   `username=[string]`

   **Optional:**

* **Data Params**

    **Required:**

    `requested_friend=[string]`


* **Success Response:**

  * **Code:** 200 <br />

* **Error Response:**

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{ error : "Log in" }`

  OR

  * **Code:** 422 UNPROCESSABLE ENTRY <br />
    **Content:** `{ error : "Email Invalid" }`




* **Notes:**

  Creates friend request for username passed under the requested_friendship parameter
