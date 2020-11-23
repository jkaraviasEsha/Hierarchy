using System;
using System.Collections.Generic;
using System.Text;

namespace Hierarchy
{
    public class TreeNode
    {
        public virtual Int64 Id { get; set; }
        public virtual ISet<TreeNode> Children { get; set; }
        public virtual TreeNode Parent { get; set; }
        public virtual string Data { get; set; }
        public virtual DataNode DataNode { get; set; }
        public virtual ISet<TreeNode> Descendants { get; set; }

        public TreeNode()
        {
        }

        public TreeNode(String data)
        {
            Data = data;
        }

        public virtual void AddChild(TreeNode child)
        {
            Children ??= new HashSet<TreeNode>();
            Children.Add(child);
            child.Parent = this;
        }
    }

}