'use client'

import { useState, useCallback } from 'react'
import Cropper from 'react-easy-crop'
import type { Area, Point } from 'react-easy-crop'

interface ImageCropperProps {
  imageSrc: string
  onCropComplete: (croppedBlob: Blob) => void
  onCancel: () => void
  aspect?: number
}

export default function ImageCropper({
  imageSrc,
  onCropComplete,
  onCancel,
  aspect = 16 / 9,
}: ImageCropperProps) {
  const [crop, setCrop] = useState<Point>({ x: 0, y: 0 })
  const [zoom, setZoom] = useState(1)
  const [croppedAreaPixels, setCroppedAreaPixels] = useState<Area | null>(null)
  const [processing, setProcessing] = useState(false)

  const onCropChange = useCallback((location: Point) => {
    setCrop(location)
  }, [])

  const onZoomChange = useCallback((newZoom: number) => {
    setZoom(newZoom)
  }, [])

  const onCropAreaComplete = useCallback(
    (_croppedArea: Area, croppedAreaPixels: Area) => {
      setCroppedAreaPixels(croppedAreaPixels)
    },
    []
  )

  const handleConfirm = async () => {
    if (!croppedAreaPixels) return

    setProcessing(true)
    try {
      const croppedBlob = await getCroppedImage(imageSrc, croppedAreaPixels)
      onCropComplete(croppedBlob)
    } catch (err) {
      console.error('Crop error:', err)
    } finally {
      setProcessing(false)
    }
  }

  return (
    <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50">
      <div className="bg-white rounded-lg shadow-xl w-full max-w-2xl mx-4 overflow-hidden">
        <div className="p-4 border-b border-gray-200">
          <h2 className="text-lg font-semibold text-gray-900">Crop Gambar</h2>
          <p className="text-xs text-gray-500">
            Sesuaikan area crop. Output: 1200x675 (16:9)
          </p>
        </div>

        <div className="relative h-[400px] bg-gray-900">
          <Cropper
            image={imageSrc}
            crop={crop}
            zoom={zoom}
            aspect={aspect}
            onCropChange={onCropChange}
            onZoomChange={onZoomChange}
            onCropComplete={onCropAreaComplete}
          />
        </div>

        <div className="px-4 py-3 border-t border-gray-200">
          <div className="flex items-center gap-3">
            <svg className="w-4 h-4 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0zM13 10H7" />
            </svg>
            <input
              type="range"
              min={1}
              max={3}
              step={0.1}
              value={zoom}
              onChange={(e) => setZoom(Number(e.target.value))}
              className="flex-1 h-2 bg-gray-200 rounded-lg appearance-none cursor-pointer accent-red-600"
            />
            <svg className="w-4 h-4 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0zM10 7v3m0 0v3m0-3h3m-3 0H7" />
            </svg>
          </div>
        </div>

        <div className="p-4 border-t border-gray-200 flex justify-end gap-2">
          <button
            type="button"
            onClick={onCancel}
            disabled={processing}
            className="px-4 py-2 border border-gray-300 text-gray-700 text-sm rounded-md hover:bg-gray-50 disabled:opacity-50"
          >
            Batal
          </button>
          <button
            type="button"
            onClick={handleConfirm}
            disabled={processing || !croppedAreaPixels}
            className="px-4 py-2 bg-red-600 text-white text-sm font-medium rounded-md hover:bg-red-700 disabled:bg-red-400 disabled:cursor-not-allowed"
          >
            {processing ? 'Memproses...' : 'Crop & Upload'}
          </button>
        </div>
      </div>
    </div>
  )
}

function createImage(url: string): Promise<HTMLImageElement> {
  return new Promise((resolve, reject) => {
    const image = new window.Image()
    image.addEventListener('load', () => resolve(image))
    image.addEventListener('error', (error) => reject(error))
    image.crossOrigin = 'anonymous'
    image.src = url
  })
}

async function getCroppedImage(imageSrc: string, pixelCrop: Area): Promise<Blob> {
  const image = await createImage(imageSrc)
  const canvas = document.createElement('canvas')
  const ctx = canvas.getContext('2d')!

  canvas.width = 1200
  canvas.height = 675

  ctx.drawImage(
    image,
    pixelCrop.x,
    pixelCrop.y,
    pixelCrop.width,
    pixelCrop.height,
    0,
    0,
    1200,
    675
  )

  return new Promise((resolve, reject) => {
    canvas.toBlob(
      (blob) => {
        if (blob) resolve(blob)
        else reject(new Error('Canvas toBlob failed'))
      },
      'image/webp',
      0.9
    )
  })
}
