using System;
using System.Collections.Generic;

namespace Hierarchy
{
    public class DataNode
    {
        public DataNode()
        {
            
        }

        public virtual Int64 Id { get; set; }
        public virtual TreeNode TreeNode { get; set; }
        public DataNode(string textData, long integerData)
        {
            this.TextData = textData;
            this.IntegerData = integerData;
        }
        public virtual String TextData { get; set; }
        public virtual Int64  IntegerData { get; set; }
       
    }
}