package main

import (
	"fmt"

	_ "github.com/go-sql-driver/mysql"
	"github.com/gomodule/redigo/redis"
	"github.com/jmoiron/sqlx"
)

func RedisConnection() redis.Conn {
	const Addr = "127.0.0.1:6379"

	c, err := redis.Dial("tcp", Addr)
	if err != nil {
		panic(err)
	}
	return c
}

func MysqlConnection() *sqlx.DB {
	dsn := "isucon:isucon@tcp(127.0.0.1:3306)/isubata?parseTime=true&loc=Local&charset=utf8mb4"
	db, err := sqlx.Connect("mysql", dsn)
	if err != nil {
		panic(err)
	}
	return db
}

func main() {
	c := RedisConnection()
	defer c.Close()

	db := MysqlConnection()
	defer db.Close()

	type Row struct {
		Name string `db:"name"`
		Data []byte `db:"data"`
	}
	rows := []Row{}

	err := db.Select(&rows, "SELECT name, data FROM image")
	if err != nil {
		panic(err)
	}
	for _, row := range rows {
		_, err := c.Do("SET", row.Name, row.Data)
		if err != nil {
			panic(err)
		}
	}

	for i := 0; i < 5; i++ {
		key := rows[i].Name
		data, _ := redis.Bytes(c.Do("GET", key))
		fmt.Println(string(data))
	}
}
