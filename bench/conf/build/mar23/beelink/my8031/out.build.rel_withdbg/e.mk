CMake Warning at cmake/sasl.cmake:264 (MESSAGE):
  Could not find SASL
Call Stack (most recent call first):
  CMakeLists.txt:1785 (MYSQL_CHECK_SASL)


CMake Warning at cmake/ldap.cmake:158 (MESSAGE):
  Could not find LDAP
Call Stack (most recent call first):
  CMakeLists.txt:1789 (MYSQL_CHECK_LDAP)


CMake Warning at cmake/fido2.cmake:70 (MESSAGE):
  Cannot find development libraries.  You need to install the required
  packages:

    Debian/Ubuntu:              apt install libudev-dev
    RedHat/Fedora/Oracle Linux: yum install libudev-devel
    SuSE:                       zypper install libudev-devel

Call Stack (most recent call first):
  CMakeLists.txt:2039 (WARN_MISSING_SYSTEM_UDEV)


In function ‘strncat’,
    inlined from ‘my_crypt_genhash’ at /home/mdcallag/b/mysql-8.0.31/mysys/crypt_genhash_impl.cc:383:16,
    inlined from ‘my_make_scrambled_password’ at /home/mdcallag/b/mysql-8.0.31/sql/auth/password.cc:188:19:
/usr/include/x86_64-linux-gnu/bits/string_fortified.h:138:34: warning: ‘__builtin_strncat’ output may be truncated copying between 0 and 20 bytes from a string of length 20 [-Wstringop-truncation]
  138 |   return __builtin___strncat_chk (__dest, __src, __len,
      |                                  ^
/home/mdcallag/b/mysql-8.0.31/sql/parser_yystype.h:348:7: warning: type ‘union YYSTYPE’ violates the C++ One Definition Rule [-Wodr]
  348 | union YYSTYPE {
      |       ^
/home/mdcallag/b/mysql-8.0.31/storage/innobase/include/fts0pars.h:50: note: a different type is defined in another translation unit
   50 | typedef union YYSTYPE
      | 
/home/mdcallag/b/mysql-8.0.31/sql/parser_yystype.h:349:17: note: the first difference of corresponding definitions is field ‘lexer’
  349 |   Lexer_yystype lexer;  // terminal values from the lexical scanner
      |                 ^
../storage/innobase/fts0pars.y:62: note: a field with different name is defined in another translation unit
./sql/sql_yacc.cc:570: warning: type ‘yysymbol_kind_t’ violates the C++ One Definition Rule [-Wodr]
./sql/sql_hints.yy.cc:137: note: an enum with different value name is defined in another translation unit
./sql/sql_yacc.cc:576: note: name ‘YYSYMBOL_ABORT_SYM’ differs from name ‘YYSYMBOL_MAX_EXECUTION_TIME_HINT’ defined in another translation unit
./sql/sql_hints.yy.cc:143: note: mismatching definition
./sql/sql_yacc.h:51: warning: type ‘yytokentype’ violates the C++ One Definition Rule [-Wodr]
/home/mdcallag/b/mysql-8.0.31/storage/innobase/include/pars0grm.h:46: note: an enum with different value name is defined in another translation unit
   46 | enum yytokentype {
      | 
./sql/sql_yacc.h:53: note: name ‘YYEMPTY’ differs from name ‘PARS_INT_LIT’ defined in another translation unit
/home/mdcallag/b/mysql-8.0.31/storage/innobase/include/pars0grm.h:47: note: mismatching definition
   47 |   PARS_INT_LIT = 258,
      | 
