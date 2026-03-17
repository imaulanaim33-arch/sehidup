// supabase.js — import file ini di semua halaman

import { createClient } from 'https://cdn.jsdelivr.net/npm/@supabase/supabase-js@2/+esm'

const SUPABASE_URL = 'https://bndcowyyahiythrunxve.supabase.co'
const SUPABASE_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJuZGNvd3l5YWhpeXRocnVueHZlIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzM3MDEyMDUsImV4cCI6MjA4OTI3NzIwNX0.UMUrdBI5M2H1FQKzQqM_CCqugmuEVKWfo0oF0DuYt4I'

export const supabase = createClient(SUPABASE_URL, SUPABASE_KEY)

// ── AUTH HELPERS

export async function getUser() {
  const { data: { user } } = await supabase.auth.getUser()
  return user
}

export async function getProfile(userId) {
  const { data, error } = await supabase
    .from('profiles')
    .select('*')
    .eq('id', userId)
    .single()
  return { data, error }
}

export async function signOut() {
  await supabase.auth.signOut()
  window.location.href = 'auth.html'
}

// ── INVITATION HELPERS

export async function getInvitations(userId) {
  const { data, error } = await supabase
    .from('invitations')
    .select('*')
    .eq('user_id', userId)
    .order('created_at', { ascending: false })
  return { data, error }
}

export async function getInvitationBySlug(slug) {
  const { data, error } = await supabase
    .from('invitations')
    .select('*')
    .eq('slug', slug)
    .eq('status', 'active')
    .single()
  return { data, error }
}

export async function upsertInvitation(payload) {
  const { data, error } = await supabase
    .from('invitations')
    .upsert(payload, { onConflict: 'slug' })
    .select()
    .single()
  return { data, error }
}

export async function deleteInvitation(id) {
  const { error } = await supabase
    .from('invitations')
    .delete()
    .eq('id', id)
  return { error }
}

export async function incrementViewCount(id) {
  await supabase.rpc('increment_view', { inv_id: id })
}

// ── RSVP HELPERS

export async function submitRSVP({ invitationId, name, attendance, guestCount }) {
  const { data, error } = await supabase
    .from('rsvp')
    .insert({ invitation_id: invitationId, name, attendance, guest_count: guestCount })
  return { data, error }
}

export async function getRSVP(invitationId) {
  const { data, error } = await supabase
    .from('rsvp')
    .select('*')
    .eq('invitation_id', invitationId)
    .order('created_at', { ascending: false })
  return { data, error }
}

// ── GUESTBOOK HELPERS

export async function submitGuestbook({ invitationId, name, message }) {
  const { data, error } = await supabase
    .from('guestbook')
    .insert({ invitation_id: invitationId, name, message })
  return { data, error }
}

export async function getGuestbook(invitationId) {
  const { data, error } = await supabase
    .from('guestbook')
    .select('*')
    .eq('invitation_id', invitationId)
    .order('created_at', { ascending: false })
  return { data, error }
}

// ── PLAN HELPERS

export function isPremium(profile) {
  if (profile?.plan !== 'premium') return false
  return new Date(profile.plan_expires_at) > new Date()
}

export function daysRemaining(profile) {
  const exp = new Date(profile?.plan_expires_at)
  const now = new Date()
  return Math.max(0, Math.ceil((exp - now) / (1000 * 60 * 60 * 24)))
}
