export function listToSelectOptions(list) { return list.map(e => ({ value: e.id, label: e.name })) }
export function findById(list, id) { return list.find(item => item.id == id) }

export function resultJsonToFormData(obj) {
  const formData = new FormData()

  formData.append('time', obj.time)
  formData.append('user_id', obj.user.id)
  formData.append('city_id', obj.city.id)
  formData.append('team_id', obj.team.id)
  obj.group && formData.append('group_id', obj.group.id)
  obj.raceId && formData.append('race_id', obj.raceId)

  return formData
}
