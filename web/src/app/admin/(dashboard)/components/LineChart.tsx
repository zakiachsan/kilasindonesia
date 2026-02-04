'use client'

interface MonthlyData {
  month: number
  year: number
  count: number
}

interface LineChartProps {
  data: MonthlyData[]
  title?: string
}

const MONTH_NAMES = ['Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun', 'Jul', 'Ags', 'Sep', 'Okt', 'Nov', 'Des']

export function LineChart({ data, title = 'Artikel Dipublikasi' }: LineChartProps) {
  // Get current year data or fill with zeros
  const currentYear = new Date().getFullYear()

  // Create array for all 12 months with counts
  const monthlyData = Array.from({ length: 12 }, (_, i) => {
    const found = data.find(d => d.month === i + 1 && d.year === currentYear)
    return {
      month: i + 1,
      monthName: MONTH_NAMES[i],
      count: found?.count || 0
    }
  })

  // Calculate chart dimensions
  const maxCount = Math.max(...monthlyData.map(d => d.count), 10)
  const chartWidth = 100
  const chartHeight = 50
  const padding = { top: 5, right: 5, bottom: 8, left: 10 }
  const innerWidth = chartWidth - padding.left - padding.right
  const innerHeight = chartHeight - padding.top - padding.bottom

  // Calculate Y-axis scale (round up to nice number)
  const yMax = Math.ceil(maxCount / 10) * 10 || 10
  const yTicks = [0, Math.round(yMax / 2), yMax]

  // Calculate points for the line
  const points = monthlyData.map((d, i) => {
    const x = padding.left + (i / 11) * innerWidth
    const y = padding.top + innerHeight - (d.count / yMax) * innerHeight
    return { x, y, ...d }
  })

  // Create SVG path for the line
  const linePath = points
    .map((p, i) => `${i === 0 ? 'M' : 'L'} ${p.x.toFixed(2)} ${p.y.toFixed(2)}`)
    .join(' ')

  // Create SVG path for the area fill
  const areaPath = `${linePath} L ${points[points.length - 1].x.toFixed(2)} ${(padding.top + innerHeight).toFixed(2)} L ${padding.left} ${(padding.top + innerHeight).toFixed(2)} Z`

  return (
    <div className="bg-white rounded-md shadow-sm border border-gray-200 p-4 flex flex-col h-full">
      <h3 className="text-sm font-semibold text-gray-900 mb-3">{title}</h3>
      <div className="relative flex-1 min-h-[200px]">
        <svg viewBox={`0 0 ${chartWidth} ${chartHeight}`} className="w-full h-full">
          {/* Grid lines */}
          {yTicks.map((tick, i) => {
            const y = padding.top + innerHeight - (tick / yMax) * innerHeight
            return (
              <g key={i}>
                <line
                  x1={padding.left}
                  y1={y}
                  x2={chartWidth - padding.right}
                  y2={y}
                  stroke="#e5e7eb"
                  strokeWidth="0.2"
                />
                <text
                  x={padding.left - 1}
                  y={y}
                  fill="#9ca3af"
                  fontSize="2"
                  textAnchor="end"
                  dominantBaseline="middle"
                >
                  {tick}
                </text>
              </g>
            )
          })}

          {/* Area fill */}
          <path
            d={areaPath}
            fill="url(#gradient)"
            opacity="0.3"
          />

          {/* Gradient definition */}
          <defs>
            <linearGradient id="gradient" x1="0%" y1="0%" x2="0%" y2="100%">
              <stop offset="0%" stopColor="#dc2626" stopOpacity="0.4" />
              <stop offset="100%" stopColor="#dc2626" stopOpacity="0" />
            </linearGradient>
          </defs>

          {/* Line */}
          <path
            d={linePath}
            fill="none"
            stroke="#dc2626"
            strokeWidth="0.5"
            strokeLinecap="round"
            strokeLinejoin="round"
          />

          {/* Data points */}
          {points.map((p, i) => (
            <g key={i}>
              <circle
                cx={p.x}
                cy={p.y}
                r="0.8"
                fill="#dc2626"
              />
              {/* X-axis labels */}
              <text
                x={p.x}
                y={chartHeight - 1}
                fill="#9ca3af"
                fontSize="2"
                textAnchor="middle"
              >
                {p.monthName}
              </text>
            </g>
          ))}
        </svg>

        {/* Legend */}
        <div className="flex items-center justify-center mt-2 text-xs text-gray-500">
          <span className="flex items-center gap-1.5">
            <span className="w-3 h-0.5 bg-red-600 rounded"></span>
            Tahun {currentYear}
          </span>
        </div>
      </div>
    </div>
  )
}
