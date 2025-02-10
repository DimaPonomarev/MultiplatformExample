package com.example.multiplatformexample

interface Platform {
    val name: String
}

expect fun getPlatform(): Platform