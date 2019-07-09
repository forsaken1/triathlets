export function resultsPath(race_id) { return `/api/results.json?race_id=${race_id}` }
export function usersPath() { return '/api/users.json' }
export function teamsPath() { return '/api/teams.json' }
export function citiesPath() { return '/api/cities.json' }
export function racesPath() { return '/api/races.json' }
export function racePath(id) { return `/api/races/${id}.json` }
