using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace PRN211_HE171073_FeedbackAndQASystemFAP.Models
{
    public partial class PRN211_FeedbackAndQASystemContext : DbContext
    {
        public PRN211_FeedbackAndQASystemContext()
        {
        }

        public PRN211_FeedbackAndQASystemContext(DbContextOptions<PRN211_FeedbackAndQASystemContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Account> Accounts { get; set; } = null!;
        public virtual DbSet<Answer> Answers { get; set; } = null!;
        public virtual DbSet<Course> Courses { get; set; } = null!;
        public virtual DbSet<Do> Dos { get; set; } = null!;
        public virtual DbSet<FbOption> FbOptions { get; set; } = null!;
        public virtual DbSet<FbQuestion> FbQuestions { get; set; } = null!;
        public virtual DbSet<Feedback> Feedbacks { get; set; } = null!;
        public virtual DbSet<Group> Groups { get; set; } = null!;
        public virtual DbSet<Instructor> Instructors { get; set; } = null!;
        public virtual DbSet<Question> Questions { get; set; } = null!;
        public virtual DbSet<Response> Responses { get; set; } = null!;
        public virtual DbSet<Role> Roles { get; set; } = null!;
        public virtual DbSet<Status> Statuses { get; set; } = null!;
        public virtual DbSet<Student> Students { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseSqlServer(new ConfigurationBuilder().AddJsonFile("appsettings.json").Build().GetConnectionString("MyConn"));
            }

        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Account>(entity =>
            {
                entity.HasKey(e => e.Username)
                    .HasName("PK__Account__F3DBC5739BEE0E19");

                entity.ToTable("Account");

                entity.Property(e => e.Username)
                    .HasMaxLength(150)
                    .IsUnicode(false)
                    .HasColumnName("username");

                entity.Property(e => e.Password)
                    .HasMaxLength(150)
                    .IsUnicode(false)
                    .HasColumnName("password");

                entity.HasMany(d => d.Roles)
                    .WithMany(p => p.Usernames)
                    .UsingEntity<Dictionary<string, object>>(
                        "AccountRole",
                        l => l.HasOne<Role>().WithMany().HasForeignKey("RoleId").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("FK_AccountRole_Role"),
                        r => r.HasOne<Account>().WithMany().HasForeignKey("Username").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("FK_AccountRole_Account"),
                        j =>
                        {
                            j.HasKey("Username", "RoleId");

                            j.ToTable("AccountRole");

                            j.IndexerProperty<string>("Username").HasMaxLength(150).IsUnicode(false).HasColumnName("username");

                            j.IndexerProperty<int>("RoleId").HasColumnName("roleId");
                        });
            });

            modelBuilder.Entity<Answer>(entity =>
            {
                entity.ToTable("Answer");

                entity.Property(e => e.AnswerId).HasColumnName("answerId");

                entity.Property(e => e.AnswerContent).HasColumnName("answerContent");

                entity.Property(e => e.AnswerTime)
                    .HasColumnType("datetime")
                    .HasColumnName("answerTime");

                entity.Property(e => e.FileUrl)
                    .IsUnicode(false)
                    .HasColumnName("fileURL");

                entity.Property(e => e.QuestionId).HasColumnName("questionId");

                entity.HasOne(d => d.Question)
                    .WithMany(p => p.Answers)
                    .HasForeignKey(d => d.QuestionId)
                    .HasConstraintName("FK_Answer_Question");
            });

            modelBuilder.Entity<Course>(entity =>
            {
                entity.ToTable("Course");

                entity.Property(e => e.CourseId)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("courseId");

                entity.Property(e => e.CourseName)
                    .HasMaxLength(100)
                    .HasColumnName("courseName");
            });

            modelBuilder.Entity<Do>(entity =>
            {
                entity.ToTable("Do");

                entity.Property(e => e.DoId).HasColumnName("doId");

                entity.Property(e => e.DoComment).HasColumnName("doComment");

                entity.Property(e => e.DoStatus).HasColumnName("doStatus");

                entity.Property(e => e.DoTime)
                    .HasColumnType("datetime")
                    .HasColumnName("doTime");

                entity.Property(e => e.FeedbackId).HasColumnName("feedbackId");

                entity.Property(e => e.StudentId)
                    .HasMaxLength(8)
                    .IsUnicode(false)
                    .HasColumnName("studentId");

                entity.HasOne(d => d.Feedback)
                    .WithMany(p => p.Dos)
                    .HasForeignKey(d => d.FeedbackId)
                    .HasConstraintName("FK_Do_Feedback");

                entity.HasOne(d => d.Student)
                    .WithMany(p => p.Dos)
                    .HasForeignKey(d => d.StudentId)
                    .HasConstraintName("FK_Do_Student");
            });

            modelBuilder.Entity<FbOption>(entity =>
            {
                entity.ToTable("FbOption");

                entity.Property(e => e.FbOptionId)
                    .ValueGeneratedNever()
                    .HasColumnName("fbOptionId");

                entity.Property(e => e.FbOptionContent).HasColumnName("fbOptionContent");

                entity.Property(e => e.FbOptionGpa).HasColumnName("fbOptionGPA");

                entity.Property(e => e.FbQuestionId).HasColumnName("fbQuestionId");

                entity.HasOne(d => d.FbQuestion)
                    .WithMany(p => p.FbOptions)
                    .HasForeignKey(d => d.FbQuestionId)
                    .HasConstraintName("FK_fbOption_FbQuestion");
            });

            modelBuilder.Entity<FbQuestion>(entity =>
            {
                entity.ToTable("FbQuestion");

                entity.Property(e => e.FbQuestionId)
                    .ValueGeneratedNever()
                    .HasColumnName("fbQuestionId");

                entity.Property(e => e.FbQuestionContent)
                    .HasMaxLength(100)
                    .HasColumnName("fbQuestionContent");

                entity.Property(e => e.FbQuestionTitle)
                    .HasMaxLength(100)
                    .HasColumnName("fbQuestionTitle");
            });

            modelBuilder.Entity<Feedback>(entity =>
            {
                entity.ToTable("Feedback");

                entity.Property(e => e.FeedbackId).HasColumnName("feedbackId");

                entity.Property(e => e.FeedbackCloseDay)
                    .HasColumnType("datetime")
                    .HasColumnName("feedbackCloseDay");

                entity.Property(e => e.FeedbackOpenDay)
                    .HasColumnType("datetime")
                    .HasColumnName("feedbackOpenDay");

                entity.Property(e => e.GroupId).HasColumnName("groupId");

                entity.HasOne(d => d.Group)
                    .WithMany(p => p.Feedbacks)
                    .HasForeignKey(d => d.GroupId)
                    .HasConstraintName("FK_Feedback_Group");

                entity.HasMany(d => d.FbQuestions)
                    .WithMany(p => p.Feedbacks)
                    .UsingEntity<Dictionary<string, object>>(
                        "Contain",
                        l => l.HasOne<FbQuestion>().WithMany().HasForeignKey("FbQuestionId").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("FK_Contain_FbQuestion"),
                        r => r.HasOne<Feedback>().WithMany().HasForeignKey("FeedbackId").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("FK_Contain_Feedback"),
                        j =>
                        {
                            j.HasKey("FeedbackId", "FbQuestionId");

                            j.ToTable("Contain");

                            j.IndexerProperty<int>("FeedbackId").HasColumnName("feedbackId");

                            j.IndexerProperty<int>("FbQuestionId").HasColumnName("fbQuestionId");
                        });
            });

            modelBuilder.Entity<Group>(entity =>
            {
                entity.ToTable("Group");

                entity.Property(e => e.GroupId)
                    .ValueGeneratedNever()
                    .HasColumnName("groupId");

                entity.Property(e => e.CourseId)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("courseId");

                entity.Property(e => e.GroupName)
                    .HasMaxLength(20)
                    .IsUnicode(false)
                    .HasColumnName("groupName");

                entity.Property(e => e.InstructorId)
                    .HasMaxLength(20)
                    .IsUnicode(false)
                    .HasColumnName("instructorId");

                entity.HasOne(d => d.Course)
                    .WithMany(p => p.Groups)
                    .HasForeignKey(d => d.CourseId)
                    .HasConstraintName("FK_Group_Course");

                entity.HasOne(d => d.Instructor)
                    .WithMany(p => p.Groups)
                    .HasForeignKey(d => d.InstructorId)
                    .HasConstraintName("FK_Group_Instructor");

                entity.HasMany(d => d.Students)
                    .WithMany(p => p.Groups)
                    .UsingEntity<Dictionary<string, object>>(
                        "Participate",
                        l => l.HasOne<Student>().WithMany().HasForeignKey("StudentId").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("FK_Participate_Student"),
                        r => r.HasOne<Group>().WithMany().HasForeignKey("GroupId").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("FK_Participate_Group"),
                        j =>
                        {
                            j.HasKey("GroupId", "StudentId");

                            j.ToTable("Participate");

                            j.IndexerProperty<int>("GroupId").HasColumnName("groupId");

                            j.IndexerProperty<string>("StudentId").HasMaxLength(8).IsUnicode(false).HasColumnName("studentId");
                        });
            });

            modelBuilder.Entity<Instructor>(entity =>
            {
                entity.ToTable("Instructor");

                entity.HasIndex(e => e.AccountId, "UQ__Instruct__F267251F2EDB32A1")
                    .IsUnique();

                entity.Property(e => e.InstructorId)
                    .HasMaxLength(20)
                    .IsUnicode(false)
                    .HasColumnName("instructorId");

                entity.Property(e => e.AccountId)
                    .HasMaxLength(150)
                    .IsUnicode(false)
                    .HasColumnName("accountId");

                entity.Property(e => e.Gender).HasColumnName("gender");

                entity.Property(e => e.InstructorImage)
                    .IsUnicode(false)
                    .HasColumnName("instructorImage");

                entity.Property(e => e.InstructorName)
                    .HasMaxLength(100)
                    .HasColumnName("instructorName");

                entity.HasOne(d => d.Account)
                    .WithOne(p => p.Instructor)
                    .HasForeignKey<Instructor>(d => d.AccountId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Instructor_Account");
            });

            modelBuilder.Entity<Question>(entity =>
            {
                entity.ToTable("Question");

                entity.Property(e => e.QuestionId).HasColumnName("questionId");

                //entity.Property(e => e.FileUrl)
                //    .IsUnicode(false)
                //    .HasColumnName("fileURL");

                entity.Property(e => e.GroupId).HasColumnName("groupId");

                entity.Property(e => e.QuestionDescription).HasColumnName("questionDescription");

                entity.Property(e => e.QuestionSentTime)
                    .HasColumnType("datetime")
                    .HasColumnName("questionSentTime");

                entity.Property(e => e.QuestionStatus).HasColumnName("questionStatus");

                entity.Property(e => e.QuestionTitle)
                    .HasMaxLength(50)
                    .HasColumnName("questionTitle");

                entity.Property(e => e.StudentId)
                    .HasMaxLength(8)
                    .IsUnicode(false)
                    .HasColumnName("studentId");

                entity.HasOne(d => d.Group)
                    .WithMany(p => p.Questions)
                    .HasForeignKey(d => d.GroupId)
                    .HasConstraintName("FK_Question_Group");

                entity.HasOne(d => d.QuestionStatusNavigation)
                    .WithMany(p => p.Questions)
                    .HasForeignKey(d => d.QuestionStatus)
                    .HasConstraintName("FK_Question_Status");

                entity.HasOne(d => d.Student)
                    .WithMany(p => p.Questions)
                    .HasForeignKey(d => d.StudentId)
                    .HasConstraintName("FK_Question_Student");
            });

            modelBuilder.Entity<Response>(entity =>
            {
                entity.ToTable("Response");

                entity.Property(e => e.ResponseId).HasColumnName("responseId");

                entity.Property(e => e.DoId).HasColumnName("doId");

                entity.Property(e => e.FbQuestionId).HasColumnName("fbQuestionId");

                entity.Property(e => e.SelectedOptionId).HasColumnName("selectedOptionId");

                entity.HasOne(d => d.Do)
                    .WithMany(p => p.Responses)
                    .HasForeignKey(d => d.DoId)
                    .HasConstraintName("FK_Response_Do");

                entity.HasOne(d => d.FbQuestion)
                    .WithMany(p => p.Responses)
                    .HasForeignKey(d => d.FbQuestionId)
                    .HasConstraintName("FK_Response_FbQuestion");

                entity.HasOne(d => d.SelectedOption)
                    .WithMany(p => p.Responses)
                    .HasForeignKey(d => d.SelectedOptionId)
                    .HasConstraintName("FK_Response_FbOption");
            });

            modelBuilder.Entity<Role>(entity =>
            {
                entity.ToTable("Role");

                entity.Property(e => e.RoleId)
                    .ValueGeneratedNever()
                    .HasColumnName("roleId");

                entity.Property(e => e.RoleName)
                    .HasMaxLength(150)
                    .IsUnicode(false)
                    .HasColumnName("roleName");
            });

            modelBuilder.Entity<Status>(entity =>
            {
                entity.ToTable("Status");

                entity.Property(e => e.StatusId)
                    .ValueGeneratedNever()
                    .HasColumnName("statusId");

                entity.Property(e => e.StatusName)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("statusName");
            });

            modelBuilder.Entity<Student>(entity =>
            {
                entity.ToTable("Student");

                entity.HasIndex(e => e.AccountId, "UQ__Student__F267251FAAAFE394")
                    .IsUnique();

                entity.Property(e => e.StudentId)
                    .HasMaxLength(8)
                    .IsUnicode(false)
                    .HasColumnName("studentId");

                entity.Property(e => e.AccountId)
                    .HasMaxLength(150)
                    .IsUnicode(false)
                    .HasColumnName("accountId");

                entity.Property(e => e.Gender).HasColumnName("gender");

                entity.Property(e => e.StudentImage)
                    .IsUnicode(false)
                    .HasColumnName("studentImage");

                entity.Property(e => e.StudentName)
                    .HasMaxLength(100)
                    .HasColumnName("studentName");

                entity.HasOne(d => d.Account)
                    .WithOne(p => p.Student)
                    .HasForeignKey<Student>(d => d.AccountId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Student_Account");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
