package in.co.sunrays.proj3.util;

import in.co.sunrays.proj3.dto.DropdownList;

import java.util.HashMap;
import java.util.List;
import java.util.Set;
import java.util.Collections;

/**
 * HTML Utility class to produce HTML contents like Dropdown List.
 * 
 * @author SUNRAYS Technologies
 * @version 1.0
 * @Copyright (c) SUNRAYS Technologies
 * 
 */
public class HTMLUtility {

	/**
	 * Create HTML SELECT list from MAP paramters values
	 * 
	 * @param name
	 * @param selectedVal
	 * @param map
	 * @return
	 */
	public static String getList(String name, String selectedVal,
			HashMap<String, String> map) {
		StringBuffer sb = new StringBuffer("<select name='" + name + "'>");
		Set<String> keys = map.keySet();
		String val = null;

		for (String key : keys) {
			val = map.get(key);
			if (key.trim().equals(selectedVal)) {
				sb.append("<option selected value='" + key + "'>" + val
						+ "</option>");
			} else {
				sb.append("<option value='" + key + "'>" + val + "</option>");
			}
		}
		sb.append("</select>");
		return sb.toString();
	}

	/**
	 * Create HTML SELECT List from List parameter
	 * 
	 * @param name
	 * @param selectedVal
	 * @param list
	 * @return
	 */
	public static String getList(String name, String selectedVal, List list) {

		Collections.sort(list);

		List<DropdownList> dd = (List<DropdownList>) list;

		StringBuffer sb = new StringBuffer("<select name='" + name + "'>");

		String key = null;
		String val = null;

		for (DropdownList obj : dd) {
			key = obj.getKey();
			val = obj.getValue();

			if (key.trim().equals(selectedVal)) {
				sb.append("<option selected value='" + key + "'>" + val
						+ "</option>");
			} else {
				sb.append("<option value='" + key + "'>" + val + "</option>");
			}
		}
		sb.append("</select>");
		return sb.toString();
	}

}
