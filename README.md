# sample-ios-c-wrapper-framework

## How to create a framework for static c libraries

1. Build the static c library and generate a fat binary to bundle all iOS
   platforms into one library file.
1. Generate a new ios-framework.
2. Create a \<framework-name\>.modulemap file and place it into the 
   framework-target-group.
3. Set the location of the modulemap file in the Build-Settings tab.
4. Add the c-headers to the same group.
5. Go to the Headers section in the Build-Phases tab and move the c-headers
   from the Project area to the Private area.
4. Write the wrapper-code.
5. Go to the Build-Settings and add the location of the static library file to
   the Library Search Path.
6. In the same tab set the Other Linker Flags setting to 
   -l\<library-name-without-lib-prefix>.

## How to use the framework package in an iOS App

1. Add the Framework Package (*.framework) to the Frameworks, Libraries ... 
   section.
2. Set up the location of the framework folder in the Framework Search Path 
   setting. (The folder that contains the framework folder)
3. Use the framework-code via import import \<library-name\>.
