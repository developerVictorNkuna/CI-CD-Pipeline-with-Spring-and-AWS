package com.vintechptyltd.CI.CD.Pipeline.with.Spring.and.AWS.web;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

/**
 * @author Victor Nkuna 2023/12/21 14:32
 */



@RestController
@RequestMapping(path="/test")
public class TestController {
    @GetMapping()
    public ResponseEntity <Map<String,String>> test(){
        return ResponseEntity.ok(Map.of("Testing","Up and running"));
}


}
