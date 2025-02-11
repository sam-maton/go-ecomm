package main

import (
	"fmt"
	"strings"
)

func splitImageURLs(imageURLs []byte) []string {
	return strings.Split(string(imageURLs), ", ")
}

func convertToGBP(price int32) string {
	return fmt.Sprintf("£%v.%02v", price/100, price%100)
}
