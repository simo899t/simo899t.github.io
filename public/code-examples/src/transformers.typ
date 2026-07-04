== Attention/self-attention
The input sequence is used to create queries, keys, and values!
As an example, the formular $ "Attention"(Q,K,V) = softmax((Q K^T)/sqrt(d_k)) dot V $
```py
class SelfAttention(nn.Module):
    def __init__(self, d_model, d_key):
        super().__init__()
        self.w_q = nn.Linear(d_model, d_key)
        self.w_k = nn.Linear(d_model, d_key)
        self.w_v = nn.Linear(d_model, d_model)

    def forward(self, x):
        q = self.w_q(x)
        v = self.w_v(x)
        k = self.w_k(x)
        
        def attention(Q,K,V):
            return F.softmax((Q @ torch.transpose(K, -2, -1))/sqrt(K.size(dim=-1)), dim=-1) @ V
        
        return attention(q,k,v)
``` 


== Multi-headed
More heads = more attention between parameter / more complexity

Example:
```py
class MultiHeadSelfAttention(nn.Module):
    def __init__(self, d_model, d_key, n_heads):
        super().__init__()
        self.heads = nn.ModuleList([SelfAttention(d_model, d_key) for _ in range(n_heads)])
        self.w_o = nn.Linear(n_heads * d_model, d_model)

    def forward(self, x):
        result = []
        for head in self.heads:
            result.append(head.forward(x))
        result = torch.cat(result,dim=-1)
        return self.w_o(result)
``` 