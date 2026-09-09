package vn.iotstar.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import vn.iotstar.entity.Category;
import vn.iotstar.repository.CategoryRepository;
import java.util.List;

@Controller
@RequestMapping("/admin/categories")
public class AdminCategoryController {
    
    @Autowired
    private CategoryRepository categoryRepository;

    @GetMapping
    public String list(Model model, @RequestParam(name="keyword", required=false) String keyword) {
        List<Category> categories;
        if(keyword != null && !keyword.isEmpty()) {
            categories = categoryRepository.findByNameContainingIgnoreCase(keyword);
            model.addAttribute("keyword", keyword);
        } else {
            categories = categoryRepository.findAll();
        }
        model.addAttribute("categories", categories);
        return "admin/category/list";
    }

    @GetMapping("/add")
    public String addForm(Model model) {
        model.addAttribute("category", new Category());
        return "admin/category/form";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute("category") Category category) {
        categoryRepository.save(category);
        return "redirect:/admin/categories";
    }

    @GetMapping("/edit/{id}")
    public String editForm(@PathVariable("id") Long id, Model model) {
        Category category = categoryRepository.findById(id).orElse(null);
        if(category != null) {
            model.addAttribute("category", category);
            return "admin/category/form";
        }
        return "redirect:/admin/categories";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable("id") Long id) {
        categoryRepository.deleteById(id);
        return "redirect:/admin/categories";
    }
}
