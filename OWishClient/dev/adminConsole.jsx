var React = require('react');

var WishBox = require('./wishBox');

/*React.render(
  <WishBox url="wishs.json" pollInterval={2000} />,
  document.getElementById('content')
);*/

var AdminConsole = React.createClass({   
  render: function() {
      return (
        <WishBox url="wishs.json" admin="true" pollInterval={2000} />
      );
    }
});

module.exports = AdminConsole;