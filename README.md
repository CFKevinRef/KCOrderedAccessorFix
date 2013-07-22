KCOrderedAccessorFix
====================

Fixes "CoreDataGeneratedAccessors" for ordered, to-many relationships. At the time of this writing, accessors are being auto-generated in the regular unordered KVC accessor pattern (`NSSet`-like), causing runtime crashes. Besides unrecognized selectors for most of the accessors, the following are common exceptions:

```
*** Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: '*** -[NSOrderedSet intersectsSet:]: set argument is not an NSSet'
*** Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: '*** -[NSSet isSubsetOfSet:]: set argument is not an NSSet'
*** Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: '*** -[NSOrderedSet isSubsetOfSet:]: set argument is not an NSSet'
```

The simplest use of this category is calling `kc_generateOrderedSetAccessors` when first initializing your model:

```objective-c
_managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
[_managedObjectModel kc_generateOrderedSetAccessors];
```

The fix generates the following methods on its entities's classes for each ordered relationship:

```objective-c
- (void)insertObject:(NSManagedObject *)value in<Key>AtIndex:(NSUInteger)idx;
- (void)removeObjectFrom<Key>AtIndex:(NSUInteger)idx;
- (void)insert<Key>:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)remove<Key>AtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectIn<Key>AtIndex:(NSUInteger)idx withObject:(NSManagedObject *)value;
- (void)replace<Key>AtIndexes:(NSIndexSet *)indexes with<Key>:(NSArray *)values;
- (void)add<Key>Object:(NSManagedObject *)value;
- (void)remove<Key>Object:(NSManagedObject *)value;
- (void)add<Key>:(NSOrderedSet *)values;
- (void)remove<Key>:(NSOrderedSet *)values;
```

More fine-grained applications of these KVC methods are available through `kc_generateOrderedSetAccessorsForEntity:` and `kc_generateOrderedSetAccessorsForRelationship:`.

Calling the generated methods does not result in setting the underlying property with a new ordered set, as done by some other fixes for this issue. Instead, each method produces the appropriate KVO notifications for an [ordered to-many relationship](http://developer.apple.com/library/mac/documentation/cocoa/conceptual/KeyValueObserving/Articles/KVOCompliance.html#//apple_ref/doc/uid/20002178-SW3) and uses the efficient [dynamically-generated primitive accessors](https://developer.apple.com/library/mac/#documentation/Cocoa/Reference/CoreDataFramework/Classes/NSManagedObject_Class/Reference/NSManagedObject.html#//apple_ref/occ/instm/NSManagedObject/primitiveValueForKey:).

This category uses ARC. For use in a manual reference counting project, add the `-fobjc-arc` flag to "Compiler Flags" in Build Phases --> Compile Sources for `NSManagedObjectModel+KCOrderedAccessorFix.m`.
