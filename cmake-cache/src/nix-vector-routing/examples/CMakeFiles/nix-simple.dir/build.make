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
include src/nix-vector-routing/examples/CMakeFiles/nix-simple.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include src/nix-vector-routing/examples/CMakeFiles/nix-simple.dir/compiler_depend.make

# Include the progress variables for this target.
include src/nix-vector-routing/examples/CMakeFiles/nix-simple.dir/progress.make

# Include the compile flags for this target's objects.
include src/nix-vector-routing/examples/CMakeFiles/nix-simple.dir/flags.make

src/nix-vector-routing/examples/CMakeFiles/nix-simple.dir/codegen:
.PHONY : src/nix-vector-routing/examples/CMakeFiles/nix-simple.dir/codegen

src/nix-vector-routing/examples/CMakeFiles/nix-simple.dir/nix-simple.cc.o: src/nix-vector-routing/examples/CMakeFiles/nix-simple.dir/flags.make
src/nix-vector-routing/examples/CMakeFiles/nix-simple.dir/nix-simple.cc.o: /Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/src/nix-vector-routing/examples/nix-simple.cc
src/nix-vector-routing/examples/CMakeFiles/nix-simple.dir/nix-simple.cc.o: CMakeFiles/stdlib_pch_exec.dir/cmake_pch.hxx
src/nix-vector-routing/examples/CMakeFiles/nix-simple.dir/nix-simple.cc.o: CMakeFiles/stdlib_pch_exec.dir/cmake_pch.hxx.pch
src/nix-vector-routing/examples/CMakeFiles/nix-simple.dir/nix-simple.cc.o: src/nix-vector-routing/examples/CMakeFiles/nix-simple.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/nix-vector-routing/examples/CMakeFiles/nix-simple.dir/nix-simple.cc.o"
	cd /Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/src/nix-vector-routing/examples && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -Winvalid-pch -Xclang -include-pch -Xclang /Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/CMakeFiles/stdlib_pch_exec.dir/cmake_pch.hxx.pch -Xclang -include -Xclang /Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/CMakeFiles/stdlib_pch_exec.dir/cmake_pch.hxx -MD -MT src/nix-vector-routing/examples/CMakeFiles/nix-simple.dir/nix-simple.cc.o -MF CMakeFiles/nix-simple.dir/nix-simple.cc.o.d -o CMakeFiles/nix-simple.dir/nix-simple.cc.o -c /Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/src/nix-vector-routing/examples/nix-simple.cc

src/nix-vector-routing/examples/CMakeFiles/nix-simple.dir/nix-simple.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/nix-simple.dir/nix-simple.cc.i"
	cd /Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/src/nix-vector-routing/examples && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -Winvalid-pch -Xclang -include-pch -Xclang /Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/CMakeFiles/stdlib_pch_exec.dir/cmake_pch.hxx.pch -Xclang -include -Xclang /Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/CMakeFiles/stdlib_pch_exec.dir/cmake_pch.hxx -E /Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/src/nix-vector-routing/examples/nix-simple.cc > CMakeFiles/nix-simple.dir/nix-simple.cc.i

src/nix-vector-routing/examples/CMakeFiles/nix-simple.dir/nix-simple.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/nix-simple.dir/nix-simple.cc.s"
	cd /Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/src/nix-vector-routing/examples && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -Winvalid-pch -Xclang -include-pch -Xclang /Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/CMakeFiles/stdlib_pch_exec.dir/cmake_pch.hxx.pch -Xclang -include -Xclang /Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/CMakeFiles/stdlib_pch_exec.dir/cmake_pch.hxx -S /Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/src/nix-vector-routing/examples/nix-simple.cc -o CMakeFiles/nix-simple.dir/nix-simple.cc.s

# Object files for target nix-simple
nix__simple_OBJECTS = \
"CMakeFiles/nix-simple.dir/nix-simple.cc.o"

# External object files for target nix-simple
nix__simple_EXTERNAL_OBJECTS =

/Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/build/src/nix-vector-routing/examples/ns3.44-nix-simple-default: src/nix-vector-routing/examples/CMakeFiles/nix-simple.dir/nix-simple.cc.o
/Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/build/src/nix-vector-routing/examples/ns3.44-nix-simple-default: src/nix-vector-routing/examples/CMakeFiles/nix-simple.dir/build.make
/Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/build/src/nix-vector-routing/examples/ns3.44-nix-simple-default: /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib/libsqlite3.tbd
/Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/build/src/nix-vector-routing/examples/ns3.44-nix-simple-default: src/nix-vector-routing/examples/CMakeFiles/nix-simple.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable /Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/build/src/nix-vector-routing/examples/ns3.44-nix-simple-default"
	cd /Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/src/nix-vector-routing/examples && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/nix-simple.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/nix-vector-routing/examples/CMakeFiles/nix-simple.dir/build: /Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/build/src/nix-vector-routing/examples/ns3.44-nix-simple-default
.PHONY : src/nix-vector-routing/examples/CMakeFiles/nix-simple.dir/build

src/nix-vector-routing/examples/CMakeFiles/nix-simple.dir/clean:
	cd /Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/src/nix-vector-routing/examples && $(CMAKE_COMMAND) -P CMakeFiles/nix-simple.dir/cmake_clean.cmake
.PHONY : src/nix-vector-routing/examples/CMakeFiles/nix-simple.dir/clean

src/nix-vector-routing/examples/CMakeFiles/nix-simple.dir/depend:
	cd /Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44 /Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/src/nix-vector-routing/examples /Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache /Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/src/nix-vector-routing/examples /Users/tianlongzhu/Documents/nyuClass/spring25/Network/ns-allinone-3.44/ns-3.44/cmake-cache/src/nix-vector-routing/examples/CMakeFiles/nix-simple.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : src/nix-vector-routing/examples/CMakeFiles/nix-simple.dir/depend

