package ru.redsoft.ora2rdb;

import java.util.ArrayList;
import java.util.Collection;
import ru.redsoft.ora2rdb.PlSqlParser.*;

public class View {
	Create_viewContext ctx;
	ArrayList<View> dependencies = new ArrayList<View>();
	private boolean visited = false;
	
	public View(Create_viewContext c) {
		ctx = c;
	}



	static ArrayList<View> sort(Collection<View> views) {
		ArrayList<View> sorted_views = new ArrayList<View>();

		for (View v : views)
			topologicalSort(v, sorted_views);

		return sorted_views;
	}

	private static void topologicalSort(View v, Collection<View> s) {
		if (v.visited)
			return;

		v.visited = true;

		for (View dep : v.dependencies)
			topologicalSort(dep, s);

		s.add(v);
	}
}
