public class githubWrapper{
	public String url;	//https://api.github.com/repos/prabhusajjanam/esfour/issues/1
	public String repository_url;	//https://api.github.com/repos/prabhusajjanam/esfour
	public String labels_url;	//https://api.github.com/repos/prabhusajjanam/esfour/issues/1/labels{/name}
	public String comments_url;	//https://api.github.com/repos/prabhusajjanam/esfour/issues/1/comments
	public String events_url;	//https://api.github.com/repos/prabhusajjanam/esfour/issues/1/events
	public String html_url;	//https://github.com/prabhusajjanam/esfour/issues/1
	public Integer id;	//672268160
	public String node_id;	//MDU6SXNzdWU2NzIyNjgxNjA=
	public Integer numberz;	//1
	public String title;	//one
	public cls_user user;
	public cls_labels[] labels;
	public String state;	//open
	public boolean locked;
	public cls_assignee assignee;
	public cls_assignees[] assignees;
	public cls_milestone milestone;
	public Integer comments;	//0
	public String created_at;	//2020-08-03T18:39:19Z
	public String updated_at;	//2020-08-03T18:39:19Z
	public cls_closed_at closed_at;
	public String author_association;	//OWNER
	public cls_active_lock_reason active_lock_reason;
	public String body;	//one
	public cls_closed_by closed_by;
	public cls_performed_via_github_app performed_via_github_app;
	class cls_user {
		public String login;	//prabhusajjanam
		public Integer id;	//16865106
		public String node_id;	//MDQ6VXNlcjE2ODY1MTA2
		public String avatar_url;	//https://avatars2.githubusercontent.com/u/16865106?v=4
		public String gravatar_id;	//
		public String url;	//https://api.github.com/users/prabhusajjanam
		public String html_url;	//https://github.com/prabhusajjanam
		public String followers_url;	//https://api.github.com/users/prabhusajjanam/followers
		public String following_url;	//https://api.github.com/users/prabhusajjanam/following{/other_user}
		public String gists_url;	//https://api.github.com/users/prabhusajjanam/gists{/gist_id}
		public String starred_url;	//https://api.github.com/users/prabhusajjanam/starred{/owner}{/repo}
		public String subscriptions_url;	//https://api.github.com/users/prabhusajjanam/subscriptions
		public String organizations_url;	//https://api.github.com/users/prabhusajjanam/orgs
		public String repos_url;	//https://api.github.com/users/prabhusajjanam/repos
		public String events_url;	//https://api.github.com/users/prabhusajjanam/events{/privacy}
		public String received_events_url;	//https://api.github.com/users/prabhusajjanam/received_events
		public String type;	//User
		public boolean site_admin;
	}
	class cls_labels {
	}
	class cls_assignee {
	}
	class cls_assignees {
	}
	class cls_milestone {
	}
	class cls_closed_at {
	}
	class cls_active_lock_reason {
	}
	class cls_closed_by {
	}
	class cls_performed_via_github_app {
	}
}