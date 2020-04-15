package main

import (
	"os"
	"os/exec"
	"fmt"
	"time"
)
func must(err error) {
	if err != nil {
		// fmt.Printf("err: %s\n", err)
		panic(err)
	}
}
func main() {
	custom := os.Getenv("CUSTOM_ENGINE_INSTALL_URL")
	cmd := exec.Command("rancher-machine.bin", os.Args[1:]...)
	cmd.Env = os.Environ()
	ret,err := cmd.Output()
	must(err)
	if (len(custom) != 0 && len(os.Args) > 1 && os.Args[1] == "create" ) {
		file, fileErr := os.Create("/tmp/machine.log")
		currentTime := time.Now()
		if fileErr != nil {
			fmt.Println(fileErr)
			return
		}		
		cmd := exec.Command("rancher-machine.bin", "ssh", os.Args[1],"curl -sfL $CUSTOM_ENGINE_INSTALL_URL | sh -")
		cmd.Env = os.Environ()
		err := cmd.Run()
		fmt.Fprintf(file, "%s",currentTime.Format("2006/01/02 15:04:05"))		
		fmt.Fprintf(file, "%s",err)		
	}
	fmt.Printf("%s",ret)
	
}