export function listToSelectOptions(list) { return list.map(e => ({ value: e.id, label: e.name })) }
export function findById(list, id) { return list.find(item => item.id == id) }
