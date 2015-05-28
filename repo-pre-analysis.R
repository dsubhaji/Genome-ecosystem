library(RMySQL)
library(ggplot2)

gnome = dbConnect(MySQL(), user=.rs.askForPassword("Enter user:"), password=.rs.askForPassword("Enter password:"), dbname=.rs.askForPassword("Enter database:"), host='localhost')


repeat{
choice <- readline(prompt="Please select from following options: 
         \n0: Generate csv file
         \n1: Number of Commits 
         \n2: Number of Committers
         \n3: Number of Authors
         \n4: Number of Files
         \n5: Exit program")


print(choice)
if(choice==0){
  overview = fetch(dbSendQuery(gnome,"select distinct s.repository_id, count(distinct s.date) as 'commits', count(distinct s.committer_id) as 'committers', count(distinct s.author_id) as 'authors', count( distinct c.intensity) as 'files'
                  from scmlog s, commits_activities c
                  where c.id = s.id
                  group by s.repository_id;"))
  write.csv(file="overview.csv", x=overview)
}

if(choice==1){
  # fetch number of commits for each repository
  noOfCommits = dbGetQuery(gnome, "select  count(distinct date) as 'commits', repository_id 
                    FROM scmlog
                    GROUP BY repository_id;")
 
  #plot histogram for number of commits per repo
  commitsHist <- ggplot(noOfCommits, aes(commits)) + geom_histogram() + ylab("Frequency") +ggtitle("No. Of Commits per Repo")
  ggsave("commitHistogram.png")
  
  #plot boxplot for number of commits per repo
  commitsBox <- ggplot(noOfCommits, aes(repository_id, commits)) + geom_boxplot() + ylab("Number of Commits")+ ggtitle("No. Of Commits per Repo")
  ggsave("commitBoxPlot.png")
}
  

if(choice==2){
  #fetch number of committers for each repository
  noOfCommitters =dbGetQuery(gnome, "select  count(distinct committer_id) as 'committers', repository_id
                        from scmlog
                        group by repository_id; ")
  
  #plot histogram for number of committers per repo
  committersHist <- ggplot(noOfCommitters, aes(committers)) + geom_histogram() + ylab("Frequency") +ggtitle("No. Of Committers per Repo")
  ggsave("committersHistogram.png")
  
  #plot box plot for number of committers per repo
  committersBox <- ggplot(noOfCommitters, aes(repository_id,committers)) + geom_boxplot()+ ylab("Number of Committers") + ggtitle("No. Of Committers per Repo")
  ggsave("committersBoxPlot.png")
}


if(choice==3){
  #fetch the number of authors for each repository
  noOfAuthors = dbGetQuery(gnome, "select  count(distinct author_id) as 'authors', repository_id
                                      from scmlog
                                      group by repository_id;")
  
  #plot histogram for number of authors per repo
  authorsHist <- ggplot(noOfAuthors, aes(authors)) + geom_histogram() + ylab("Frequency") +ggtitle("No. Of Authors per Repo")
  ggsave("authorsHistogram.png")
  
  #plot boxplot for number of authors per repo
  authorsBox <- ggplot(noOfAuthors, aes(repository_id, authors)) + geom_boxplot() + ylab("Number of Authors") +ggtitle("No. Of Authors per Repo")
  ggsave("R language/1st Project/graphs/repo-pre-analysis/Authors/authorsBoxPlot.png")
}


if(choice==4){
  #fetch the number of files for each repository
  noOfFiles = dbGetQuery(gnome, "select count(distinct c.intensity) as 'files' , s.repository_id
                                      from commits_activities c, scmlog s
                                      where c.id = s.id
                                      group by s.repository_id;")
  
  #plot histogram for number of files per repo
  filesHist <- ggplot(noOfFiles, aes(files)) + geom_histogram() + ylab("Frequency") +ggtitle("No. Of Files per Repo")
  ggsave("filesHistogram.png")
  
  #plot boxplot for number of files per repo
  filesBox <- ggplot(noOfFiles, aes(repository_id, files)) + geom_boxplot() + ylab("Number of Files") +ggtitle("No. Of Files per Repo")
  ggsave("filesBoxPlot.png")
}

if(choice==5){
  
  
  break;
  
}

}



#to view plots: 
#commitsHist : a histogram of number of commits for each repository
#commitsBox : a box plot of number of commits for each repository
#committersHist : a histogram of number of committers for each repository
#committersBox : a box plot of number of committers for each repository
#authorsHist : a histogram of number of authors for each repository
#authorsBox : a box plot of number of authors for each repository
#filesHist : a histogram of number of files for each repository
#filesHist : a box plot of number of files for each repository





