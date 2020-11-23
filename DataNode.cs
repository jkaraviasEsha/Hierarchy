using System;
using System.Collections.Generic;
using System.Reflection;
using System.Text;

namespace Hierarchy
{
    public class DataNode
    {
        public DataNode()
        {
            
        }

        public virtual Int64 Id { get; set; }
        public virtual TreeNode TreeNode { get; set; }
        public DataNode(string textData, long integerData, List<string> list)
        {
            this.TextData = textData;
            this.IntegerData = integerData;
            this.ListData = list;
        }
        public virtual String TextData { get; set; }
        public virtual Int64  IntegerData { get; set; }
        public virtual IList<String> ListData { get; set; }
        private PropertyInfo[] _propertyInfos = null;
        public override string ToString()
        {
            _propertyInfos ??= this.GetType().GetProperties();

            var sb = new StringBuilder();

            foreach (var info in _propertyInfos)
            {
                var value = info.GetValue(this, null) ?? "(null)";
                sb.AppendLine("\t"+info.Name + ": " + value.ToString());
            }

            return sb.ToString();
        }
        
    }
}