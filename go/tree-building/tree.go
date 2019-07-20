package tree

import (
	"sort"

	"github.com/pkg/errors"
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
		return nil, errors.New("invalid root node")
	}

	nodes := make([]Node, len(records))
	for i, record := range records {
		if record.Parent > record.ID {
			return nil, errors.New("parent id can't be higher than ID")
		}
		if i > 0 && (i != record.ID || record.ID <= record.Parent) {
			return nil, errors.New("duplicate")
		}
		nodes[record.ID] = Node{ID: record.ID}
		if record.ID == 0 {
			continue
		}
		child, parent := &nodes[record.ID], &nodes[record.Parent]
		parent.Children = append(parent.Children, child)
	}

	return &nodes[0], nil
}
