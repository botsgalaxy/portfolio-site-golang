package main

import "github.com/gin-gonic/gin"

func main() {
	gin.SetMode(gin.ReleaseMode)
	r := gin.Default()
	r.Static("/","./app/static")
	r.Run("0.0.0.0:8000") // listen and serve on 0.0.0.0:8080
}
