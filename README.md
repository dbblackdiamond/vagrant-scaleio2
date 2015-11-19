


<!DOCTYPE html>
<html lang="en" class=" is-copy-enabled emoji-size-boost">
  <head prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# object: http://ogp.me/ns/object# article: http://ogp.me/ns/article# profile: http://ogp.me/ns/profile#">
    <meta charset='utf-8'>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Language" content="en">
    <meta name="viewport" content="width=1020">
    
    
    <title>vagrant-scaleio2/README.md at master · dbblackdiamond/vagrant-scaleio2</title>
    <link rel="search" type="application/opensearchdescription+xml" href="/opensearch.xml" title="GitHub">
    <link rel="fluid-icon" href="https://github.com/fluidicon.png" title="GitHub">
    <link rel="apple-touch-icon" sizes="57x57" href="/apple-touch-icon-114.png">
    <link rel="apple-touch-icon" sizes="114x114" href="/apple-touch-icon-114.png">
    <link rel="apple-touch-icon" sizes="72x72" href="/apple-touch-icon-144.png">
    <link rel="apple-touch-icon" sizes="144x144" href="/apple-touch-icon-144.png">
    <meta property="fb:app_id" content="1401488693436528">

      <meta content="@github" name="twitter:site" /><meta content="summary" name="twitter:card" /><meta content="dbblackdiamond/vagrant-scaleio2" name="twitter:title" /><meta content="Contribute to vagrant-scaleio2 development by creating an account on GitHub." name="twitter:description" /><meta content="https://avatars2.githubusercontent.com/u/11542603?v=3&amp;s=400" name="twitter:image:src" />
      <meta content="GitHub" property="og:site_name" /><meta content="object" property="og:type" /><meta content="https://avatars2.githubusercontent.com/u/11542603?v=3&amp;s=400" property="og:image" /><meta content="dbblackdiamond/vagrant-scaleio2" property="og:title" /><meta content="https://github.com/dbblackdiamond/vagrant-scaleio2" property="og:url" /><meta content="Contribute to vagrant-scaleio2 development by creating an account on GitHub." property="og:description" />
      <meta name="browser-stats-url" content="https://api.github.com/_private/browser/stats">
    <meta name="browser-errors-url" content="https://api.github.com/_private/browser/errors">
    <link rel="assets" href="https://assets-cdn.github.com/">
    <link rel="web-socket" href="wss://live.github.com/_sockets/MTE1NDI2MDM6YmI3OWFkZTA1MjMwMTViMjYzNDk5ZWFlYTUyM2U2Yjk6MTBkMDEwZGRjYTA4M2M1ZmY5ZWJkNDIwNDBmOTRhYmY3ZGVmNmM1NGY1NmQ4NDZhYjgwN2ZmNWYzMmQ2YjkzMA==--fee5d3965f5ee3b4557ce0ddb428af4aa464f2fb">
    <meta name="pjax-timeout" content="1000">
    <link rel="sudo-modal" href="/sessions/sudo_modal">

    <meta name="msapplication-TileImage" content="/windows-tile.png">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="selected-link" value="repo_source" data-pjax-transient>

    <meta name="google-site-verification" content="KT5gs8h0wvaagLKAVWq8bbeNwnZZK1r1XQysX3xurLU">
    <meta name="google-analytics" content="UA-3769691-2">

<meta content="collector.githubapp.com" name="octolytics-host" /><meta content="github" name="octolytics-app-id" /><meta content="B8401763:6795:33287712:564E2E55" name="octolytics-dimension-request_id" /><meta content="11542603" name="octolytics-actor-id" /><meta content="dbblackdiamond" name="octolytics-actor-login" /><meta content="34be6fc13ba86ee53731fa6d535ce9ba3c8be68401e9f847951742355ed9f38d" name="octolytics-actor-hash" />
<meta content="/&lt;user-name&gt;/&lt;repo-name&gt;/blob/show" data-pjax-transient="true" name="analytics-location" />
<meta content="Rails, view, blob#show" data-pjax-transient="true" name="analytics-event" />


  <meta class="js-ga-set" name="dimension1" content="Logged In">
    <meta class="js-ga-set" name="dimension4" content="Current repo nav">




    <meta name="is-dotcom" content="true">
        <meta name="hostname" content="github.com">
    <meta name="user-login" content="dbblackdiamond">

      <link rel="mask-icon" href="https://assets-cdn.github.com/pinned-octocat.svg" color="#4078c0">
      <link rel="icon" type="image/x-icon" href="https://assets-cdn.github.com/favicon.ico">

    <meta content="a79ca39b073b4de593e2768b59d48be70daf84de" name="form-nonce" />

    <link crossorigin="anonymous" href="https://assets-cdn.github.com/assets/github-ceefdafe87b6f218cd93adcaec6a8878ed1f959f7f5937d308b4b0f6b251a7a0.css" integrity="sha256-zu/a/oe28hjNk63K7GqIeO0flZ9/WTfTCLSw9rJRp6A=" media="all" rel="stylesheet" />
    <link crossorigin="anonymous" href="https://assets-cdn.github.com/assets/github2-7048b51d8e88507e1babbe42418137bac3f5ef75f4b1957242327b23ebacd292.css" integrity="sha256-cEi1HY6IUH4bq75CQYE3usP173X0sZVyQjJ7I+us0pI=" media="all" rel="stylesheet" />
    
    
    


    <meta http-equiv="x-pjax-version" content="9ece15d68b9fa2b7ae955db58cbeba18">

      
  <meta name="description" content="Contribute to vagrant-scaleio2 development by creating an account on GitHub.">
  <meta name="go-import" content="github.com/dbblackdiamond/vagrant-scaleio2 git https://github.com/dbblackdiamond/vagrant-scaleio2.git">

  <meta content="11542603" name="octolytics-dimension-user_id" /><meta content="dbblackdiamond" name="octolytics-dimension-user_login" /><meta content="40503629" name="octolytics-dimension-repository_id" /><meta content="dbblackdiamond/vagrant-scaleio2" name="octolytics-dimension-repository_nwo" /><meta content="true" name="octolytics-dimension-repository_public" /><meta content="false" name="octolytics-dimension-repository_is_fork" /><meta content="40503629" name="octolytics-dimension-repository_network_root_id" /><meta content="dbblackdiamond/vagrant-scaleio2" name="octolytics-dimension-repository_network_root_nwo" />
  <link href="https://github.com/dbblackdiamond/vagrant-scaleio2/commits/master.atom" rel="alternate" title="Recent Commits to vagrant-scaleio2:master" type="application/atom+xml">

  </head>


  <body class="logged_in   env-production macintosh vis-public page-blob">
    <a href="#start-of-content" tabindex="1" class="accessibility-aid js-skip-to-content">Skip to content</a>

    
    
    



      <div class="header header-logged-in true" role="banner">
  <div class="container clearfix">

    <a class="header-logo-invertocat" href="https://github.com/" data-hotkey="g d" aria-label="Homepage" data-ga-click="Header, go to dashboard, icon:logo">
  <span class="mega-octicon octicon-mark-github"></span>
</a>


      <div class="site-search repo-scope js-site-search" role="search">
          <!-- </textarea> --><!-- '"` --><form accept-charset="UTF-8" action="/dbblackdiamond/vagrant-scaleio2/search" class="js-site-search-form" data-global-search-url="/search" data-repo-search-url="/dbblackdiamond/vagrant-scaleio2/search" method="get"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /></div>
  <label class="js-chromeless-input-container form-control">
    <div class="scope-badge">This repository</div>
    <input type="text"
      class="js-site-search-focus js-site-search-field is-clearable chromeless-input"
      data-hotkey="s"
      name="q"
      placeholder="Search"
      aria-label="Search this repository"
      data-global-scope-placeholder="Search GitHub"
      data-repo-scope-placeholder="Search"
      tabindex="1"
      autocapitalize="off">
  </label>
</form>
      </div>

      <ul class="header-nav left" role="navigation">
        <li class="header-nav-item">
          <a href="/pulls" class="js-selected-navigation-item header-nav-link" data-ga-click="Header, click, Nav menu - item:pulls context:user" data-hotkey="g p" data-selected-links="/pulls /pulls/assigned /pulls/mentioned /pulls">
            Pull requests
</a>        </li>
        <li class="header-nav-item">
          <a href="/issues" class="js-selected-navigation-item header-nav-link" data-ga-click="Header, click, Nav menu - item:issues context:user" data-hotkey="g i" data-selected-links="/issues /issues/assigned /issues/mentioned /issues">
            Issues
</a>        </li>
          <li class="header-nav-item">
            <a class="header-nav-link" href="https://gist.github.com/" data-ga-click="Header, go to gist, text:gist">Gist</a>
          </li>
      </ul>

    
<ul class="header-nav user-nav right" id="user-links">
  <li class="header-nav-item">
      <span class="js-socket-channel js-updatable-content"
        data-channel="notification-changed:dbblackdiamond"
        data-url="/notifications/header">
      <a href="/notifications" aria-label="You have no unread notifications" class="header-nav-link notification-indicator tooltipped tooltipped-s" data-ga-click="Header, go to notifications, icon:read" data-hotkey="g n">
          <span class="mail-status all-read"></span>
          <span class="octicon octicon-bell"></span>
</a>  </span>

  </li>

  <li class="header-nav-item dropdown js-menu-container">
    <a class="header-nav-link tooltipped tooltipped-s js-menu-target" href="/new"
       aria-label="Create new…"
       data-ga-click="Header, create new, icon:add">
      <span class="octicon octicon-plus left"></span>
      <span class="dropdown-caret"></span>
    </a>

    <div class="dropdown-menu-content js-menu-content">
      <ul class="dropdown-menu dropdown-menu-sw">
        
<a class="dropdown-item" href="/new" data-ga-click="Header, create new repository">
  New repository
</a>


  <a class="dropdown-item" href="/organizations/new" data-ga-click="Header, create new organization">
    New organization
  </a>



  <div class="dropdown-divider"></div>
  <div class="dropdown-header">
    <span title="dbblackdiamond/vagrant-scaleio2">This repository</span>
  </div>
    <a class="dropdown-item" href="/dbblackdiamond/vagrant-scaleio2/issues/new" data-ga-click="Header, create new issue">
      New issue
    </a>
    <a class="dropdown-item" href="/dbblackdiamond/vagrant-scaleio2/settings/collaboration" data-ga-click="Header, create new collaborator">
      New collaborator
    </a>

      </ul>
    </div>
  </li>

  <li class="header-nav-item dropdown js-menu-container">
    <a class="header-nav-link name tooltipped tooltipped-s js-menu-target" href="/dbblackdiamond"
       aria-label="View profile and more"
       data-ga-click="Header, show menu, icon:avatar">
      <img alt="@dbblackdiamond" class="avatar" height="20" src="https://avatars0.githubusercontent.com/u/11542603?v=3&amp;s=40" width="20" />
      <span class="dropdown-caret"></span>
    </a>

    <div class="dropdown-menu-content js-menu-content">
      <div class="dropdown-menu  dropdown-menu-sw">
        <div class=" dropdown-header header-nav-current-user css-truncate">
            Signed in as <strong class="css-truncate-target">dbblackdiamond</strong>

        </div>


        <div class="dropdown-divider"></div>

          <a class="dropdown-item" href="/dbblackdiamond" data-ga-click="Header, go to profile, text:your profile">
            Your profile
          </a>
        <a class="dropdown-item" href="/stars" data-ga-click="Header, go to starred repos, text:your stars">
          Your stars
        </a>
        <a class="dropdown-item" href="/explore" data-ga-click="Header, go to explore, text:explore">
          Explore
        </a>
          <a class="dropdown-item" href="/integrations" data-ga-click="Header, go to integrations, text:integrations">
            Integrations
          </a>
        <a class="dropdown-item" href="https://help.github.com" data-ga-click="Header, go to help, text:help">
          Help
        </a>

          <div class="dropdown-divider"></div>

          <a class="dropdown-item" href="/settings/profile" data-ga-click="Header, go to settings, icon:settings">
            Settings
          </a>

          <!-- </textarea> --><!-- '"` --><form accept-charset="UTF-8" action="/logout" class="logout-form" data-form-nonce="a79ca39b073b4de593e2768b59d48be70daf84de" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="elFdWS1d2g6F6gWjjJsLgQYiuUsgeNTkHbaTC8MDSHhID3t9IV8YIFnOZlzfbPq78Lpb/sRyaSTW8lNxrgou6A==" /></div>
            <button class="dropdown-item dropdown-signout" data-ga-click="Header, sign out, icon:logout">
              Sign out
            </button>
</form>
      </div>
    </div>
  </li>
</ul>


    
  </div>
</div>

      

      


    <div id="start-of-content" class="accessibility-aid"></div>

    <div id="js-flash-container">
</div>


    <div role="main" class="main-content">
        <div itemscope itemtype="http://schema.org/WebPage">
    <div class="pagehead repohead instapaper_ignore readability-menu">

      <div class="container">

        <div class="clearfix">
          

<ul class="pagehead-actions">

  <li>
        <!-- </textarea> --><!-- '"` --><form accept-charset="UTF-8" action="/notifications/subscribe" class="js-social-container" data-autosubmit="true" data-form-nonce="a79ca39b073b4de593e2768b59d48be70daf84de" data-remote="true" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="pJg4rZrdw1SLytWwHtByhuS9l+2ittuQAzs12CxMzp7m0PrZm4kZc6G428+tixZRiHn2At09Ud8mgQnf5P/MlA==" /></div>      <input id="repository_id" name="repository_id" type="hidden" value="40503629" />

        <div class="select-menu js-menu-container js-select-menu">
          <a href="/dbblackdiamond/vagrant-scaleio2/subscription"
            class="btn btn-sm btn-with-count select-menu-button js-menu-target" role="button" tabindex="0" aria-haspopup="true"
            data-ga-click="Repository, click Watch settings, action:blob#show">
            <span class="js-select-button">
              <span class="octicon octicon-eye"></span>
              Unwatch
            </span>
          </a>
          <a class="social-count js-social-count" href="/dbblackdiamond/vagrant-scaleio2/watchers">
            1
          </a>

        <div class="select-menu-modal-holder">
          <div class="select-menu-modal subscription-menu-modal js-menu-content" aria-hidden="true">
            <div class="select-menu-header">
              <span class="octicon octicon-x js-menu-close" role="button" aria-label="Close"></span>
              <span class="select-menu-title">Notifications</span>
            </div>

              <div class="select-menu-list js-navigation-container" role="menu">

                <div class="select-menu-item js-navigation-item " role="menuitem" tabindex="0">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <div class="select-menu-item-text">
                    <input id="do_included" name="do" type="radio" value="included" />
                    <span class="select-menu-item-heading">Not watching</span>
                    <span class="description">Be notified when participating or @mentioned.</span>
                    <span class="js-select-button-text hidden-select-button-text">
                      <span class="octicon octicon-eye"></span>
                      Watch
                    </span>
                  </div>
                </div>

                <div class="select-menu-item js-navigation-item selected" role="menuitem" tabindex="0">
                  <span class="select-menu-item-icon octicon octicon octicon-check"></span>
                  <div class="select-menu-item-text">
                    <input checked="checked" id="do_subscribed" name="do" type="radio" value="subscribed" />
                    <span class="select-menu-item-heading">Watching</span>
                    <span class="description">Be notified of all conversations.</span>
                    <span class="js-select-button-text hidden-select-button-text">
                      <span class="octicon octicon-eye"></span>
                      Unwatch
                    </span>
                  </div>
                </div>

                <div class="select-menu-item js-navigation-item " role="menuitem" tabindex="0">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <div class="select-menu-item-text">
                    <input id="do_ignore" name="do" type="radio" value="ignore" />
                    <span class="select-menu-item-heading">Ignoring</span>
                    <span class="description">Never be notified.</span>
                    <span class="js-select-button-text hidden-select-button-text">
                      <span class="octicon octicon-mute"></span>
                      Stop ignoring
                    </span>
                  </div>
                </div>

              </div>

            </div>
          </div>
        </div>
</form>
  </li>

  <li>
    
  <div class="js-toggler-container js-social-container starring-container ">

    <!-- </textarea> --><!-- '"` --><form accept-charset="UTF-8" action="/dbblackdiamond/vagrant-scaleio2/unstar" class="js-toggler-form starred js-unstar-button" data-form-nonce="a79ca39b073b4de593e2768b59d48be70daf84de" data-remote="true" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="meW7UOhhl7rNidgPbxse7EwclEpraef0N/gtYs7xUPG/DigDB/uNjLVI4Rt18ocTHX+uO6HcQq9mNy//ta3myA==" /></div>
      <button
        class="btn btn-sm btn-with-count js-toggler-target"
        aria-label="Unstar this repository" title="Unstar dbblackdiamond/vagrant-scaleio2"
        data-ga-click="Repository, click unstar button, action:blob#show; text:Unstar">
        <span class="octicon octicon-star"></span>
        Unstar
      </button>
        <a class="social-count js-social-count" href="/dbblackdiamond/vagrant-scaleio2/stargazers">
          0
        </a>
</form>
    <!-- </textarea> --><!-- '"` --><form accept-charset="UTF-8" action="/dbblackdiamond/vagrant-scaleio2/star" class="js-toggler-form unstarred js-star-button" data-form-nonce="a79ca39b073b4de593e2768b59d48be70daf84de" data-remote="true" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="HxFwvu5GHXrXTZW/CV5AgVbqvMMvnTqhy5ELg37o7oOvfl21ivvuMH5Syq4H1nLlk48MrO/nRsapE4tzsRmnpg==" /></div>
      <button
        class="btn btn-sm btn-with-count js-toggler-target"
        aria-label="Star this repository" title="Star dbblackdiamond/vagrant-scaleio2"
        data-ga-click="Repository, click star button, action:blob#show; text:Star">
        <span class="octicon octicon-star"></span>
        Star
      </button>
        <a class="social-count js-social-count" href="/dbblackdiamond/vagrant-scaleio2/stargazers">
          0
        </a>
</form>  </div>

  </li>

  <li>
          <!-- </textarea> --><!-- '"` --><form accept-charset="UTF-8" action="/dbblackdiamond/vagrant-scaleio2/fork" class="btn-with-count" data-form-nonce="a79ca39b073b4de593e2768b59d48be70daf84de" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="Pii6cVjhpUJg3oXTAbIR0lCI0DqpnZ8Fbzi+Rhdyf/FUZivF2MdaIteqrUjplO8Jxb23afSOnh6DQx6yIDrkIQ==" /></div>
            <button
                type="submit"
                class="btn btn-sm btn-with-count"
                data-ga-click="Repository, show fork modal, action:blob#show; text:Fork"
                title="Fork your own copy of dbblackdiamond/vagrant-scaleio2 to your account"
                aria-label="Fork your own copy of dbblackdiamond/vagrant-scaleio2 to your account">
              <span class="octicon octicon-repo-forked"></span>
              Fork
            </button>
</form>
    <a href="/dbblackdiamond/vagrant-scaleio2/network" class="social-count">
      0
    </a>
  </li>
</ul>

          <h1 itemscope itemtype="http://data-vocabulary.org/Breadcrumb" class="entry-title public ">
  <span class="mega-octicon octicon-repo"></span>
  <span class="author"><a href="/dbblackdiamond" class="url fn" itemprop="url" rel="author"><span itemprop="title">dbblackdiamond</span></a></span><!--
--><span class="path-divider">/</span><!--
--><strong><a href="/dbblackdiamond/vagrant-scaleio2" data-pjax="#js-repo-pjax-container">vagrant-scaleio2</a></strong>

  <span class="page-context-loader">
    <img alt="" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
  </span>

</h1>

        </div>
      </div>
    </div>

    <div class="container">
      <div class="repository-with-sidebar repo-container new-discussion-timeline ">
        <div class="repository-sidebar clearfix">
          
<nav class="sunken-menu repo-nav js-repo-nav js-sidenav-container-pjax js-octicon-loaders"
     role="navigation"
     data-pjax="#js-repo-pjax-container"
     data-issue-count-url="/dbblackdiamond/vagrant-scaleio2/issues/counts">
  <ul class="sunken-menu-group">
    <li class="tooltipped tooltipped-w" aria-label="Code">
      <a href="/dbblackdiamond/vagrant-scaleio2" aria-label="Code" aria-selected="true" class="js-selected-navigation-item selected sunken-menu-item" data-hotkey="g c" data-selected-links="repo_source repo_downloads repo_commits repo_releases repo_tags repo_branches /dbblackdiamond/vagrant-scaleio2">
        <span class="octicon octicon-code"></span> <span class="full-word">Code</span>
        <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>    </li>

      <li class="tooltipped tooltipped-w" aria-label="Issues">
        <a href="/dbblackdiamond/vagrant-scaleio2/issues" aria-label="Issues" class="js-selected-navigation-item sunken-menu-item" data-hotkey="g i" data-selected-links="repo_issues repo_labels repo_milestones /dbblackdiamond/vagrant-scaleio2/issues">
          <span class="octicon octicon-issue-opened"></span> <span class="full-word">Issues</span>
          <span class="js-issue-replace-counter"></span>
          <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>

    <li class="tooltipped tooltipped-w" aria-label="Pull requests">
      <a href="/dbblackdiamond/vagrant-scaleio2/pulls" aria-label="Pull requests" class="js-selected-navigation-item sunken-menu-item" data-hotkey="g p" data-selected-links="repo_pulls /dbblackdiamond/vagrant-scaleio2/pulls">
          <span class="octicon octicon-git-pull-request"></span> <span class="full-word">Pull requests</span>
          <span class="js-pull-replace-counter"></span>
          <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>    </li>

      <li class="tooltipped tooltipped-w" aria-label="Wiki">
        <a href="/dbblackdiamond/vagrant-scaleio2/wiki" aria-label="Wiki" class="js-selected-navigation-item sunken-menu-item" data-hotkey="g w" data-selected-links="repo_wiki /dbblackdiamond/vagrant-scaleio2/wiki">
          <span class="octicon octicon-book"></span> <span class="full-word">Wiki</span>
          <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>
  </ul>
  <div class="sunken-menu-separator"></div>
  <ul class="sunken-menu-group">

    <li class="tooltipped tooltipped-w" aria-label="Pulse">
      <a href="/dbblackdiamond/vagrant-scaleio2/pulse" aria-label="Pulse" class="js-selected-navigation-item sunken-menu-item" data-selected-links="pulse /dbblackdiamond/vagrant-scaleio2/pulse">
        <span class="octicon octicon-pulse"></span> <span class="full-word">Pulse</span>
        <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>    </li>

    <li class="tooltipped tooltipped-w" aria-label="Graphs">
      <a href="/dbblackdiamond/vagrant-scaleio2/graphs" aria-label="Graphs" class="js-selected-navigation-item sunken-menu-item" data-selected-links="repo_graphs repo_contributors /dbblackdiamond/vagrant-scaleio2/graphs">
        <span class="octicon octicon-graph"></span> <span class="full-word">Graphs</span>
        <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>    </li>
  </ul>


    <div class="sunken-menu-separator"></div>
    <ul class="sunken-menu-group">
      <li class="tooltipped tooltipped-w" aria-label="Settings">
        <a href="/dbblackdiamond/vagrant-scaleio2/settings" aria-label="Settings" class="js-selected-navigation-item sunken-menu-item" data-selected-links="repo_settings repo_branch_settings hooks /dbblackdiamond/vagrant-scaleio2/settings">
          <span class="octicon octicon-gear"></span> <span class="full-word">Settings</span>
          <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>
    </ul>
</nav>

            <div class="only-with-full-nav">
                
<div class="js-clone-url clone-url open"
  data-protocol-type="http">
  <h3 class="text-small text-muted"><span class="text-emphasized">HTTPS</span> clone URL</h3>
  <div class="input-group js-zeroclipboard-container">
    <input type="text" class="input-mini text-small text-muted input-monospace js-url-field js-zeroclipboard-target"
           value="https://github.com/dbblackdiamond/vagrant-scaleio2.git" readonly="readonly" aria-label="HTTPS clone URL">
    <span class="input-group-button">
      <button aria-label="Copy to clipboard" class="js-zeroclipboard btn btn-sm zeroclipboard-button tooltipped tooltipped-s" data-copied-hint="Copied!" type="button"><span class="octicon octicon-clippy"></span></button>
    </span>
  </div>
</div>

  
<div class="js-clone-url clone-url "
  data-protocol-type="ssh">
  <h3 class="text-small text-muted"><span class="text-emphasized">SSH</span> clone URL</h3>
  <div class="input-group js-zeroclipboard-container">
    <input type="text" class="input-mini text-small text-muted input-monospace js-url-field js-zeroclipboard-target"
           value="git@github.com:dbblackdiamond/vagrant-scaleio2.git" readonly="readonly" aria-label="SSH clone URL">
    <span class="input-group-button">
      <button aria-label="Copy to clipboard" class="js-zeroclipboard btn btn-sm zeroclipboard-button tooltipped tooltipped-s" data-copied-hint="Copied!" type="button"><span class="octicon octicon-clippy"></span></button>
    </span>
  </div>
</div>

  
<div class="js-clone-url clone-url "
  data-protocol-type="subversion">
  <h3 class="text-small text-muted"><span class="text-emphasized">Subversion</span> checkout URL</h3>
  <div class="input-group js-zeroclipboard-container">
    <input type="text" class="input-mini text-small text-muted input-monospace js-url-field js-zeroclipboard-target"
           value="https://github.com/dbblackdiamond/vagrant-scaleio2" readonly="readonly" aria-label="Subversion checkout URL">
    <span class="input-group-button">
      <button aria-label="Copy to clipboard" class="js-zeroclipboard btn btn-sm zeroclipboard-button tooltipped tooltipped-s" data-copied-hint="Copied!" type="button"><span class="octicon octicon-clippy"></span></button>
    </span>
  </div>
</div>



<div class="clone-options text-small text-muted">You can clone with
  <!-- </textarea> --><!-- '"` --><form accept-charset="UTF-8" action="/users/set_protocol?protocol_selector=http&amp;protocol_type=push" class="inline-form js-clone-selector-form is-enabled" data-form-nonce="a79ca39b073b4de593e2768b59d48be70daf84de" data-remote="true" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="NITV4hf/HWKhpCkVb26umWaxHW9fljGWODno6q2mbsR2JI3bMsdEoftltkrKzWRcDGa9BO1ACY/dabWU6+/HOA==" /></div><button class="btn-link js-clone-selector" data-protocol="http" type="submit">HTTPS</button></form>, <!-- </textarea> --><!-- '"` --><form accept-charset="UTF-8" action="/users/set_protocol?protocol_selector=ssh&amp;protocol_type=push" class="inline-form js-clone-selector-form is-enabled" data-form-nonce="a79ca39b073b4de593e2768b59d48be70daf84de" data-remote="true" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="+RgwPq5rsNMhVG+/gbT0UMxH6ZTtGhmlOvA0BmjErSpR6kCbd0NFxtG9O5ZRDleC8VnKymyiSiHG7KeJ0HoVoA==" /></div><button class="btn-link js-clone-selector" data-protocol="ssh" type="submit">SSH</button></form>, or <!-- </textarea> --><!-- '"` --><form accept-charset="UTF-8" action="/users/set_protocol?protocol_selector=subversion&amp;protocol_type=push" class="inline-form js-clone-selector-form is-enabled" data-form-nonce="a79ca39b073b4de593e2768b59d48be70daf84de" data-remote="true" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="8yWAdA/tvWqaf1+Te0chvrGhpxoMoK6L2ylz5IAy0q/aJ9OYTxIL4iBA/D2O+3kB/vBy0ItXy8tyN524pk4MLg==" /></div><button class="btn-link js-clone-selector" data-protocol="subversion" type="submit">Subversion</button></form>.
  <a href="https://help.github.com/articles/which-remote-url-should-i-use" class="help tooltipped tooltipped-n" aria-label="Get help on which URL is right for you.">
    <span class="octicon octicon-question"></span>
  </a>
</div>
  <a href="https://mac.github.com" class="btn btn-sm sidebar-button" title="Save dbblackdiamond/vagrant-scaleio2 to your computer and use it in GitHub Desktop." aria-label="Save dbblackdiamond/vagrant-scaleio2 to your computer and use it in GitHub Desktop.">
    <span class="octicon octicon-desktop-download"></span>
    Clone in Desktop
  </a>

              <a href="/dbblackdiamond/vagrant-scaleio2/archive/master.zip"
                 class="btn btn-sm sidebar-button"
                 aria-label="Download the contents of dbblackdiamond/vagrant-scaleio2 as a zip file"
                 title="Download the contents of dbblackdiamond/vagrant-scaleio2 as a zip file"
                 rel="nofollow">
                <span class="octicon octicon-cloud-download"></span>
                Download ZIP
              </a>
            </div>
        </div>
        <div id="js-repo-pjax-container" class="repository-content context-loader-container" data-pjax-container>

          

<a href="/dbblackdiamond/vagrant-scaleio2/blob/888471b6200ad2733672386b92c49fbaba893a1b/README.md" class="hidden js-permalink-shortcut" data-hotkey="y">Permalink</a>

<!-- blob contrib key: blob_contributors:v21:49e989f3ab92ac33bf23676a6c6ba451 -->

  <div class="file-navigation js-zeroclipboard-container">
    
<div class="select-menu js-menu-container js-select-menu left">
  <button class="btn btn-sm select-menu-button js-menu-target css-truncate" data-hotkey="w"
    title="master"
    type="button" aria-label="Switch branches or tags" tabindex="0" aria-haspopup="true">
    <i>Branch:</i>
    <span class="js-select-button css-truncate-target">master</span>
  </button>

  <div class="select-menu-modal-holder js-menu-content js-navigation-container" data-pjax aria-hidden="true">

    <div class="select-menu-modal">
      <div class="select-menu-header">
        <span class="octicon octicon-x js-menu-close" role="button" aria-label="Close"></span>
        <span class="select-menu-title">Switch branches/tags</span>
      </div>

      <div class="select-menu-filters">
        <div class="select-menu-text-filter">
          <input type="text" aria-label="Find or create a branch…" id="context-commitish-filter-field" class="js-filterable-field js-navigation-enable" placeholder="Find or create a branch…">
        </div>
        <div class="select-menu-tabs">
          <ul>
            <li class="select-menu-tab">
              <a href="#" data-tab-filter="branches" data-filter-placeholder="Find or create a branch…" class="js-select-menu-tab" role="tab">Branches</a>
            </li>
            <li class="select-menu-tab">
              <a href="#" data-tab-filter="tags" data-filter-placeholder="Find a tag…" class="js-select-menu-tab" role="tab">Tags</a>
            </li>
          </ul>
        </div>
      </div>

      <div class="select-menu-list select-menu-tab-bucket js-select-menu-tab-bucket" data-tab-filter="branches" role="menu">

        <div data-filterable-for="context-commitish-filter-field" data-filterable-type="substring">


            <a class="select-menu-item js-navigation-item js-navigation-open selected"
               href="/dbblackdiamond/vagrant-scaleio2/blob/master/README.md"
               data-name="master"
               data-skip-pjax="true"
               rel="nofollow">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <span class="select-menu-item-text css-truncate-target" title="master">
                master
              </span>
            </a>
        </div>

          <!-- </textarea> --><!-- '"` --><form accept-charset="UTF-8" action="/dbblackdiamond/vagrant-scaleio2/branches" class="js-create-branch select-menu-item select-menu-new-item-form js-navigation-item js-new-item-form" data-form-nonce="a79ca39b073b4de593e2768b59d48be70daf84de" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="MRigCE33su5k46aqtlcNR8fSKjsYWkM+AaX63+6sQ9qjCcOoU837SSVfPy4j+exVSeo38hsRlA3NEs7Qw/alWg==" /></div>
            <span class="octicon octicon-git-branch select-menu-item-icon"></span>
            <div class="select-menu-item-text">
              <span class="select-menu-item-heading">Create branch: <span class="js-new-item-name"></span></span>
              <span class="description">from ‘master’</span>
            </div>
            <input type="hidden" name="name" id="name" class="js-new-item-value">
            <input type="hidden" name="branch" id="branch" value="master">
            <input type="hidden" name="path" id="path" value="README.md">
</form>
      </div>

      <div class="select-menu-list select-menu-tab-bucket js-select-menu-tab-bucket" data-tab-filter="tags">
        <div data-filterable-for="context-commitish-filter-field" data-filterable-type="substring">


        </div>

        <div class="select-menu-no-results">Nothing to show</div>
      </div>

    </div>
  </div>
</div>

    <div class="btn-group right">
      <a href="/dbblackdiamond/vagrant-scaleio2/find/master"
            class="js-show-file-finder btn btn-sm empty-icon tooltipped tooltipped-nw"
            data-pjax
            data-hotkey="t"
            aria-label="Quickly jump between files">
        <span class="octicon octicon-list-unordered"></span>
      </a>
      <button aria-label="Copy file path to clipboard" class="js-zeroclipboard btn btn-sm zeroclipboard-button tooltipped tooltipped-s" data-copied-hint="Copied!" type="button"><span class="octicon octicon-clippy"></span></button>
    </div>

    <div class="breadcrumb js-zeroclipboard-target">
      <span class="repo-root js-repo-root"><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/dbblackdiamond/vagrant-scaleio2" class="" data-branch="master" data-pjax="true" itemscope="url"><span itemprop="title">vagrant-scaleio2</span></a></span></span><span class="separator">/</span><strong class="final-path">README.md</strong>
    </div>
  </div>

<include-fragment class="commit-tease" src="/dbblackdiamond/vagrant-scaleio2/contributors/master/README.md">
  <div>
    Fetching contributors&hellip;
  </div>

  <div class="commit-tease-contributors">
    <img alt="" class="loader-loading left" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32-EAF2F5.gif" width="16" />
    <span class="loader-error">Cannot retrieve contributors at this time</span>
  </div>
</include-fragment>
<div class="file">
  <div class="file-header">
  <div class="file-actions">

    <div class="btn-group">
      <a href="/dbblackdiamond/vagrant-scaleio2/raw/master/README.md" class="btn btn-sm " id="raw-url">Raw</a>
        <a href="/dbblackdiamond/vagrant-scaleio2/blame/master/README.md" class="btn btn-sm js-update-url-with-hash">Blame</a>
      <a href="/dbblackdiamond/vagrant-scaleio2/commits/master/README.md" class="btn btn-sm " rel="nofollow">History</a>
    </div>

        <a class="octicon-btn tooltipped tooltipped-nw"
           href="https://mac.github.com"
           aria-label="Open this file in GitHub Desktop"
           data-ga-click="Repository, open with desktop, type:mac">
            <span class="octicon octicon-device-desktop"></span>
        </a>

        <!-- </textarea> --><!-- '"` --><form accept-charset="UTF-8" action="/dbblackdiamond/vagrant-scaleio2/edit/master/README.md" class="inline-form js-update-url-with-hash" data-form-nonce="a79ca39b073b4de593e2768b59d48be70daf84de" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="Guy0qNswS5whnJ5Clenrth7YQXuyUih7bZTzgE+5dJLzTtrJDbMk4UbNWmOMBwVbfJTIY3TjJyf+oRC6WKxavg==" /></div>
          <button class="octicon-btn tooltipped tooltipped-nw" type="submit"
            aria-label="Edit this file" data-hotkey="e" data-disable-with>
            <span class="octicon octicon-pencil"></span>
          </button>
</form>        <!-- </textarea> --><!-- '"` --><form accept-charset="UTF-8" action="/dbblackdiamond/vagrant-scaleio2/delete/master/README.md" class="inline-form" data-form-nonce="a79ca39b073b4de593e2768b59d48be70daf84de" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="9hHxDqA4kCGcS5423W3rE982EY0o7FoAgFMIsYNsvt6fWf+3t9Dr4bdg2yJpSLlvMQpGJ3Owz9p1ujT/1lohcA==" /></div>
          <button class="octicon-btn octicon-btn-danger tooltipped tooltipped-nw" type="submit"
            aria-label="Delete this file" data-disable-with>
            <span class="octicon octicon-trashcan"></span>
          </button>
</form>  </div>

  <div class="file-info">
      182 lines (151 sloc)
      <span class="file-info-divider"></span>
    8.31 KB
  </div>
</div>

  
  <div id="readme" class="blob instapaper_body">
    <article class="markdown-body entry-content" itemprop="mainContentOfPage"><h2><a id="user-content-vagrant-scaleio2" class="anchor" href="#vagrant-scaleio2" aria-hidden="true"><span class="octicon octicon-link"></span></a>vagrant-scaleio2</h2>

<h1><a id="user-content-description" class="anchor" href="#description" aria-hidden="true"><span class="octicon octicon-link"></span></a>Description</h1>

<p>Vagrantfile to create a ScaleIO cluster. The Vagrantfile is flexible enough to allow the creation of a cluster of any size. It also allows the removal and addition of nodes to the cluster.</p>

<h1><a id="user-content-usage" class="anchor" href="#usage" aria-hidden="true"><span class="octicon octicon-link"></span></a>Usage</h1>

<p>This Vagrant setup will automatically deploy a number CentOS 6.5 nodes, download the ScaleIO 1.32 software and install a full ScaleIO cluster. The number of nodes to be deployed is specified in the <code>config/config.yml</code> file. A description of the format of that file is provided later in this document.</p>

<p>To use this, you'll need to complete a few steps:</p>

<ol>
<li><code>git clone https://github.com/dbblackdiamond/vagrant-scaleio2.git</code></li>
<li>Edit the <code>config/config.yml</code> file to reflect the size of the cluster you want to deploy and the information relevant to your site. Please the the <em><strong>Configuration File Format</strong></em> section below for more information on the format of the <code>config/config.yml</code> file.</li>
<li>Run <code>vagrant up</code> (if you have more than one Vagrant Provider on your machine run <code>vagrant up --provider virtualbox</code> instead)</li>
</ol>

<p>Note, the cluster will come up with the default unlimited license for dev and test use.</p>

<h2><a id="user-content-ssh" class="anchor" href="#ssh" aria-hidden="true"><span class="octicon octicon-link"></span></a>SSH</h2>

<p>To login to the ScaleIO nodes, use the following commands: <code>vagrant ssh &lt;node name&gt;</code></p>

<h2><a id="user-content-configuration-file-format" class="anchor" href="#configuration-file-format" aria-hidden="true"><span class="octicon octicon-link"></span></a>Configuration file format</h2>

<p>The <code>config/config.yml</code> file contains a description of the configuration of the cluster you want to deploy, along with some variables that are required by the installation program and others that can be used to control things, such as the version of ScaleIO to install, or the location where to download the software from.
The configuration is flexible enough to allow you to create different Protection Domain and different Pool if you wish to.</p>

<p>The smallest cluster that can be deployed is a 3 nodes cluster, that contains:
1. A Cluster definition
2. A TB, or tie-breaker, node
3. A Primary MDM node
4. A Secondary MDM node.</p>

<p>Because ScaleIO requires at least 3 SDS, the TB, the Primary MDM and the Secondary MDM all will be configured as SDS as well.</p>

<p>After that, you can choose to deploy as many SDS or SDC nodes as you wish using the proper configuration. 
The <code>config/config.yml</code> includes other configuration variables, such as the name of the vagrant box, its URL, the version of ScaleIO to be deployed and the OS verions of the virtual mchaines. Those settings can be left alone for most deployments. It also contains the password that will be set for the <strong>admin</strong> user, which can be easily changed but changing the value of the <code>password:</code> line.</p>

<h3><a id="user-content-cluster-configuration" class="anchor" href="#cluster-configuration" aria-hidden="true"><span class="octicon octicon-link"></span></a>Cluster Configuration</h3>

<p>The Cluster configuration section contains the information about the cluster and the nodes that are being deployed.
The cluster configuration contains the following lines:
1. Name of the cluster
2. IP address of the cluster
3. Nodes.
The nodes line is the important one at the moment. This is where you specify which nodes you want to deploy. This line can also be updated at a later stage if you want to add a node to the cluster. This is as easily done as just adding the node name on that line.</p>

<p>Here is an example of the cluster configuration:</p>

<pre><code>cluster:
   name: "ScaleIOTest"
   ip: "10.1.1.110"
   nodes: "tb,primary_mdm,secondary_mdm,sds4,sds5,sds6,sds7,sdc1,sdc2,gui1"
</code></pre>

<h3><a id="user-content-tb-node-configuration" class="anchor" href="#tb-node-configuration" aria-hidden="true"><span class="octicon octicon-link"></span></a>TB Node Configuration</h3>

<p>To configure a TB node, you'll need the following information:
1. Its hostname,
2. Its IP address
3. The full path of the device that will be added to the Pool
4. The size of the device
5. The Name of the SDS configured on the TB</p>

<p>Here is an example to configure a TB node called <code>tb1</code> and an IP address of <code>10.1.1.111</code>:</p>

<pre><code>tb:
   name: "tb1"
   ip: "10.1.1.111"
   role: "tb"
</code></pre>

<h3><a id="user-content-primary-mdm-configuration" class="anchor" href="#primary-mdm-configuration" aria-hidden="true"><span class="octicon octicon-link"></span></a>Primary MDM Configuration</h3>

<p>To configure the Primary MDM node, you'll need the following information:
1. The Name of the Primary MDM Virtual Machine. This name will be the hostname of the VM
2. The IP address of the Primary MDM
3. The SDS Name the Primary MDM will be known as. The Primary MDM is also configured as a SDS Node
4. The Path for the device that will be used by the SDS configured on the Primary MDM
5. The size of the device
6. The Protection Domain the SDS configured on the Primary MDM needs to be added to
7. The Pool the device added to</p>

<p>Here is an example of a Primary MDM named <code>mdm1</code>:</p>

<pre><code>primary_mdm:
   name: "mdm1"
   ip: "10.1.1.112"
   role: "primary mdm"
   sdsname: "sds2"
   device: "/home/vagrant/scaleio1"
   device_size: "100"
   protection_domain: "pdomain1"
   pool: "Pool1"
</code></pre>

<h3><a id="user-content-secondary-mdm-configuration" class="anchor" href="#secondary-mdm-configuration" aria-hidden="true"><span class="octicon octicon-link"></span></a>Secondary MDM Configuration</h3>

<p>The configuration of the Secondary MDM is really similar to the one of the Primary MDM. You'll need to provide the following information:
1. The Name of the Secondary MDM Virtual Machine. This name will be the hostname of the VM
2. The IP address of the Secondary MDM
3. The SDS Name the Secondary MDM will be known as. The Secondary MDM is also configured as a SDS Node
4. The Path for the device that will be used by the SDS configured on the Secondary MDM
5. The size of the device
6. The Protection Domain the SDS configured on the Secondary MDM needs to be added to
7. The Pool the device added to</p>

<p>Here is an example of the configuration of a Secondary MDM called <code>mdm2</code>:</p>

<pre><code>secondary_mdm:
   name: "mdm2"
   ip: "10.1.1.113"
   role: "secondary mdm"
   sdsname: "sds3"
   device: "/home/vagrant/scaleio1"
   device_size: "100"
   protection_domain: "pdomain1"
   pool: "Pool1"
</code></pre>

<h3><a id="user-content-sds-node-configuration" class="anchor" href="#sds-node-configuration" aria-hidden="true"><span class="octicon octicon-link"></span></a>SDS Node Configuration</h3>

<p>SDS are the node providing capacity to the cluster. Each of the MDM is an SDS, but SDS-only node can also be deployed separately. To do that, the following information are needed:
1. SDS Hostname
2. SDS IP address
3. The full path of the file that will be used as a device to add capacity to the cluster
4. The size of the file. The minimum size of a device is 100GB. ScaleIO uses thin provisioning so there is no need to have 100GB available. 
5. The Protection domain the SDS is part of
6. The Pool the capacity is going to be added to</p>

<p>Here is an example of a SDS Node called <code>sds4</code>:</p>

<pre><code>sds4:
   name: "sds4"
   ip: "10.1.1.114"
   role: "sds"
   device: "/home/vagrant/scaleio1"
   device_size: "100"
   protection_domain: "pdomain2"
   pool: "Pool1"
</code></pre>

<h3><a id="user-content-sdc-node-configuration" class="anchor" href="#sdc-node-configuration" aria-hidden="true"><span class="octicon octicon-link"></span></a>SDC Node Configuration</h3>

<p>In a ScaleIO cluster, the SDC is the consumer of the capacity presented by the SDS nodes. SDC are nodes that volumes are being presented to through IP. The following information are needed to deploy an SDC:
1. SDC Name
2. SDC IP address
3. The name of the volume that will be presented to this SDC
4. The size of the volume
5. The Protection Domain this SDC is going to be part of
6. The Pool that the volume is going to be part of</p>

<p>Here is an example of a SDC Node called <code>sdc1</code>:</p>

<pre><code>sdc1:
   name: "sdc1"
   ip: "10.1.1.121"
   role: "sdc"
   volume: "test_vol1"
   volsize: "8"
   protection_domain: "pdomain1"
   pool: "Pool1"
</code></pre>

<h3><a id="user-content-gui-node-configuration" class="anchor" href="#gui-node-configuration" aria-hidden="true"><span class="octicon octicon-link"></span></a>GUI Node Configuration</h3>

<p>ScaleIO comes with its own management interface. You can choose to deploy it on your own laptop or workstation or you can choose to have it deployed as a separate node. If you choose a separate node, this is the information needed:
1. Name of the virtual machine to run the GUI
2. Its IP address</p>

<p>Here is an example of a GUI Node called <code>gui1</code>:</p>

<pre><code>gui1:   
   name: "gui1"
   ip: "10.1.1.123"
   role: "gui"
</code></pre>

<h2><a id="user-content-access-to-the-cluster" class="anchor" href="#access-to-the-cluster" aria-hidden="true"><span class="octicon octicon-link"></span></a>Access to the cluster</h2>

<p>Once the <code>vagrant up</code> command has been run, you should be able ssh to the GUI node and start the Scaleio GUI by running <code>/opt/emc/scaleio/gui/run.sh</code>. Because a Linux virtual machine is deployed as a GUI server, it is important to export the display of your laptop or workstation before running the GUI. Alternatively, you can ssh to the GUI node and tunnel X over ssh.</p>

<h2><a id="user-content-updating-the-cluster" class="anchor" href="#updating-the-cluster" aria-hidden="true"><span class="octicon octicon-link"></span></a>Updating the cluster</h2>

<p>The cluster you have just deployed can be updated after the deployement. This is typically used to simulate a node failure or a node addition to the cluster. 
To simulate a node failure, you can run the <code>vagrant destroy -f &lt;node name&gt;</code> command. This will shutdown and destroy the virtual machine. Alternatively, if you only want to shutdown the virtual machine and not destroy it, you can run the <code>vagrant shutdown &lt;node name&gt;</code> command.
To simulate a node addition, you can add the node name the <code>nodes</code> list in the <code>cluster</code> definition section. Then you need to add the node definition section and run <code>vagrant up &lt;node name&gt;</code>.</p>

<h1><a id="user-content-troubleshooting" class="anchor" href="#troubleshooting" aria-hidden="true"><span class="octicon octicon-link"></span></a>Troubleshooting</h1>

<p>If anything goes wrong during the deployment, run <code>vagrant destroy -f</code> to remove all the VMs and then <code>vagrant up</code> again to restart the deployment.</p>
</article>
  </div>

</div>

<a href="#jump-to-line" rel="facebox[.linejump]" data-hotkey="l" style="display:none">Jump to Line</a>
<div id="jump-to-line" style="display:none">
  <!-- </textarea> --><!-- '"` --><form accept-charset="UTF-8" action="" class="js-jump-to-line-form" method="get"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /></div>
    <input class="linejump-input js-jump-to-line-field" type="text" placeholder="Jump to line&hellip;" aria-label="Jump to line" autofocus>
    <button type="submit" class="btn">Go</button>
</form></div>

        </div>
      </div>
      <div class="modal-backdrop"></div>
    </div>
  </div>


    </div>

      <div class="container">
  <div class="site-footer" role="contentinfo">
    <ul class="site-footer-links right">
        <li><a href="https://status.github.com/" data-ga-click="Footer, go to status, text:status">Status</a></li>
      <li><a href="https://developer.github.com" data-ga-click="Footer, go to api, text:api">API</a></li>
      <li><a href="https://training.github.com" data-ga-click="Footer, go to training, text:training">Training</a></li>
      <li><a href="https://shop.github.com" data-ga-click="Footer, go to shop, text:shop">Shop</a></li>
        <li><a href="https://github.com/blog" data-ga-click="Footer, go to blog, text:blog">Blog</a></li>
        <li><a href="https://github.com/about" data-ga-click="Footer, go to about, text:about">About</a></li>
        <li><a href="https://github.com/pricing" data-ga-click="Footer, go to pricing, text:pricing">Pricing</a></li>

    </ul>

    <a href="https://github.com" aria-label="Homepage">
      <span class="mega-octicon octicon-mark-github" title="GitHub"></span>
</a>
    <ul class="site-footer-links">
      <li>&copy; 2015 <span title="0.17271s from github-fe117-cp1-prd.iad.github.net">GitHub</span>, Inc.</li>
        <li><a href="https://github.com/site/terms" data-ga-click="Footer, go to terms, text:terms">Terms</a></li>
        <li><a href="https://github.com/site/privacy" data-ga-click="Footer, go to privacy, text:privacy">Privacy</a></li>
        <li><a href="https://github.com/security" data-ga-click="Footer, go to security, text:security">Security</a></li>
        <li><a href="https://github.com/contact" data-ga-click="Footer, go to contact, text:contact">Contact</a></li>
        <li><a href="https://help.github.com" data-ga-click="Footer, go to help, text:help">Help</a></li>
    </ul>
  </div>
</div>



    
    
    

    <div id="ajax-error-message" class="flash flash-error">
      <span class="octicon octicon-alert"></span>
      <button type="button" class="flash-close js-flash-close js-ajax-error-dismiss" aria-label="Dismiss error">
        <span class="octicon octicon-x"></span>
      </button>
      Something went wrong with that request. Please try again.
    </div>


      <script crossorigin="anonymous" integrity="sha256-fRgMK7V3nst6tdBM6K+ZnnODbc8N8ajES2nGKh3gcy8=" src="https://assets-cdn.github.com/assets/frameworks-7d180c2bb5779ecb7ab5d04ce8af999e73836dcf0df1a8c44b69c62a1de0732f.js"></script>
      <script async="async" crossorigin="anonymous" integrity="sha256-4KCQ02TxeL/ZW7LmA7szx7KVrWPr9/ncCSBdqqx7T2Y=" src="https://assets-cdn.github.com/assets/github-e0a090d364f178bfd95bb2e603bb33c7b295ad63ebf7f9dc09205daaac7b4f66.js"></script>
      
      
    <div class="js-stale-session-flash stale-session-flash flash flash-warn flash-banner hidden">
      <span class="octicon octicon-alert"></span>
      <span class="signed-in-tab-flash">You signed in with another tab or window. <a href="">Reload</a> to refresh your session.</span>
      <span class="signed-out-tab-flash">You signed out in another tab or window. <a href="">Reload</a> to refresh your session.</span>
    </div>
  </body>
</html>

