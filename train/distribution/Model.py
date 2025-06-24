from torch_geometric.nn import TransformerConv, ASAPooling, global_mean_pool, GraphConv, GATConv, GINConv, GCNConv, DynamicEdgeConv
import torch
import torch.nn.functional as F
from torch import nn
from torch.nn import Linear, Module

class CircuitGraphModel(torch.nn.Module):
    def __init__(
            self,
            num_node_features: int,
            hidden_channels: int
    ):
        super().__init__()

        self.transformer1 = TransformerConv(
            num_node_features, hidden_channels,
            heads=3,
        )
        self.pooling1 = ASAPooling(hidden_channels * 3, 0.5)

        self.transformer2 = TransformerConv(
            hidden_channels * 3, hidden_channels,
            heads=2,
        )
        self.pooling2 = ASAPooling(hidden_channels * 2, 0.5)

        self.body_seq = torch.nn.Sequential(
            Linear(hidden_channels * 2, hidden_channels),
            Linear(hidden_channels, 4)
        )

    def forward(self, state_batch):
        x, edge_index, batch = state_batch.x, state_batch.edge_index, state_batch.batch

        graph = self.transformer1(x, edge_index)

        graph, edge_index, _, batch, _ = self.pooling1(
            x=graph, edge_index=edge_index, batch=batch
        )

        graph = self.transformer2(graph, edge_index)
        graph, edge_index, _, batch, _ = self.pooling2(
            x=graph, edge_index=edge_index, batch=batch
        )

        graph = global_mean_pool(graph, batch)

        merge = graph

        return self.body_seq(merge)

class GraphTransformerNetwork(nn.Module):
    def __init__(self, input_dim, hidden_dim, num_actions):
        super(GraphTransformerNetwork, self).__init__()
        self.conv1 = TransformerConv(input_dim, hidden_dim, heads=4, concat=False)
        self.conv2 = TransformerConv(hidden_dim, hidden_dim, heads=4, concat=False)
        self.fc1_value = nn.Linear(hidden_dim, hidden_dim)
        self.fc2_value = nn.Linear(hidden_dim, 1)
        self.fc1_advantage = nn.Linear(hidden_dim, hidden_dim)
        self.fc2_advantage = nn.Linear(hidden_dim, num_actions)

    def forward(self, x, edge_index, batch):
        x = F.relu(self.conv1(x, edge_index))
        x = F.relu(self.conv2(x, edge_index))
        x = global_mean_pool(x, batch)
        value = F.relu(self.fc1_value(x))
        value = self.fc2_value(value)
        advantage = F.relu(self.fc1_advantage(x))
        advantage = self.fc2_advantage(advantage)
        return value + (advantage - advantage.mean(dim=1, keepdim=True))

class DynamicGraphModel(Module):
    def __init__(self, num_node_features, hidden_channels, num_classes):
        super(DynamicGraphModel, self).__init__()

        self.conv1 = DynamicEdgeConv(Linear(num_node_features, hidden_channels), k=5)
        self.conv2 = DynamicEdgeConv(Linear(hidden_channels, hidden_channels), k=10)
        self.lin = Linear(hidden_channels, num_classes)

    def forward(self, x):
        x = self.conv1(x)
        x = self.conv2(x)
        x = self.lin(x)
        return x

class GraphMatchingNetwork(nn.Module):
    def __init__(self, input_dim, hidden_dim, output_dim):
        super(GraphMatchingNetwork, self).__init__()
        self.conv1 = GCNConv(input_dim, hidden_dim)
        self.conv2 = GCNConv(hidden_dim, hidden_dim)
        self.fc1 = nn.Linear(hidden_dim, output_dim)

    def forward(self, x, edge_index, batch):
        x = F.relu(self.conv1(x, edge_index))
        x = F.relu(self.conv2(x, edge_index))
        x = global_mean_pool(x, batch)
        x = self.fc1(x)
        return x

class DuelingGraphMatchingNetwork(nn.Module):
    def __init__(self, input_dim, hidden_dim, num_actions):
        super(DuelingGraphMatchingNetwork, self).__init__()
        self.conv1 = GraphConv(input_dim, hidden_dim)
        self.conv2 = GraphConv(hidden_dim, hidden_dim)

        self.fc1_value = nn.Linear(hidden_dim, hidden_dim)
        self.fc2_value = nn.Linear(hidden_dim, 1)  # 状态值

        self.fc1_advantage = nn.Linear(hidden_dim, hidden_dim)
        self.fc2_advantage = nn.Linear(hidden_dim, num_actions)  # 动作优势

    def forward(self, x, edge_index, batch):
        x = F.relu(self.conv1(x, edge_index))
        x = F.relu(self.conv2(x, edge_index))
        x = global_mean_pool(x, batch)

        value = F.relu(self.fc1_value(x))
        value = self.fc2_value(value)

        advantage = F.relu(self.fc1_advantage(x))
        advantage = self.fc2_advantage(advantage)

        return value + (advantage - advantage.mean(dim=1, keepdim=True))

class GCNNetwork(nn.Module):
    def __init__(self, input_dim, hidden_dim, num_actions):
        super(GCNNetwork, self).__init__()
        self.conv1 = GCNConv(input_dim, hidden_dim)
        self.conv2 = GCNConv(hidden_dim, hidden_dim)
        self.fc1_value = nn.Linear(hidden_dim, hidden_dim)
        self.fc2_value = nn.Linear(hidden_dim, 1)
        self.fc1_advantage = nn.Linear(hidden_dim, hidden_dim)
        self.fc2_advantage = nn.Linear(hidden_dim, num_actions)

    def forward(self, x, edge_index, batch):
        x = F.relu(self.conv1(x, edge_index))
        x = F.relu(self.conv2(x, edge_index))
        x = global_mean_pool(x, batch)
        value = F.relu(self.fc1_value(x))
        value = self.fc2_value(value)
        advantage = F.relu(self.fc1_advantage(x))
        advantage = self.fc2_advantage(advantage)
        return value + (advantage - advantage.mean(dim=1, keepdim=True))

class GATNetwork(nn.Module):
    def __init__(self, input_dim, hidden_dim, num_actions):
        super(GATNetwork, self).__init__()
        self.conv1 = GATConv(input_dim, hidden_dim)
        self.conv2 = GATConv(hidden_dim, hidden_dim)
        self.fc1_value = nn.Linear(hidden_dim, hidden_dim)
        self.fc2_value = nn.Linear(hidden_dim, 1)
        self.fc1_advantage = nn.Linear(hidden_dim, hidden_dim)
        self.fc2_advantage = nn.Linear(hidden_dim, num_actions)

    def forward(self, x, edge_index, batch):
        x = F.relu(self.conv1(x, edge_index))
        x = F.relu(self.conv2(x, edge_index))
        x = global_mean_pool(x, batch)
        value = F.relu(self.fc1_value(x))
        value = self.fc2_value(value)
        advantage = F.relu(self.fc1_advantage(x))
        advantage = self.fc2_advantage(advantage)
        return value + (advantage - advantage.mean(dim=1, keepdim=True))

class GINNetwork(nn.Module):
    def __init__(self, input_dim, hidden_dim, num_actions):
        super(GINNetwork, self).__init__()
        nn1 = nn.Sequential(nn.Linear(input_dim, hidden_dim), nn.ReLU(), nn.Linear(hidden_dim, hidden_dim))
        nn2 = nn.Sequential(nn.Linear(hidden_dim, hidden_dim), nn.ReLU(), nn.Linear(hidden_dim, hidden_dim))
        self.conv1 = GINConv(nn1)
        self.conv2 = GINConv(nn2)
        self.fc1_value = nn.Linear(hidden_dim, hidden_dim)
        self.fc2_value = nn.Linear(hidden_dim, 1)
        self.fc1_advantage = nn.Linear(hidden_dim, hidden_dim)
        self.fc2_advantage = nn.Linear(hidden_dim, num_actions)

    def forward(self, x, edge_index, batch):
        x = F.relu(self.conv1(x, edge_index))
        x = F.relu(self.conv2(x, edge_index))
        x = global_mean_pool(x, batch)
        value = F.relu(self.fc1_value(x))
        value = self.fc2_value(value)
        advantage = F.relu(self.fc1_advantage(x))
        advantage = self.fc2_advantage(advantage)
        return value + (advantage - advantage.mean(dim=1, keepdim=True))

import torch
import torch.nn as nn
import torch.nn.functional as F
from torch_geometric.nn import GCNConv, global_mean_pool

class DuelingPPOActorCriticNetwork(nn.Module):
    def __init__(self, input_dim, hidden_dim, num_actions):
        super(DuelingPPOActorCriticNetwork, self).__init__()
        
        # Graph Convolutional Layers
        self.conv1 = GCNConv(input_dim, hidden_dim)
        self.conv2 = GCNConv(hidden_dim, hidden_dim)
        
        # Fully connected layers
        self.fc1 = nn.Linear(hidden_dim, hidden_dim)
        self.fc2 = nn.Linear(hidden_dim, hidden_dim)
        
        # Advantage stream
        self.adv_fc1 = nn.Linear(hidden_dim, hidden_dim)
        self.adv_fc2 = nn.Linear(hidden_dim, num_actions)
        
        # Value stream
        self.val_fc1 = nn.Linear(hidden_dim, hidden_dim)
        self.val_fc2 = nn.Linear(hidden_dim, 1)

    def forward(self, x, edge_index, batch):
        # Graph convolution layers
        x = F.relu(self.conv1(x, edge_index))
        x = F.relu(self.conv2(x, edge_index))
        
        # Global mean pooling
        x = global_mean_pool(x, batch)
        
        # Common fully connected layers
        x = F.relu(self.fc1(x))
        x = F.relu(self.fc2(x))
        
        # Advantage stream
        adv = F.relu(self.adv_fc1(x))
        adv = self.adv_fc2(adv)
        
        # Value stream
        val = F.relu(self.val_fc1(x))
        val = self.val_fc2(val)
        
        # Combine Advantage and Value streams
        action_logits = adv + val - adv.mean(dim=1, keepdim=True)
        action_probs = F.softmax(action_logits, dim=-1)
        
        return action_probs, val

