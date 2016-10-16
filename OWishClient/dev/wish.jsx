var React = require('react');

var Wish = React.createClass({
  render: function() {
    var rawMarkup = marked(this.props.children.toString(), {sanitize: true});
    return (
      <div className="wish">
        <h2 className="wishTitle">
          {this.props.title}
        </h2>
        <span className="wishDate">
          Date : {this.props.date}
        </span>
        <span dangerouslySetInnerHTML={{__html: rawMarkup}} />
        <hr />
      </div>
    );
  }
});

module.exports = Wish;
