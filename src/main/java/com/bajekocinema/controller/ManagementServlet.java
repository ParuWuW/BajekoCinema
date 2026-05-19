package com.bajekocinema.controller;

import com.bajekocinema.dao.ShowDAO;
import com.bajekocinema.model.HallModel;
import com.bajekocinema.model.TheatreModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(asyncSupported = true, urlPatterns = { "/admin/management" })
public class ManagementServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private final ShowDAO showDAO = new ShowDAO();

	// ── GET ──────────────────────────────────────────────────────────────────
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<TheatreModel> theatreList = showDAO.getAllTheatres();
		List<HallModel>    hallList    = showDAO.getAllHalls();
		request.setAttribute("theatreList", theatreList);
		request.setAttribute("hallList",    hallList);

		String form = request.getParameter("form");

		if ("add_theatre".equals(form)) {
			request.setAttribute("showAddTheatreForm", true);

		} else if ("edit_theatre".equals(form)) {
			String tidStr = request.getParameter("theatreID");
			if (tidStr != null && !tidStr.trim().isEmpty()) {
				try {
					int theatreId = Integer.parseInt(tidStr.trim());
					TheatreModel theatreToEdit = showDAO.getTheatreById(theatreId);
					if (theatreToEdit != null) {
						request.setAttribute("theatreToEdit", theatreToEdit);
						request.setAttribute("showEditTheatreForm", true);
					}
				} catch (NumberFormatException e) {
					// bad ID — fall through to default view
				}
			}

		} else if ("add_hall".equals(form)) {
			request.setAttribute("showTheatrePicker", true);

		} else if ("add_hall_step2".equals(form)) {
			String tidStr = request.getParameter("theatreID");
			if (tidStr != null && !tidStr.trim().isEmpty()) {
				try {
					int theatreId = Integer.parseInt(tidStr.trim());
					for (TheatreModel t : theatreList) {
						if (t.getTheatreId() == theatreId) {
							request.setAttribute("selectedTheatre", t);
							break;
						}
					}
					request.setAttribute("showAddHallForm",   true);
					request.setAttribute("selectedTheatreId", theatreId);
				} catch (NumberFormatException e) {
					request.setAttribute("showTheatrePicker", true);
				}
			} else {
				request.setAttribute("showTheatrePicker", true);
			}

		} else if ("edit_hall".equals(form)) {
			String hidStr = request.getParameter("hallID");
			if (hidStr != null && !hidStr.trim().isEmpty()) {
				try {
					int hallId = Integer.parseInt(hidStr.trim());
					HallModel hallToEdit = showDAO.getHallById(hallId);
					if (hallToEdit != null) {
						request.setAttribute("hallToEdit", hallToEdit);
						request.setAttribute("showEditHallForm", true);
					}
				} catch (NumberFormatException e) {
					// bad ID — fall through to default view
				}
			}
		}

		request.setAttribute("currentPage", "management");
		request.getRequestDispatcher("/WEB-INF/pages/admin/ManagementAdmin.jsp")
				.forward(request, response);
	}

	// ── POST ─────────────────────────────────────────────────────────────────
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");

		if ("add_theatre".equals(action)) {
			String name    = request.getParameter("theatreName");
			String address = request.getParameter("theatreAddress");
			String phone   = request.getParameter("theatrePhone");
			String email   = request.getParameter("theatreEmail");

			if (name != null && !name.trim().isEmpty()
					&& address != null && !address.trim().isEmpty()) {
				showDAO.addTheatre(name.trim(), address.trim(),
						nullIfBlank(phone), nullIfBlank(email));
			}

		} else if ("update_theatre".equals(action)) {
			String tidStr  = request.getParameter("theatreID");
			String name    = request.getParameter("theatreName");
			String address = request.getParameter("theatreAddress");
			String phone   = request.getParameter("theatrePhone");
			String email   = request.getParameter("theatreEmail");

			if (tidStr != null && !tidStr.trim().isEmpty()
					&& name != null && !name.trim().isEmpty()
					&& address != null && !address.trim().isEmpty()) {
				try {
					showDAO.updateTheatre(
							Integer.parseInt(tidStr.trim()),
							name.trim(),
							address.trim(),
							nullIfBlank(phone),
							nullIfBlank(email));
				} catch (NumberFormatException ignored) {}
			}

		} else if ("delete_theatre".equals(action)) {
			String tidStr = request.getParameter("theatreID");
			if (tidStr != null && !tidStr.trim().isEmpty()) {
				try {
					showDAO.deleteTheatre(Integer.parseInt(tidStr.trim()));
				} catch (NumberFormatException ignored) {}
			}

		} else if ("add_hall".equals(action)) {
			String tidStr   = request.getParameter("theatreID");
			String hallName = request.getParameter("hallName");
			String capStr   = request.getParameter("hallCapacity");

			if (tidStr != null && hallName != null && capStr != null
					&& !tidStr.trim().isEmpty()
					&& !hallName.trim().isEmpty()
					&& !capStr.trim().isEmpty()) {
				try {
					showDAO.addHall(
							Integer.parseInt(tidStr.trim()),
							hallName.trim(),
							Integer.parseInt(capStr.trim()));
				} catch (NumberFormatException ignored) {}
			}

		} else if ("update_hall".equals(action)) {
			String hidStr   = request.getParameter("hallID");
			String hallName = request.getParameter("hallName");
			String capStr   = request.getParameter("hallCapacity");

			if (hidStr != null && hallName != null && capStr != null
					&& !hidStr.trim().isEmpty()
					&& !hallName.trim().isEmpty()
					&& !capStr.trim().isEmpty()) {
				try {
					showDAO.updateHall(
							Integer.parseInt(hidStr.trim()),
							hallName.trim(),
							Integer.parseInt(capStr.trim()));
				} catch (NumberFormatException ignored) {}
			}

		} else if ("delete_hall".equals(action)) {
			String hidStr = request.getParameter("hallID");
			if (hidStr != null && !hidStr.trim().isEmpty()) {
				try {
					showDAO.deleteHall(Integer.parseInt(hidStr.trim()));
				} catch (NumberFormatException ignored) {}
			}
		}

		response.sendRedirect(request.getContextPath() + "/admin/management");
	}

	// ── Helper ───────────────────────────────────────────────────────────────
	private String nullIfBlank(String s) {
		return (s == null || s.trim().isEmpty()) ? null : s.trim();
	}
}