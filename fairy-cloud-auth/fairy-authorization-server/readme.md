## 几种Oauth2认证方式
### 密码模式 grant_type=password

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

密码模式 post请求：
![输入图片说明](../../images/oath/%E5%AF%86%E7%A0%81%E6%A8%A1%E5%BC%8Fpost%E8%AF%B7%E6%B1%82image.png)

![输入图片说明](../../images/oath/%E5%AF%86%E7%A0%81%E6%A8%A1%E5%BC%8Fpost%E8%AF%B7%E6%B1%82%E4%BD%93image.png)


```
请求： http://localhost:8080/oauth/oauth/token?grant_type=password&scope=read
```

### 授权码模式


```
http://localhost:8080/oauth/oauth/authorize?response_type=code&client_id=client&redirect_uri=http://www.baidu.com&scope=read
```

![输入图片说明](../../images/auth/%E6%8E%88%E6%9D%83%E7%A0%81image.png)


登陆：
get请求：

```
 http://localhost:8080/oauth/oauth/token?grant_type=authorization_code&client_id=client&client_secret=123123&scope=read&code=1oOxoo&redirect_uri=http://www.baidu.com
```
![输入图片说明](../../images/oath/%E6%8E%88%E6%9D%83%E7%A0%81%E6%A8%A1%E5%BC%8Fimage.png)

响应结果：

```
{
	"access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXNzd29yZCI6bnVsbCwidXNlcl9uYW1lIjoidGVzdCIsInNjb3BlIjpbInJlYWQiXSwib3JnYW5pemF0aW9uIjoidGVzdCIsImV4cCI6MTY2NjAwMjkwMCwiYXV0aG9yaXRpZXMiOlsicHJvZHVjdF9jYXRvcnlfYWRtaW4iLCJwcm9kdWN0X2FkbWluIl0sImp0aSI6ImVmZmZjNzQxLTU4OWQtNGRjYS1iNWQ5LTBiYTgwZjY1M2JhMiIsImNsaWVudF9pZCI6ImNsaWVudCIsIm1lbWJlcklkIjoidGVzdCJ9.4Yol2WSOsykqncjpzPgfU1o8WxEUTYCJOkfgm7mzdIA",
	"token_type": "bearer",
	"refresh_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXNzd29yZCI6bnVsbCwidXNlcl9uYW1lIjoidGVzdCIsInNjb3BlIjpbInJlYWQiXSwib3JnYW5pemF0aW9uIjoidGVzdCIsImF0aSI6ImVmZmZjNzQxLTU4OWQtNGRjYS1iNWQ5LTBiYTgwZjY1M2JhMiIsImV4cCI6MTY2NTkyMDEwMCwiYXV0aG9yaXRpZXMiOlsicHJvZHVjdF9jYXRvcnlfYWRtaW4iLCJwcm9kdWN0X2FkbWluIl0sImp0aSI6ImExODQyZWI0LThkZDMtNDc3MS1iZTcyLTNhYzRkYmMwYzI4MiIsImNsaWVudF9pZCI6ImNsaWVudCIsIm1lbWJlcklkIjoidGVzdCJ9.5KcqJjOfk6iqbM6NiuGq4yXl2iJJ2jrxRdKd1rFc45w",
	"expires_in": 86399,
	"scope": "read",
	"password": null,
	"organization": "test",
	"memberId": "test",
	"jti": "efffc741-589d-4dca-b5d9-0ba80f653ba2"
}
```

### 客户端模式，grant_type=client_credentials

![输入图片说明](../../images/oath/%E5%AE%A2%E6%88%B7%E7%AB%AF%E6%A8%A1%E5%BC%8Fimage.png)

参数：

```
http://localhost:8080/oauth/oauth/token?grant_type=client_credentials&scope=read&client_id=client&client_secret=123123
```
响应结果：

```
{
	"access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzY29wZSI6WyJyZWFkIl0sIm9yZ2FuaXphdGlvbiI6ImNsaWVudCIsImV4cCI6MTY2NjAwNTA2NCwianRpIjoiNTg1ODFhMDEtZDk5ZS00NDU2LThlZGYtMzQ1MTZmNjIxYmZmIiwiY2xpZW50X2lkIjoiY2xpZW50In0.TGdOn2wRiklT4cQjAj1zk9X3bnnEBG1rpSKhthXDmKo",
	"token_type": "bearer",
	"expires_in": 86358,
	"scope": "read",
	"organization": "client",
	"jti": "58581a01-d99e-4456-8edf-34516f621bff"
}
```

或者 basic auth认证请
![输入图片说明](../../images/oath/%E5%AE%A2%E6%88%B7%E7%AB%AF%E6%A8%A1%E5%BC%8Fbasic%E8%AE%A4%E8%AF%81image.png)

### 简化(隐式)模式

```
http://localhost:8080/oauth/oauth/authorize?client_id=client&response_type=token&scope=read&redirect_uri=http://baidu.com
```

## 刷新token

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

## check_token
![输入图片说明](../../images/oath/checkTokenimage.png)

响应结果：
```
{
	"password": null,
	"user_name": "test",
	"scope": [
		"read"
	],
	"organization": "test",
	"active": true,
	"exp": 1666005374,
	"authorities": [
		"product_catory_admin",
		"product_admin"
	],
	"jti": "bc3141dd-ae08-44bd-99f9-16fb07917829",
	"client_id": "client",
	"memberId": "test"
}
```
