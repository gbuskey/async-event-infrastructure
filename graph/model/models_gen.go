// Code generated by github.com/99designs/gqlgen, DO NOT EDIT.

package model

type Event struct {
	ID            string         `json:"ID"`
	Name          string         `json:"name"`
	Version       string         `json:"version"`
	Release       string         `json:"release"`
	PlatformID    string         `json:"platformID"`
	Package       string         `json:"package"`
	Description   string         `json:"description"`
	Payload       string         `json:"payload"`
	EventReceiver *EventReceiver `json:"event_receiver"`
	Success       bool           `json:"success"`
}

type EventInput struct {
	ID              string `json:"ID"`
	Name            string `json:"name"`
	Version         string `json:"version"`
	Release         string `json:"release"`
	PlatformID      string `json:"platformID"`
	Package         string `json:"package"`
	Description     string `json:"description"`
	Payload         string `json:"payload"`
	EventReceiverID string `json:"event_receiver_id"`
	Success         bool   `json:"success"`
}

type EventReceiver struct {
	ID          string                `json:"ID"`
	Name        string                `json:"name"`
	Type        string                `json:"type"`
	Version     string                `json:"version"`
	Description string                `json:"description"`
	Enabled     bool                  `json:"enabled"`
	EventGroups []*EventReceiverGroup `json:"event_groups"`
}

type EventReceiverInput struct {
	ID          string `json:"ID"`
	Name        string `json:"name"`
	Type        string `json:"type"`
	Version     string `json:"version"`
	Description string `json:"description"`
	Enabled     bool   `json:"enabled"`
}

type EventReceiverGroup struct {
	ID             string           `json:"ID"`
	Name           string           `json:"name"`
	Type           string           `json:"type"`
	Version        string           `json:"version"`
	Enabled        bool             `json:"enabled"`
	EventReceivers []*EventReceiver `json:"event_receivers"`
}

type EventReceiverGroupInput struct {
	ID      string `json:"ID"`
	Name    string `json:"name"`
	Type    string `json:"type"`
	Version string `json:"version"`
	Enabled bool   `json:"enabled"`
}
