library(ggplot2)
library(RMySQL)

gnome = dbConnect(MySQL(), user=.rs.askForPassword("Enter user:"), password=.rs.askForPassword("Enter password:"), dbname=.rs.askForPassword("Enter database:"), host='localhost')

repeat{
  option <- readline(prompt="Select from following options:
  0: Generate csv file\n
  1: Number of committers\n
  2: Number of authors\n
  3: Number of repo each person commits to\n
  4: Number of repo: authored commits to\n
  5: Exit ")
  
  
  print(option)
  
  if(option==0) {
    overviewCommitters = dbGetQuery(gnome, "select people_merged.id as 'people',count(scmlog.id) as 'committers', count(distinct repository_id) as 'repositoryCommitter' 
                                    FROM scmlog 
                                    JOIN people_merged ON scmlog.committer_id = people_merged.id 
                                    GROUP BY scmlog.committer_id;")
    
    overviewAuthors = dbGetQuery(gnome,"select people_merged.id as 'people',count(scmlog.id) as 'authors', count(distinct repository_id) as 'repositoryAuthor' 
                                 FROM scmlog 
                                 JOIN people_merged ON scmlog.author_id = people_merged.id 
                                 GROUP BY scmlog.author_id;")
    completedata <- merge(x=overviewCommitters, y=overviewAuthors)
    write.csv(file="pOverview.csv", x=completedata)
    
    
    
  }
  if(option== 1) {
    #fetch the number of times each person is the committer
    pCommitters = dbGetQuery(gnome, "SELECT people_merged.id as 'people',count(scmlog.id) as 'committers'
                             FROM scmlog
                             JOIN people_merged ON scmlog.committer_id = people_merged.id
                             GROUP BY scmlog.committer_id;")
    
    #plot histogram for Number of times each person is the committer
    pCommitsHist <- ggplot(pCommitters, aes(committers)) + geom_histogram() + ylab("Frequency") +ggtitle("No. Of people as committers")
    ggsave("pCommitterHistogram.png")
    
    
    #plot boxplot for number of times each person is the committer
    #boxplot with continuous x
    pCommitsBox <- ggplot(pCommitters, aes(people,committers)) + geom_boxplot() + ylab("Number of people")+ ggtitle("No. Of people as committers")
    ggsave("pCommitterBoxPlot.png")
  }
  if(option==2){
    #fetch the number of times each person is the author
    pAuthors = dbGetQuery(gnome,"SELECT  people_merged.id as 'people',count(scmlog.id) as 'authors'
                          FROM scmlog
                          JOIN people_merged ON scmlog.author_id = people_merged.id
                          GROUP BY scmlog.author_id;")
    
    #plot histogram for the number of times each person is the author
    pAuthorsHist <- ggplot(pAuthors, aes(authors)) + geom_histogram() + ylab("Frequency") +ggtitle("No. Of people as authors")
    ggsave("pAuthorsHistogram.png")
    
    #plot boxplot for the number of times each person is the author
    pAuthorsBox <- ggplot(pAuthors, aes(people, authors)) + geom_boxplot() + ylab("Number of authors") +ggtitle("No. Of people as authors")
    ggsave("pAuthorsBoxPlot.png")
  }
  if(option==3) {
    #fetch number of different repositories each person has committed to
    pRepoOfCommitters = dbGetQuery(gnome, "select committer_id as 'committer',count(distinct repository_id) as 'repository'
                                   from scmlog
                                   group by committer_id;")
    #plot histogram for the  number of different repositories each person has committed to
    pRepoCommitHist <- ggplot(pRepoOfCommitters, aes(repository)) + geom_histogram() + ylab("Frequency") +ggtitle("No. Of different repos per committer")
    ggsave("pRepoCommitterHist.png")
    
    #plot boxplot for the number of different repositories each person has committed to
    pRepoCommitBox <- ggplot(pRepoOfCommitters, aes(committer, repository)) + geom_boxplot() + ylab("Number of repository") +ggtitle("No. Of different repos per committer")
    ggsave("pRepoCommitterBoxPlot.png")
    
    
  }
  if(option==4) {
    
    #fetch number of different repositories each person has authored commits to
    pRepoOfAuthors = dbGetQuery(gnome, "select author_id as 'author' ,count(distinct repository_id) as 'repository'
                                              from scmlog
                                              group by author_id;")
    
    #plot histogram for the number of different repositories each person has authored commits to
    pRepoAuthorHist <- ggplot(pRepoOfAuthors, aes(repository)) + geom_histogram() + ylab("Frequency") +ggtitle("No. Of different repos per authors")
    ggsave("R language/1st Project/graphs/people-pre-analysis/RepoOfAuthors/pRepoAuthorHist.png")
    
    #plot boxplot for the number of different repositories each person has authored commits to
    pRepoAuthorBox <- ggplot(pRepoOfAuthors, aes(author, repository)) + geom_boxplot() + ylab("Number of repository") +ggtitle("No. Of different repos per author")
    ggsave("pRepoAuthorBoxPlot.png")
    
  }
  if(option==5) {
    
    
    break; }
  
}
