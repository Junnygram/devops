
### Git Module Notes

#### 1. **Version Control Basics**
   - **Centralized Version Control Systems (CVCS):** Single repository for all project versions. Example: CVS, SVN.
   - **Distributed Version Control Systems (DVCS):** Every developer has a local copy of the repository. Example: Git, Mercurial.

#### 2. **Git Basics**
   - **Repository (Repo):** A directory that contains your project files and the `.git` directory, which tracks all changes.
   - **Working Directory:** The files in your project folder.
   - **Staging Area:** A file (index) that contains changes that will be included in the next commit.
   - **Local Repository:** The `.git` directory in your project.
   - **Remote Repository:** A repository hosted on the internet or another network.

#### 3. **Common Git Commands**
   - **Initialize a Repository:**
     ```bash
     git init
     ```
   - **Clone a Repository:**
     ```bash
     git clone <url>
     ```
   - **Check Repository Status:**
     ```bash
     git status
     ```
   - **Add Changes to Staging:**
     ```bash
     git add <file>  # Add specific file
     git add .       # Add all files
     ```
   - **Commit Changes:**
     ```bash
     git commit -m "Your commit message"
     ```
   - **View Commit History:**
     ```bash
     git log
     ```
   - **Push to Remote Repository:**
     ```bash
     git push origin <branch-name>
     ```
   - **Pull from Remote Repository:**
     ```bash
     git pull origin <branch-name>
     ```
   - **Create a New Branch:**
     ```bash
     git branch <branch-name>
     ```
   - **Switch to a Branch:**
     ```bash
     git checkout <branch-name>
     ```
   - **Merge Branches:**
     ```bash
     git merge <branch-name>
     ```
   - **Resolve Merge Conflicts:** Open affected files, make necessary changes, and then:
     ```bash
     git add <resolved-file>
     git commit -m "Resolved merge conflict"
     ```
   - **Delete a Branch:**
     ```bash
     git branch -d <branch-name>
     ```

#### 4. **Advanced Git Commands**
   - **Stash Changes:** Temporarily store changes you aren’t ready to commit.
     ```bash
     git stash
     git stash pop  # Apply stashed changes
     ```
   - **Rebase Branch:** Reapply commits on top of another base tip.
     ```bash
     git rebase <base-branch>
     ```
   - **Cherry-pick Commit:** Apply a commit from another branch to the current branch.
     ```bash
     git cherry-pick <commit-hash>
     ```
   - **Reset Changes:**
     - **Soft Reset:** Keep changes in the working directory.
       ```bash
       git reset --soft <commit-hash>
       ```
     - **Hard Reset:** Remove all changes, including staged files.
       ```bash
       git reset --hard <commit-hash>
       ```

#### 5. **Best Practices**
   - **Commit Often:** Make small, frequent commits with clear messages.
   - **Use Branches:** Keep your `main` branch clean by using feature branches.
   - **Pull Before You Push:** Always pull the latest changes from the remote before pushing your own changes.

This outline can be turned into a Markdown file for GitHub, where you can add additional details, examples, or explanations as needed. If you need help with specific parts or a more detailed explanation, let me know!
