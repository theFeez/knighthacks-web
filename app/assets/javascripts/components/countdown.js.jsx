const displayWidth = 10

var Countdown = React.createClass({
  propTypes: {
    hackathonStartsAt: React.PropTypes.string
  },

  componentDidMount () {
    setInterval(() => this.forceUpdate(), 1000)
  },

  render () {
    const now = moment()
    const hackathonStartsAt = moment(this.props.hackathonStartsAt)

    const days = hackathonStartsAt.diff(now, 'days')
    const hours = hackathonStartsAt.diff(now, 'hours') % 24
    const minutes = hackathonStartsAt.diff(now, 'minutes') % 60
    const seconds = hackathonStartsAt.diff(now, 'seconds') % 60

    return (
      <div className='countdown-output'>
        <p>{rightPad(`${leftPad(days)} days`)}</p>
        <p>{rightPad(`${leftPad(hours)} hours`)}</p>
        <p>{rightPad(`${leftPad(minutes)} minutes`)}</p>
        <p>{rightPad(`${leftPad(seconds)} seconds`)}</p>
      </div>
    )
  }
})

function leftPad (value) {
  value = value.toString()
  return ('  ' + value).substring(value.length)
}

function rightPad (value) {
  return (value + ' '.repeat(displayWidth)).substring(0, displayWidth)
}
