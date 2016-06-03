//Outputs the Base64 Encoding a files SHA256 sum
//developed to work around https://github.com/hashicorp/terraform/issues/6513
package main

import (
	"fmt"
	"os"
	"crypto/sha256"
	"encoding/base64"
	"io/ioutil"
)

func main() {
	filename := os.Args[1]

	filedata, err := ioutil.ReadFile(filename)
	if err != nil {
		panic(err)
	}

	sha := sha256.New()
	sha.Write([]byte(string(filedata)))
	shaSum := sha.Sum(nil)
	encoded := base64.StdEncoding.EncodeToString(shaSum[:])
	fmt.Println(encoded)
}