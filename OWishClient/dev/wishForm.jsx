var React = require('react');

var WishForm = React.createClass({
  handleSubmit: function(e) {
    e.preventDefault();
    var title = ReactDOM.findDOMNode(this.refs.title).value.trim();
    var dt = new Date();
    var _date = this.yyyymmddhhmm(dt);
    var text = ReactDOM.findDOMNode(this.refs.text).value.trim();
    if (!text || !title) {
      return;
    }

    // send request to the server
    this.props.onWishSubmit({title: title, date:_date, text: text});
    ReactDOM.findDOMNode(this.refs.title).value = '';
    ReactDOM.findDOMNode(this.refs.text).value = '';
    return;
  },
   yyyymmddhhmm : function(dt) {
   var yyyy = dt.getFullYear();
   var mm = dt.getMonth() < 9 ? "0" + (dt.getMonth() + 1) : (dt.getMonth() + 1); // getMonth() is zero-based
   var dd  = dt.getDate() < 10 ? "0" + dt.getDate() : dt.getDate();
   var hh = dt.getHours() < 10 ? "0" + dt.getHours() : dt.getHours();
   var min = dt.getMinutes() < 10 ? "0" + dt.getMinutes() : dt.getMinutes();
   return "".concat(yyyy).concat("/").concat(mm).concat("/").concat(dd)
          .concat(" ").concat(hh).concat(":").concat(min);
  },
  render: function() {
    return (
      <form className="wishForm" onSubmit={this.handleSubmit}>
      <fieldset>
          <label htmlFor='title'>
          Title
          <br /> 
              <input id='title' name='title' type='text' ref="title"/>
          </label>
          <br /> 
          <label htmlFor='description'>
            Description
              <br /> 
              <textarea id='description' name='description' placeholder="Say something..." ref="text" />
          </label>
        <br /> 
          <input type='submit' value="Save" />
       </fieldset>
      </form>
    );
  }
});

module.exports = WishForm;
