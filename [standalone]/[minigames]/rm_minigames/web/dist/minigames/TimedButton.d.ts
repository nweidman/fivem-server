declare const TimedButton: ({ locales, wrongCount, sequence, difficulty }: {
    locales: {
        [key: string]: string;
    };
    wrongCount: number;
    sequence: string[];
    difficulty: number;
}) => import("react/jsx-runtime").JSX.Element;
export default TimedButton;
