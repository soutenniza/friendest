package com.springapp.mvc;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class MapController {
	@RequestMapping(value = "/map", method = RequestMethod.GET)
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView("map");

		return mav;
	}

	@RequestMapping(value = "/submitlocations", method = RequestMethod.POST)
	public ModelAndView showmap(@RequestParam(value ="address1Friend") String oneFriend,
								@RequestParam(value ="address2Friend") String twoFriend,
								@RequestParam(value ="address1Dest") String oneDest,
								@RequestParam(value ="address2Dest") String twoDest){
		ModelAndView mav = new ModelAndView("map2");
		mav.addObject("msg", oneFriend);
		return mav;
	}
}