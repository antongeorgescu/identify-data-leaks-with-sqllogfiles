SELECT COUNT(*) FROM sys.fn_dblog(NULL,NULL) WHERE operation IN ('LOP_INSERT_ROWS');

SELECT [Current LSN], 
       Operation, 
       Context, 
       [Transaction ID], 
       [Begin time]
       FROM sys.fn_dblog
   (NULL, NULL)
  WHERE operation IN
   ('LOP_INSERT_ROWS')
  ORDER BY [Transaction ID] DESC;

SELECT COUNT(*) FROM sys.fn_dblog(NULL,NULL) WHERE operation IN ('LOP_INSERT_ROWS');
