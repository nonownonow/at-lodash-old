# **at** #

nodejs에서 coffeescript로 코딩시,

1. 프로토타입 상속
1. 함수지향 (Lodash 기본상속)
1. 객체지향 (메소드체인패턴 자동구현)

을 추구함에 있어서, 

1. 가독성과
1. 유연성과
1. 표현력을 높여

빠른 개발과, 견고한 유지보수를 꾀하는
Helper 라이브러리

### **at 스타일 모듈 작성** ###
[load.coffee = require 시킬 모듈들을 작성, my_module.coffee와 같은 경로에 생성]
```
#!coffeescript
@fs = require 'fs'
@path = require 'path'
@Q = require 'q'
@tracer = (require 'tracer').console
   format: "{{message}} {{file}}:{{line}} {{title}}",
   dateformat: "HH:MM:ss.L"
   inspectOpt:
      depth: 12
@log = @console.log

```

[my_module_father.coffee]
```
#!coffeescript
require 'at'

@my_id= ->
   @path.resolve '.'

@father_hobby= ->
   "#{@my_id()}'s hobby is reading"
```


[my_module_mother.coffee]
```
#!coffeescript
require 'at'

@my_id= ->
   @path.resolve '.'

@mother_hobby =>
   "#{@my_id()}'s hobby is to play the piano"   
```


### **프로토타입 상속** ###

[my_module_son.coffee]
```
#!coffeescript
require 'my_module_mother'
require 'my_module_father'

@my_id= ->
   "#{@my_id()}'s son"

@my_hobby= ->
   @father_hobby()+@mother_hobby()   
```

[my_module_test.coffee]
```
#!coffeescript
require 'my_module_son'

@console.log @my_id()
#my_module_mother의 @my_id가 아니라 my_module_father의 @my_id가 출력
#my_module_son의 require순서에 주의 
@console.log @my_hobby()
#my_module_son의 @my_hobby() 결과가 출력   
```
결론 : 모든 require된 module이 at에 의하여 최종 module에 __proto__체인으로 연결된다. 이 때 같은 이름의 함수가 오버라이드 됨으로 그 결과를 모두 보장할 수 없고, at은 main module에서 2단계 깊이의 module의 함수까지만 보장해준다. 2단계 깊이의 module간에는 먼저 require된 module의 함수가 shadowing된다.

### **함수지향 (Lodash 기본상속)** ###

```
#!coffeescript
require 'at'


```


### **객체지향 (메소드체인패턴 자동구현)** ###

```
#!coffeescript
require 'at'


```
 