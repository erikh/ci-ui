import {createMuiTheme} from '@material-ui/core/styles';

const muiTheme = createMuiTheme({
  palette: {
    primary: {
      main: '#323E55',
      light: '#728D9B',
      contrastText: '#fff',
    },
    secondary: {
      main: '#728D9B',
      contrastText: '#fff',
    },
  },
});

export default muiTheme;
