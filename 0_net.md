
    (lldb) po manager
    <AFHTTPSessionManager: 0x6040001d9230, baseURL: (null), session: <__NSURLSessionLocal: 0x7f9831c31f90>, operationQueue: <NSOperationQueue: 0x60400063e560>{name = 'NSOperationQueue 0x60400063e560'}>

    ZTO:[ZBHttpRequestManager.m LineNum:83]    ZB_BASE_URL是：http://openapi.ztbest.com/
    ZTO:[ZBHttpRequestManager.m LineNum:140]    http://openapi.ztbest.com/V2/store/getStoreSummary
    ZTO:[ZBNetManager.m LineNum:52]    WIFI
    ZTO:[ZBNetManager.m LineNum:29]    token是  ==  eyJhbGciOiJIUzUxMiJ9.eyJ1aWQiOjI0NDM0MjcsInVuYW1lIjoi6YKT5rGf5rSyIiwiY3JlYXRlZCI6MTUzNzY5ODU5MDkxOSwiZXhwIjoxNTQ1NDc0NTkwLCJkZXZpY2UiOiJpb3MifQ.c6IXe3UeQgnVDW5-ePBV_5zb7BcFYXO-IO5x05Zc00KTxzH4D1k_klyCcwhY3j3nwyt2bvM-vnnV4rYBKx4egQ
    (lldb) po manager
    <AFHTTPSessionManager: 0x6040001d8f60, baseURL: (null), session: <__NSURLSessionLocal: 0x7f9831c4cb20>, operationQueue: <NSOperationQueue: 0x604000639b80>{name = 'NSOperationQueue 0x604000639b80'}>

    ZTO:[ZBHttpRequestManager.m LineNum:83]    ZB_BASE_URL是：http://openapi.ztbest.com/
    ZTO:[ZBHttpRequestManager.m LineNum:140]    http://openapi.ztbest.com/V2/store/getStoreSummary
    ZTO:[ZBNetManager.m LineNum:52]    WIFI
    ZTO:[ZBNetManager.m LineNum:29]    token是  ==  eyJhbGciOiJIUzUxMiJ9.eyJ1aWQiOjI0NDM0MjcsInVuYW1lIjoi6YKT5rGf5rSyIiwiY3JlYXRlZCI6MTUzNzY5ODU5MDkxOSwiZXhwIjoxNTQ1NDc0NTkwLCJkZXZpY2UiOiJpb3MifQ.c6IXe3UeQgnVDW5-ePBV_5zb7BcFYXO-IO5x05Zc00KTxzH4D1k_klyCcwhY3j3nwyt2bvM-vnnV4rYBKx4egQ
    (lldb) po manager
    <AFHTTPSessionManager: 0x6000001c0ff0, baseURL: (null), session: <__NSURLSessionLocal: 0x7f9831d6f420>, operationQueue: <NSOperationQueue: 0x60000043d320>{name = 'NSOperationQueue 0x60000043d320'}>

    (lldb) 




SB 应用， 每次网络请求， 都新建一个单例， 牛逼的逆天。
