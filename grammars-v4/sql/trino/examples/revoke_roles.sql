REVOKE role1 FROM user1;
REVOKE ADMIN OPTION FOR role1, role2, role3 FROM user1, USER user2, ROLE role4;
REVOKE ADMIN OPTION FOR role1 FROM user1 GRANTED BY admin;
REVOKE ADMIN OPTION FOR role1 FROM USER user1 GRANTED BY USER admin;
REVOKE role1 FROM ROLE role2 GRANTED BY ROLE admin;
REVOKE "role1" FROM ROLE "role2" GRANTED BY ROLE "admin";
REVOKE role1 FROM user1 IN my_catalog;
