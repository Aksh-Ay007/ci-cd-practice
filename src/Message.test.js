import React from 'react';
import { render, screen } from '@testing-library/react';
import Message from './Message';

test('renders message text correctly', () => {
  render(<Message text="Test CI/CD message" />);
  const element = screen.getByText(/Test CI\/CD message/i);
  expect(element).toBeInTheDocument();
});
