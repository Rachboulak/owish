var Home = require('./home');
var WishWall = require('./wishWall');
var AdminConsole = require('./adminConsole');
  var { Router,
      Route,
      IndexRoute,
      IndexLink,
      Link } = ReactRouter;
    var destination = document.querySelector("#container");
    var App = React.createClass({
    render: function() {
      return (
        <div>
          <h1>O'Wish</h1>
          <ul className="header">
            <li><IndexLink to="/" activeClassName="active">Home</IndexLink></li>
            <li><Link to="/admin" activeClassName="active">Admin Console</Link></li>
            <li><Link to="/wishs" activeClassName="active">Public Wall</Link></li>
          </ul>
          <div className="content">
            {this.props.children}
          </div>
        </div>
      )
    }
});

ReactDOM.render(
  <Router>
    <Route path="/" component={App}>
      <IndexRoute component={Home}/>
      <Route path="admin" component={AdminConsole} />  
      <Route path="wishs" component={WishWall} />    
    </Route>
  </Router>,
  destination
);  
