var React = require('react');

var Wish = require('./wish');

var WishList = React.createClass({
  render: function() {
    var wishNodes = this.props.data.map(function (wish, i) {
      return (
        <Wish title={wish.title} date={wish.date} key={i}>
          {wish.text}
        </Wish>
      );
    });
    wishNodes.reverse();
    return (
      <div className="wishList">
        {wishNodes}
      </div>
    );
  }
});

module.exports = WishList;
