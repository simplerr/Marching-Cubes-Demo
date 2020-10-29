workspace "Marching Cubes Demo"
   configurations { "Debug", "Release" }
   language "C++"
   cppdialect "C++17"
   platforms "x64"
   startproject "Editor"
   characterset "ASCII"

   -- Defines
   defines
   {
      "BT_USE_DOUBLE_PRECISION",
      "GLM_FORCE_CTOR_INIT",
      "WIN32",
      "_DEBUG",
      "_WINDOWS",
      "VK_USE_PLATFORM_WIN32_KHR",
      "_USE_MATH_DEFINES",
      "NOMINMAX"
   }

   -- "Debug"
   filter "configurations:Debug"
      defines { "DEBUG" }
      flags { "MultiProcessorCompile", "LinkTimeOptimization" }
      symbols "On"
    
   -- "Release"
   filter "configurations:Release"
      defines { "NDEBUG" }
      flags { "MultiProcessorCompile" }
      symbols "Off"
      optimize "Full"

-- =========================================
-- ================ Engine =================
-- =========================================
-- Note: This should be imported from Utopian Engine repository
project "Engine"
      kind "StaticLib"
      targetdir "bin/%{cfg.buildcfg}"
   
      -- Files
      files
      {
         -- Utopian
         "UtopianEngine/source/utopian/**.hpp",
         "UtopianEngine/source/utopian/**.h",
         "UtopianEngine/source/utopian/**.cpp",
         "UtopianEngine/external/vk_mem_alloc.h",
         "UtopianEngine/external/stb_image.h",
         "UtopianEngine/external/stb_image_write.h",
         "UtopianEngine/external/ktx.h",
         "UtopianEngine/external/ktxvulkan.h",
         "UtopianEngine/external/im3d/*.h",
         "UtopianEngine/external/im3d/*.cpp",
         "UtopianEngine/external/imgui/*.h",
         "UtopianEngine/external/imgui/*.cpp",
         "UtopianEngine/external/LegitProfiler/*.h",
         "UtopianEngine/external/LegitProfiler/*.cpp"
      }
   
      -- Includes
      includedirs { "UtopianEngine/external/bullet3-2.88" }
      includedirs { "UtopianEngine/external/luaplus" }
      includedirs { "UtopianEngine/external/luaplus/lua53-luaplus/src" }
      includedirs { "UtopianEngine/external/glslang/StandAlone" }
      includedirs { "UtopianEngine/external/glslang" }
      includedirs { "UtopianEngine/external/glm" }
      includedirs { "UtopianEngine/external/gli" }
      includedirs { "UtopianEngine/external/assimp" }
      includedirs { "UtopianEngine/external" }
      includedirs { "UtopianEngine/source/utopian" }
      includedirs { "UtopianEngine/source" }
   
      -- Libraries
      libdirs { "UtopianEngine/libs/assimp" }
      libdirs { "UtopianEngine/libs/bullet3-2.88" }
      libdirs { "UtopianEngine/libs/glslang" }
      libdirs { "UtopianEngine/libs/luaplus" }
      libdirs { "UtopianEngine/libs/vulkan" }
      libdirs { "UtopianEngine/libs/ktx" }
   
      -- "Debug"
      filter "configurations:Debug"
         defines { "DEBUG" }
         symbols "On"
         debugformat "c7"
         links { "BulletCollision_x64_debug" }
         links { "BulletDynamics_x64_debug" }
         links { "BulletSoftBody_x64_debug" }
         links { "LinearMath_x64_debug" }
         links { "lua53-luaplus-static.debug" }
         links { "OSDependentd" }
         links { "glslangd" }
         links { "HLSLd" }
         links { "OGLCompilerd" }
         links { "SPIRVd" }
         links { "SPVRemapperd" }
         links { "vulkan-1" }
         links { "assimp" }
         links { "libktx.gl" }
   
      -- "Release"
      filter "configurations:Release"
         defines { "NDEBUG" }
         optimize "On"

-- =========================================
-- ============ Raytracing demo ============
-- =========================================
project "Marching Cubes Demo"
kind "WindowedApp"
targetdir "bin/%{cfg.buildcfg}"

-- Files
files
{
   "*.hpp",
   "*.h",
   "*.cpp",
}

-- Includes
includedirs { "UtopianEngine/external/bullet3-2.88" }
includedirs { "UtopianEngine/external/luaplus" }
includedirs { "UtopianEngine/external/luaplus/lua53-luaplus/src" }
includedirs { "UtopianEngine/external/glslang/StandAlone" }
includedirs { "UtopianEngine/external/glslang" }
includedirs { "UtopianEngine/external/glm" }
includedirs { "UtopianEngine/external/gli" }
includedirs { "UtopianEngine/external/assimp" }
includedirs { "UtopianEngine/external" }
includedirs { "UtopianEngine/source/utopian" }
includedirs { "UtopianEngine/source" }

-- Libraries

links
{
   "Engine"
}

-- "Debug"
filter "configurations:Debug"
   defines { "DEBUG" }
   symbols "On"
   debugformat "c7"

-- "Release"
filter "configurations:Release"
   defines { "NDEBUG" }
   optimize "On"
