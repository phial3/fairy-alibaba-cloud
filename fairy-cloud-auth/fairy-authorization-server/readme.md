### auth测试
#### 密码模式 grant_type=password

 http://localhost:8080/oauth/oauth/token?username=test&password=test&grant_type=password&client_id=fairy-cloud-gateway&client_secret=123123&scope=read

![输入图片说明](../../images/auth/%E5%AF%86%E7%A0%81%E6%A8%A1%E5%BC%8Fimage.png)

请求参数：
Get 请求
http://localhost:8080/oauth/oauth/token

参数：

```
grant_type=password&scope=read&username=test&password=test&client_secret=123123&client_id=client

```

响应：

```
{
	"access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXNzd29yZCI6bnVsbCwidXNlcl9uYW1lIjoidGVzdCIsInNjb3BlIjpbInJlYWQiXSwib3JnYW5pemF0aW9uIjoidGVzdCIsImV4cCI6MTY2NTc2NTIyNSwiYXV0aG9yaXRpZXMiOlsicHJvZHVjdF9jYXRvcnlfYWRtaW4iLCJwcm9kdWN0X2FkbWluIl0sImp0aSI6IjU0MTMzYjM1LWFjNWUtNDA5YS1iODMxLWZmODMyYjUzZDkyMyIsImNsaWVudF9pZCI6ImNsaWVudCIsIm1lbWJlcklkIjoidGVzdCJ9.PdRIu20DoGfawZ3XwZRoQ95y1_s72EZ5fxXKLP8y88M",
	"token_type": "bearer",
	"refresh_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXNzd29yZCI6bnVsbCwidXNlcl9uYW1lIjoidGVzdCIsInNjb3BlIjpbInJlYWQiXSwib3JnYW5pemF0aW9uIjoidGVzdCIsImF0aSI6IjU0MTMzYjM1LWFjNWUtNDA5YS1iODMxLWZmODMyYjUzZDkyMyIsImV4cCI6MTY2NTY4MjQyNSwiYXV0aG9yaXRpZXMiOlsicHJvZHVjdF9jYXRvcnlfYWRtaW4iLCJwcm9kdWN0X2FkbWluIl0sImp0aSI6ImEzNTA3NzZjLTAyMWUtNGU4My04ODQ5LWNlMmQ4MWFlNGUyNCIsImNsaWVudF9pZCI6ImNsaWVudCIsIm1lbWJlcklkIjoidGVzdCJ9.pramMUTAYaE7_5FPc-oow4nXMj19CMlRho-Ah_H9hb8",
	"expires_in": 86399,
	"scope": "read",
	"password": null,
	"organization": "test",
	"memberId": "test",
	"jti": "54133b35-ac5e-409a-b831-ff832b53d923"
}
```


#### 刷新token

![输入图片说明](../../images/oath/%E5%88%B7%E6%96%B0tokenimage.png)

请求参数：
get请求：
http://localhost:8080/oauth/oauth/token

```
grant_type=refresh_token&client_id=client&client_secret=123123&refresh_token=
```
响应结果：

```
{
	"access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXNzd29yZCI6bnVsbCwidXNlcl9uYW1lIjoidGVzdCIsInNjb3BlIjpbInJlYWQiXSwib3JnYW5pemF0aW9uIjoidGVzdCIsImV4cCI6MTY2NTc2NTI2NSwiYXV0aG9yaXRpZXMiOlsicHJvZHVjdF9jYXRvcnlfYWRtaW4iLCJwcm9kdWN0X2FkbWluIl0sImp0aSI6IjhiZDQxYmRmLWU5ZmEtNDc5OS04N2EwLWFmYzIyOWZhOTYwYyIsImNsaWVudF9pZCI6ImNsaWVudCIsIm1lbWJlcklkIjoidGVzdCJ9.s0PTBJL9Ia-VBOXnTGICknM6vCzJc-NjVURZk16CWxs",
	"token_type": "bearer",
	"refresh_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXNzd29yZCI6bnVsbCwidXNlcl9uYW1lIjoidGVzdCIsInNjb3BlIjpbInJlYWQiXSwib3JnYW5pemF0aW9uIjoidGVzdCIsImF0aSI6IjhiZDQxYmRmLWU5ZmEtNDc5OS04N2EwLWFmYzIyOWZhOTYwYyIsImV4cCI6MTY2NTY4MjQ2NSwiYXV0aG9yaXRpZXMiOlsicHJvZHVjdF9jYXRvcnlfYWRtaW4iLCJwcm9kdWN0X2FkbWluIl0sImp0aSI6ImJkZjc5MjFmLTI0MjAtNDM0OC1hNzg5LTFiZjVjOWNjNDI0ZiIsImNsaWVudF9pZCI6ImNsaWVudCIsIm1lbWJlcklkIjoidGVzdCJ9.nfuaIDWRyHYoTm4TnAUyGAzCHMMU-1HFsogAtDmmW5k",
	"expires_in": 86399,
	"scope": "read",
	"password": null,
	"organization": "test",
	"memberId": "test",
	"jti": "8bd41bdf-e9fa-4799-87a0-afc229fa960c"
}
```
