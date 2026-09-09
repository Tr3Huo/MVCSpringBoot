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
            users = userRepository.searchActiveUsers(keyword);
            model.addAttribute("keyword", keyword);
        } else {
            users = userRepository.findActiveUsers();
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
        if(user.getIsDeleted() == null) {
            user.setIsDeleted(false);
        }
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
        User user = userRepository.findById(id).orElse(null);
        if(user != null) {
            user.setIsDeleted(true);
            userRepository.save(user);
        }
        return "redirect:/admin/users";
    }

    @GetMapping("/trash")
    public String trash(Model model) {
        model.addAttribute("users", userRepository.findDeletedUsers());
        return "admin/user/trash";
    }

    @GetMapping("/restore/{id}")
    public String restore(@PathVariable("id") Long id) {
        User user = userRepository.findById(id).orElse(null);
        if(user != null) {
            user.setIsDeleted(false);
            userRepository.save(user);
        }
        return "redirect:/admin/users/trash";
    }
}
