KCOrderedAccessorFix
====================

Fixes "CoreDataGeneratedAccessors" for ordered, to-many relationships. At the time of this writing, accessors are being auto-generated in the regular unordered KVC accessor pattern (`NSSet`-like), causing runtime crashes.

This can be fixed most simply by calling this category's `kc_generateOrderedSetAccessors` when first initializing your model:

```
_managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
[_managedObjectModel kc_generateOrderedSetAccessors];
```

More fine-grained applications of these KVC methods are available through `kc_generateOrderedSetAccessorsForEntity:` and `kc_generateOrderedSetAccessorsForRelationship:`.
