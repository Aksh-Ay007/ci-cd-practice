import React from 'react';
import { render, screen } from '@testing-library/react';
import Message from './Message';

test('renders message text correctly', () => {
  render(<Message text="Some other message" />);
  const element = screen.getByText(/Test CI\/CD message/i); // looks for old text
  expect(element).toBeInTheDocument();
});

