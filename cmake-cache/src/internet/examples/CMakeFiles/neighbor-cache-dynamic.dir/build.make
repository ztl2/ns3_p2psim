# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 4.0

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /opt/homebrew/bin/cmake

# The command to remove a file.
RM = /opt/homebrew/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache

# Include any dependencies generated for this target.
include src/internet/examples/CMakeFiles/neighbor-cache-dynamic.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include src/internet/examples/CMakeFiles/neighbor-cache-dynamic.dir/compiler_depend.make

# Include the progress variables for this target.
include src/internet/examples/CMakeFiles/neighbor-cache-dynamic.dir/progress.make

# Include the compile flags for this target's objects.
include src/internet/examples/CMakeFiles/neighbor-cache-dynamic.dir/flags.make

src/internet/examples/CMakeFiles/neighbor-cache-dynamic.dir/codegen:
.PHONY : src/internet/examples/CMakeFiles/neighbor-cache-dynamic.dir/codegen

src/internet/examples/CMakeFiles/neighbor-cache-dynamic.dir/neighbor-cache-dynamic.cc.o: src/internet/examples/CMakeFiles/neighbor-cache-dynamic.dir/flags.make
src/internet/examples/CMakeFiles/neighbor-cache-dynamic.dir/neighbor-cache-dynamic.cc.o: /Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/src/internet/examples/neighbor-cache-dynamic.cc
src/internet/examples/CMakeFiles/neighbor-cache-dynamic.dir/neighbor-cache-dynamic.cc.o: CMakeFiles/stdlib_pch_exec.dir/cmake_pch.hxx
src/internet/examples/CMakeFiles/neighbor-cache-dynamic.dir/neighbor-cache-dynamic.cc.o: CMakeFiles/stdlib_pch_exec.dir/cmake_pch.hxx.pch
src/internet/examples/CMakeFiles/neighbor-cache-dynamic.dir/neighbor-cache-dynamic.cc.o: src/internet/examples/CMakeFiles/neighbor-cache-dynamic.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/internet/examples/CMakeFiles/neighbor-cache-dynamic.dir/neighbor-cache-dynamic.cc.o"
	cd /Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/src/internet/examples && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -Winvalid-pch -Xclang -include-pch -Xclang /Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/CMakeFiles/stdlib_pch_exec.dir/cmake_pch.hxx.pch -Xclang -include -Xclang /Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/CMakeFiles/stdlib_pch_exec.dir/cmake_pch.hxx -MD -MT src/internet/examples/CMakeFiles/neighbor-cache-dynamic.dir/neighbor-cache-dynamic.cc.o -MF CMakeFiles/neighbor-cache-dynamic.dir/neighbor-cache-dynamic.cc.o.d -o CMakeFiles/neighbor-cache-dynamic.dir/neighbor-cache-dynamic.cc.o -c /Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/src/internet/examples/neighbor-cache-dynamic.cc

src/internet/examples/CMakeFiles/neighbor-cache-dynamic.dir/neighbor-cache-dynamic.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/neighbor-cache-dynamic.dir/neighbor-cache-dynamic.cc.i"
	cd /Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/src/internet/examples && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -Winvalid-pch -Xclang -include-pch -Xclang /Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/CMakeFiles/stdlib_pch_exec.dir/cmake_pch.hxx.pch -Xclang -include -Xclang /Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/CMakeFiles/stdlib_pch_exec.dir/cmake_pch.hxx -E /Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/src/internet/examples/neighbor-cache-dynamic.cc > CMakeFiles/neighbor-cache-dynamic.dir/neighbor-cache-dynamic.cc.i

src/internet/examples/CMakeFiles/neighbor-cache-dynamic.dir/neighbor-cache-dynamic.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/neighbor-cache-dynamic.dir/neighbor-cache-dynamic.cc.s"
	cd /Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/src/internet/examples && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -Winvalid-pch -Xclang -include-pch -Xclang /Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/CMakeFiles/stdlib_pch_exec.dir/cmake_pch.hxx.pch -Xclang -include -Xclang /Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/CMakeFiles/stdlib_pch_exec.dir/cmake_pch.hxx -S /Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/src/internet/examples/neighbor-cache-dynamic.cc -o CMakeFiles/neighbor-cache-dynamic.dir/neighbor-cache-dynamic.cc.s

# Object files for target neighbor-cache-dynamic
neighbor__cache__dynamic_OBJECTS = \
"CMakeFiles/neighbor-cache-dynamic.dir/neighbor-cache-dynamic.cc.o"

# External object files for target neighbor-cache-dynamic
neighbor__cache__dynamic_EXTERNAL_OBJECTS =

/Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/build/src/internet/examples/ns3.44-neighbor-cache-dynamic-default: src/internet/examples/CMakeFiles/neighbor-cache-dynamic.dir/neighbor-cache-dynamic.cc.o
/Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/build/src/internet/examples/ns3.44-neighbor-cache-dynamic-default: src/internet/examples/CMakeFiles/neighbor-cache-dynamic.dir/build.make
/Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/build/src/internet/examples/ns3.44-neighbor-cache-dynamic-default: /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib/libsqlite3.tbd
/Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/build/src/internet/examples/ns3.44-neighbor-cache-dynamic-default: src/internet/examples/CMakeFiles/neighbor-cache-dynamic.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable /Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/build/src/internet/examples/ns3.44-neighbor-cache-dynamic-default"
	cd /Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/src/internet/examples && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/neighbor-cache-dynamic.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/internet/examples/CMakeFiles/neighbor-cache-dynamic.dir/build: /Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/build/src/internet/examples/ns3.44-neighbor-cache-dynamic-default
.PHONY : src/internet/examples/CMakeFiles/neighbor-cache-dynamic.dir/build

src/internet/examples/CMakeFiles/neighbor-cache-dynamic.dir/clean:
	cd /Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/src/internet/examples && $(CMAKE_COMMAND) -P CMakeFiles/neighbor-cache-dynamic.dir/cmake_clean.cmake
.PHONY : src/internet/examples/CMakeFiles/neighbor-cache-dynamic.dir/clean

src/internet/examples/CMakeFiles/neighbor-cache-dynamic.dir/depend:
	cd /Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44 /Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/src/internet/examples /Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache /Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/src/internet/examples /Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/src/internet/examples/CMakeFiles/neighbor-cache-dynamic.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : src/internet/examples/CMakeFiles/neighbor-cache-dynamic.dir/depend

