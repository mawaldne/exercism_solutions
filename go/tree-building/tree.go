package tree

import (
	"fmt"
	"sort"
)

type Node struct {
	ID       int
	Children []*Node
}

type Record struct {
	ID     int
	Parent int
}

func Build(records []Record) (*Node, error) {
	if len(records) == 0 {
		return nil, nil
	}

	sort.Slice(records, func(i, j int) bool {
		return records[i].ID < records[j].ID
	})

	if records[0].ID != 0 {
		return nil, fmt.Errorf("no root node")
	}

	nodes := make([]Node, len(records))

	for i, record := range records {
		if record.Parent > record.ID {
			return nil, fmt.Errorf("parent id can't be higher than ID")
		}
		if records[i].ID != 0 && records[i].ID == records[i].Parent {
			return nil, fmt.Errorf("no direct cycle. Node 0 is the only parent of itself")
		}
		if i > 1 && records[i].ID-records[i-1].ID != 1 {
			return nil, fmt.Errorf("duplicate or missing IDs are not allowed")
		}
		nodes[i] = Node{ID: record.ID}
	}

	for _, record := range records {
		if record.ID == 0 {
			continue
		}
		child, parent := &nodes[record.ID], &nodes[record.Parent]
		parent.Children = append(parent.Children, child)
	}

	return &nodes[0], nil
}
