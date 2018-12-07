alter table `family`
modify column  `Relationship_type` enum('mother','father','brother','sister','maternal_grandmother','maternal_grandfather','paternal_grandmother','paternal_grandfather','maternal_great_grandmother','maternal_great_grandfather','paternal_great_grandmother','paternal_great_grandfather','aunt','uncle','great_aunt','great_uncle','maternal_cousin','paternal_cousin','adoptive_mother','adoptive_father') DEFAULT NULL;

