package com.virtualclassroom.service.classroom;

import com.virtualclassroom.model.Classroom;
import org.springframework.data.domain.Page;

import java.util.List;

public interface ClassroomService {
    Classroom getClassroomById(Long id);
    void createClass(Classroom classroom);
    List<Classroom> getAllClasses();
    List<Classroom> getClassesByUsername(String username);
    Classroom findClassByCodeID(String keyword);

    Page<Classroom> findPaginated(String userName, int pageId, int pageSize);
}

