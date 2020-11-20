using System;
using System.Linq;
using NHibernate;
using NHibernate.Cfg;
using NHibernate.Context;

namespace Hierarchy
{
    class Program
    {
        static void Main(string[] args)
        {

            ISessionFactory sessionFactory = new Configuration().Configure().BuildSessionFactory();
            ISession session = sessionFactory.OpenSession();
            CurrentSessionContext.Bind(session);

            TreeNode root = BuildTree();

            try
            {
                using (ITransaction tx = session.BeginTransaction())
                { 
                    
                    var id = session.Save(root);
                    tx.Commit();
                    session.Clear();
                    var loadedRoot = session.Get<TreeNode>(id);

                    Console.WriteLine("Children.First.Children.First.Data: "+loadedRoot.Children.First().Children.First().Data);

                }
            }
            finally
            {
                session.Close();
            }
        }

        private static TreeNode BuildTree()
        {
            TreeNode root = new TreeNode("Root");
            TreeNode l10 = new TreeNode("1,0");
            TreeNode l11 = new TreeNode("1,1");
            TreeNode l20 = new TreeNode("2,0");
            TreeNode l21 = new TreeNode("2,1");
            TreeNode l22 = new TreeNode("2,2");
            TreeNode l30 = new TreeNode("3,0");
            
            root.AddChild(l10);
            root.AddChild(l11);
            l10.AddChild(l20);
            l10.AddChild(l21);
            l11.AddChild(l22);
            l22.AddChild(l30);

            return root;


        }
    }
}
