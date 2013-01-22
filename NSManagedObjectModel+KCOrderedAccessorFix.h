//
//  NSManagedObjectModel+KCOrderedAccessorFix.h
//  KCOrderedAccessorFix
//
//  Created by Kevin Cassidy Jr. on 10/15/12.
//  Copyright (c) 2012 Kevin Cassidy Jr. All rights reserved.
//

#import <CoreData/NSManagedObjectModel.h>

@class NSEntityDescription;
@class NSRelationshipDescription;

@interface NSManagedObjectModel (KCOrderedAccessorFix)

/**
 Generates the appropriate ordered KVC-compliant accessor methods for any ordered to-many relationships on its entities
 @see NSManagedObjectModel#kc_generateOrderedSetAccessorsForEntity:
 */
- (void)kc_generateOrderedSetAccessors;

/**
 Generates the appropriate ordered KVC-compliant accessor methods for any ordered to-many relationships in `entity`
 @param entity the ordered, to-many relationship to process.
 @see NSManagedObjectModel#kc_generateOrderedSetAccessorsForRelationship:
 */
- (void)kc_generateOrderedSetAccessorsForEntity:(NSEntityDescription *)entity;

/**
 @brief Generates the appropriate ordered KVC-compliant accessor methods.
 
 The following "CoreDataGeneratedAccessors" methods are generated, where <#Key#> is the capitalized version of the relationship name:
 - (void)insertObject:(NSManagedObject *)value in<#Key#>AtIndex:(NSUInteger)idx;
 - (void)removeObjectFrom<#Key#>AtIndex:(NSUInteger)idx;
 - (void)insert<#Key#>:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
 - (void)remove<#Key#>AtIndexes:(NSIndexSet *)indexes;
 - (void)replaceObjectIn<#Key#>AtIndex:(NSUInteger)idx withObject:(NSManagedObject *)value;
 - (void)replace<#Key#>AtIndexes:(NSIndexSet *)indexes with<#Key#>:(NSArray *)values;
 - (void)add<#Key#>Object:(NSManagedObject *)value;
 - (void)remove<#Key#>Object:(NSManagedObject *)value;
 - (void)add<#Key#>:(NSOrderedSet *)values;
 - (void)remove<#Key#>:(NSOrderedSet *)values;
 
 @param relationship the ordered, to-many relationship to process.
 */
- (void)kc_generateOrderedSetAccessorsForRelationship:(NSRelationshipDescription *)relationship;

@end
