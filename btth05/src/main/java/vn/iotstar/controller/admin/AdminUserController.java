package vn.iotstar.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import vn.iotstar.entity.User;
import vn.iotstar.repository.UserRepository;
import java.util.List;

@Controller
@RequestMapping("/admin/users")
public class AdminUserController {
    
    @Autowired
    private UserRepository userRepository;

    @GetMapping
    public String list(Model model, @RequestParam(name="keyword", required=false) String keyword) {
        List<User> users;
        if(keyword != null && !keyword.isEmpty()) {
            users = userRepository.findByUsernameContainingIgnoreCaseOrFullNameContainingIgnoreCase(keyword, keyword);
            model.addAttribute("keyword", keyword);
        } else {
            users = userRepository.findAll();
        }
        model.addAttribute("users", users);
        return "admin/user/list";
    }

    @GetMapping("/add")
    public String addForm(Model model) {
        model.addAttribute("user", new User());
        return "admin/user/form";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute("user") User user) {
        userRepository.save(user);
        return "redirect:/admin/users";
    }

    @GetMapping("/edit/{id}")
    public String editForm(@PathVariable("id") Long id, Model model) {
        User user = userRepository.findById(id).orElse(null);
        if(user != null) {
            model.addAttribute("user", user);
            return "admin/user/form";
        }
        return "redirect:/admin/users";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable("id") Long id) {
        userRepository.deleteById(id);
        return "redirect:/admin/users";
    }
}
