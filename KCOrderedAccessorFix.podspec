Pod::Spec.new do |s|
  s.name             = "KCOrderedAccessorFix"
  s.version          = "0.1.1"
  s.summary          = "Fixes \"CoreDataGeneratedAccessors\" for ordered, to-many relationships."

  s.description      = <<-DESC
      KVC accessors for ordered, to-many relationships (NSOrderedSet) defined in Xcode's "CoreDataGeneratedAccessors" category are being auto-generated in the regular unordered KVC accessor pattern (NSSet-like), causing runtime crashes. This library intelligently overrides the broken implementation on the appropriate NSManagedObject subclasses.
                       DESC

  s.homepage         = "https://github.com/CFKevinRef/KCOrderedAccessorFix"
  s.license          = {
    :type => "Unlicense",
    :text => "This is free and unencumbered software released into the public domain.\n\nAnyone is free to copy, modify, publish, use, compile, sell, or\ndistribute this software, either in source code form or as a compiled\nbinary, for any purpose, commercial or non-commercial, and by any\nmeans.\n\nIn jurisdictions that recognize copyright laws, the author or authors\nof this software dedicate any and all copyright interest in the\nsoftware to the public domain. We make this dedication for the benefit\nof the public at large and to the detriment of our heirs and\nsuccessors. We intend this dedication to be an overt act of\nrelinquishment in perpetuity of all present and future rights to this\nsoftware under copyright law.\n\nTHE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND,\nEXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF\nMERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.\nIN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR\nOTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,\nARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR\nOTHER DEALINGS IN THE SOFTWARE.\n\nFor more information, please refer to <http://unlicense.org/>\n"
  }
  s.author           = { "Kevin Cassidy Jr" => "kevincassidyjr@gmail.com" }
  s.source           = { :git => "https://github.com/CFKevinRef/KCOrderedAccessorFix.git", :tag => s.version.to_s }

  s.requires_arc = true

  s.public_header_files = 'NSManagedObjectModel+KCOrderedAccessorFix.h'
  s.source_files = 'NSManagedObjectModel+KCOrderedAccessorFix.{h,m}'

  s.frameworks = 'CoreData'
end
