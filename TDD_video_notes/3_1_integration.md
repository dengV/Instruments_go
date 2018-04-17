
### 为什么 新建 PancakeHouseCollectionIntegrationTests，


the reason that we want to keep them separate is,


these test methods could take some time, as in real time.


Such as several seconds or longer, depending on whatever your endpoint takes to actually respond.



<hr>


<hr>


> func testLoadPancakesFromCloudFails(){ }



### we typically want to put given / when / then statements,
to help organize our test to show what we are trying to accomplish within it.



<hr>


<hr>




