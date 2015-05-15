library(RMySQL)
mydb = dbConnect(MySQL(), user='root', password='pa$$w0rds', dbname='gnome', host='localhost')
require(ggplot2)

repeat
{
choice <- readline(prompt= "Select your choice: \n
                   0.Generate csv\n
                   1.Number of Commits\n
                   2.Number of Authors\n
                   3.Number of Committers\n
                   4.Number of Files \n
                   5.Exit program\n")

print(choice)
if (choice==0)
{
  Overview = fetch(dbSendQuery(mydb, "select s.repository_id, 
                count(distinct s.date) as 'Commits', 
                count(distinct s.author_id) as 'Authors', 
                count(distinct s.committer_id) as 'Committers',
                count(distinct c.intensity) as 'Files'
                from scmlog s, commits_activities c
                where c.id = s.id
                group by s.repository_id;"))  
  write.csv(file="View Data in csv/overview.csv", x=Overview)
  
}


if (choice==1)
{
  NoCommits = fetch(dbSendQuery(mydb, "select repository_id, count(distinct date) as 'Commit' from scmlog group by repository_id;"))
  attach(NoCommits)
  ggplot(NoCommits, aes(x=Commit)) + geom_histogram() + ylab("Frequency") + ggtitle("Number of Commits per Repo")
  ggsave(file="Commits/HistoCommits.png")
  ggplot(NoCommits, aes(x=repository_id, y=Commit)) + geom_boxplot() + ylab("No.of Commits") + ggtitle("Number of Commits per Repo")
  ggsave(file="Commits/BoxCommits.png")
  
}


if (choice==2)
{
  NoAuthors  = fetch(dbSendQuery(mydb, "select repository_id, count(distinct author_id) as 'Author' from scmlog group by repository_id;"))
  attach(NoAuthors)
  ggplot(NoAuthors, aes(x=Author)) + geom_histogram() + ylab("Frequency") + ggtitle("Number of Authors per Repo")
  ggsave(file="Authors/HistoAuthors.png")
  ggplot(NoAuthors, aes(x=repository_id, y=Author)) + geom_boxplot() + ylab("No.of Authors") + ggtitle("Number of Authors per Repo")
  ggsave(file="Authors/BoxAuthors.png")
  
}


if (choice==3)
{
  NoCommitters = fetch(dbSendQuery(mydb, "select repository_id, count(distinct committer_id) as 'Committer' from scmlog group by repository_id;"))
  attach(NoCommitters)
  ggplot(NoCommitters, aes(x=Committer)) + geom_histogram() + ylab("Frequency") + ggtitle("Number of Committers per Repo")
  ggsave(file="Committers/HistoCommitters.png")
  ggplot(NoCommitters, aes(x=repository_id, y=Committer)) + geom_boxplot() + ylab("No.of Committers") + ggtitle("Number of Committers per Repo")
  ggsave(file="Committers/BoxCommitters.png")
}


if (choice==4)
{
  NoFiles = fetch(dbSendQuery(mydb, "select s.repository_id, count(distinct c.intensity) as 'File' from scmlog s, commits_activities c where c.id = s.id group by s.repository_id;"))
  attach(NoFiles)
  ggplot(NoFiles, aes(x=File)) + geom_histogram() + ylab("Frequency") + ggtitle("Number of Files per Repo")
  ggsave(file="Files/HistoFiles.png")
  ggplot(NoFiles, aes(x=repository_id, y=File)) + geom_boxplot() + ylab("No.of Files") + ggtitle("Number of Files per Repo")
  ggsave(file="Files/BoxFiles.png")
}


if (choice==5)
{
  readline(prompt <- "Byeee Byeee~~~")
  break
}

}


