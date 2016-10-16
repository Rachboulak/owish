var React = require('react');

var WishForm = require('./wishForm');
var WishList = require('./wishList');

var WishBox = React.createClass({
  getInitialState: function() {
    return {data: []};
  },
  loadWishsFromServer: function() {
    $.ajax({
      url: this.props.url,
      dataType: 'json',
      cache: false,
      success: function(data) {
        this.setState({data: data});
      }.bind(this),
      error: function(xhr, status, err) {
        console.error(this.props.url, status, err.toString());
      }.bind(this)
    });
  },
  handleWishSubmit: function(wish) {      
    var wishs = this.state.data;
    var newWishs = wishs.concat([wish]);
    this.setState({data: newWishs});

    $.ajax({
      url: this.props.url,
      dataType: 'json',
      type: 'POST',
      data: wish,
      success: function(data) {
        this.setState({data: data});
      }.bind(this),
      error: function(xhr, status, err) {
        console.error(this.props.url, status, err.toString());
      }.bind(this)
    });
  },
  componentDidMount: function() {
    this.loadWishsFromServer();
     this.loadInterval = setInterval(this.loadWishsFromServer, this.props.pollInterval);
  },
 /* componentDidMount() {
    this.loadInterval = setInterval(this.loadSearches, this.props.pollInterval);
}*/

    componentWillUnmount: function() {
        this.loadInterval && clearInterval(this.loadInterval);
        this.loadInterval = false;
    },
  render: function() {
    if (this.props.admin == "true") {
          return (
          <div className="wishBox">
            <h1>New Wish</h1>
            <WishForm onWishSubmit={this.handleWishSubmit} />
            <h1>Wishs List</h1>
            <WishList data={this.state.data} />
          </div>
          );
        } else {
          return (
            <div className="wishBox">
            <h1>Wishs List</h1>
            <WishList data={this.state.data} />
          </div>
          );
        }
  }
});

module.exports = WishBox;
