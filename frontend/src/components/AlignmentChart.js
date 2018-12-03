import React from 'react';
import PropTypes from 'prop-types';

const propTypes = {};

const defaultProps = {};

export default class AlignmentChart extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      alignments: []
    };
  }

  componentDidMount() {
    fetch('http://localhost.com:4000/')
  }

  render() {
    return (
      <React.Fragment>

      </React.Fragment>
    );
  }
}

 AlignmentChart.propTypes = propTypes;
 AlignmentChart.defaultProps = defaultProps;
