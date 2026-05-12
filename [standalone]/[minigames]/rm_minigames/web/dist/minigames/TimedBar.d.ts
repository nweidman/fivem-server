declare const TimedBar: ({ locales, missCount, difficulty, winCount }: {
    locales: {
        [key: string]: string;
    };
    missCount: number;
    difficulty: number;
    winCount: number;
}) => import("react/jsx-runtime").JSX.Element;
export default TimedBar;
