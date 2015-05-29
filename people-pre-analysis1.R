library(RMySQL)

username <- readline(prompt= "Please enter your user name: ")
pass <- readline(prompt= "Please enter your password: ")
db <- readline(prompt= "Please enter your database name: ")
mydb = dbConnect(MySQL(), user=username, password=pass, dbname=db, host='localhost')
require(ggplot2)

repeat
{
  choice <- readline(prompt= "Select your choice: \n
   0.Generate csv\n
   1.Number of times each person is the committer\n
   2.Number of times each person is the author\n
   3.Number of diff repo each person committed to\n
   4.Number of diff repo each person authored to \n
   5.Exit\n")
  
  print(choice)
  if (choice==0)
  {
    c1n3 = dbGetQuery(mydb,"select pm.id as 'people_id', count(s.id) as 'isCommitter', count(distinct repository_id) as 'repoCommitted' from scmlog s join people_merged pm on s.committer_id=pm.id group by s.committer_id;")
    c2n4 = dbGetQuery(mydb, "select pm.id as 'people_id', count(s.id) as 'isAuthor', count(distinct repository_id) as 'repoAuthored' from scmlog s join people_merged pm on s.author_id =pm.id group by s.author_id;")  
    total<-merge(x= c1n3, y=c2n4)
    write.csv(file="poverview.csv", x=total)
    
  }
  
  
  if (choice==1)
  {
    NumTimeCommitter = dbGetQuery(mydb, "select pm.id as 'people_id', count(s.id) as 'pCommitter' from scmlog s join people_merged pm on s.committer_id=pm.id group by s.committer_id;")
    attach(NumTimeCommitter)
    ggplot(NumTimeCommitter, aes(x=pCommitter)) + geom_histogram() + ylab("Frequency") + ggtitle("Number of times each person is the committer")
    ggsave(file="PhistoCommitter.png")
    ggplot(NumTimeCommitter, aes(x=people_id, y=pCommitter)) + geom_boxplot() + ylab("No.of times") + ggtitle("Number of times each person is the committer")
    ggsave(file="PboxCommitter.png")
    
  }
  
  
  if (choice==2)
  {
    NumTimeAuthors  = dbGetQuery(mydb, "select pm.id as 'people_id', count(s.id) as 'pAuthor' from scmlog s join people_merged pm on s.author_id=pm.id group by s.author_id;")
    attach(NumTimeAuthors)
    ggplot(NumTimeAuthors, aes(x=pAuthor)) + geom_histogram() + ylab("Frequency") + ggtitle("Number of times each person is the author")
    ggsave(file="PhistoAuthor.png")
    ggplot(NumTimeAuthors, aes(x=people_id, y=pAuthor)) + geom_boxplot() + ylab("No.of times") + ggtitle("Number of times each person is the author")
    ggsave(file="PboxAuthor.png")
  }
  
  
  if (choice==3)
  {
    pTimesCommitted = dbGetQuery(mydb, "select committer_id as 'Committer' , count(distinct repository_id) as 'repoCommitted' from scmlog group by committer_id;")
    attach(pTimesCommitted)
    ggplot(pTimesCommitted, aes(x=repoCommitted)) + geom_histogram() + ylab("Frequency") + ggtitle("Number of diff repo each person committed to")
    ggsave(file="PhistoCommitted.png")
    ggplot(pTimesCommitted, aes(x=Committer, y=repoCommitted)) + geom_boxplot() + ylab("Number of Repo Committed") + ggtitle("Number of diff repo each person committed to")
    ggsave(file="PboxCommitted.png")
  }
  
  
  if (choice==4)
  {
    pTimesAuthored = dbGetQuery(mydb, "select author_id as 'Author' , count(distinct repository_id) as 'repoAuthored' from scmlog group by author_id;")
    attach(pTimesAuthored)
    ggplot(pTimesAuthored, aes(x=repoAuthored)) + geom_histogram() + ylab("Frequency") + ggtitle("Number of diff repo each person authored to")
    ggsave(file="PhistoAuthored.png")
    ggplot(pTimesAuthored, aes(x=Author, y=repoAuthored)) + geom_boxplot() + ylab("Number of Repo Authored") + ggtitle("Number of diff repo each person authored to")
    ggsave(file="PboxAuthored.png")
  }
  
  
  if (choice==5)
  {
    readline(prompt <- "Bye Bye~ ~ ~")
    break
  }
  
}

