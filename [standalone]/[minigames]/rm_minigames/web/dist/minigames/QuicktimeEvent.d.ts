import { Key } from '../vite-env';

declare const QuicktimeEvent: ({ keySequence }: {
    keySequence: Key[];
}) => import("react/jsx-runtime").JSX.Element;
export default QuicktimeEvent;
