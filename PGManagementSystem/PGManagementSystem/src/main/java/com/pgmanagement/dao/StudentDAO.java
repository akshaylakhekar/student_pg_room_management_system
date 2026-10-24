package com.pgmanagement.dao;

import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.pgmanagement.model.Student;

@Repository
public class StudentDAO {

    private final JdbcTemplate jdbcTemplate;

    public StudentDAO(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public boolean addStudent(Student student) {

        String sql =
                "INSERT INTO students "
              + "(name, email, mobile, guardian_mobile, address, id_proof, password) "
              + "VALUES (?, ?, ?, ?, ?, ?, ?)";

        int rows =
                jdbcTemplate.update(
                        sql,
                        student.getName(),
                        student.getEmail(),
                        student.getMobile(),
                        student.getGuardianMobile(),
                        student.getAddress(),
                        student.getIdProof(),
                        student.getPassword()
                );

        return rows > 0;
    }

    public List<Student> getAllStudents() {

        String sql =
                "SELECT id, name, email, mobile, guardian_mobile, "
              + "address, id_proof, password "
              + "FROM students "
              + "ORDER BY id DESC";

        return jdbcTemplate.query(
                sql,
                (rs, rowNum) -> {

                    Student student = new Student();

                    student.setId(
                            rs.getInt("id")
                    );

                    student.setName(
                            rs.getString("name")
                    );

                    student.setEmail(
                            rs.getString("email")
                    );

                    student.setMobile(
                            rs.getString("mobile")
                    );

                    student.setGuardianMobile(
                            rs.getString("guardian_mobile")
                    );

                    student.setAddress(
                            rs.getString("address")
                    );

                    student.setIdProof(
                            rs.getString("id_proof")
                    );

                    student.setPassword(
                            rs.getString("password")
                    );

                    return student;
                }
        );
    }

    public Student getStudentById(int id) {

        String sql =
                "SELECT id, name, email, mobile, guardian_mobile, "
              + "address, id_proof, password "
              + "FROM students "
              + "WHERE id = ?";

        List<Student> students =
                jdbcTemplate.query(
                        sql,
                        (rs, rowNum) -> {

                            Student student =
                                    new Student();

                            student.setId(
                                    rs.getInt("id")
                            );

                            student.setName(
                                    rs.getString("name")
                            );

                            student.setEmail(
                                    rs.getString("email")
                            );

                            student.setMobile(
                                    rs.getString("mobile")
                            );

                            student.setGuardianMobile(
                                    rs.getString(
                                            "guardian_mobile"
                                    )
                            );

                            student.setAddress(
                                    rs.getString("address")
                            );

                            student.setIdProof(
                                    rs.getString("id_proof")
                            );

                            student.setPassword(
                                    rs.getString("password")
                            );

                            return student;
                        },
                        id
                );

        if (students.isEmpty()) {
            return null;
        }

        return students.get(0);
    }

    public boolean updateStudent(Student student) {

        String sql =
                "UPDATE students SET "
              + "name = ?, "
              + "email = ?, "
              + "mobile = ?, "
              + "guardian_mobile = ?, "
              + "address = ?, "
              + "id_proof = ? "
              + "WHERE id = ?";

        int rows =
                jdbcTemplate.update(
                        sql,
                        student.getName(),
                        student.getEmail(),
                        student.getMobile(),
                        student.getGuardianMobile(),
                        student.getAddress(),
                        student.getIdProof(),
                        student.getId()
                );

        return rows > 0;
    }

    public boolean deleteStudent(int id) {

        try {

            String sql =
                    "DELETE FROM students "
                  + "WHERE id = ?";

            int rows =
                    jdbcTemplate.update(
                            sql,
                            id
                    );

            return rows > 0;

        } catch (Exception e) {

            return false;
        }
    }

    public List<Student> searchStudents(
            String keyword) {

        String sql =
                "SELECT id, name, email, mobile, guardian_mobile, "
              + "address, id_proof, password "
              + "FROM students "
              + "WHERE name LIKE ? "
              + "OR email LIKE ? "
              + "OR mobile LIKE ? "
              + "ORDER BY id DESC";

        String search =
                "%" + keyword + "%";

        return jdbcTemplate.query(
                sql,
                (rs, rowNum) -> {

                    Student student =
                            new Student();

                    student.setId(
                            rs.getInt("id")
                    );

                    student.setName(
                            rs.getString("name")
                    );

                    student.setEmail(
                            rs.getString("email")
                    );

                    student.setMobile(
                            rs.getString("mobile")
                    );

                    student.setGuardianMobile(
                            rs.getString(
                                    "guardian_mobile"
                            )
                    );

                    student.setAddress(
                            rs.getString("address")
                    );

                    student.setIdProof(
                            rs.getString("id_proof")
                    );

                    student.setPassword(
                            rs.getString("password")
                    );

                    return student;
                },
                search,
                search,
                search
        );
    }

    public Student login(
            String email,
            String password) {

        String sql =
                "SELECT id, name, email, mobile, "
              + "guardian_mobile, address, id_proof, password "
              + "FROM students "
              + "WHERE email = ? "
              + "AND password = ?";

        try {

            return jdbcTemplate.queryForObject(
                    sql,
                    (rs, rowNum) -> {

                        Student student =
                                new Student();

                        student.setId(
                                rs.getInt("id")
                        );

                        student.setName(
                                rs.getString("name")
                        );

                        student.setEmail(
                                rs.getString("email")
                        );

                        student.setMobile(
                                rs.getString("mobile")
                        );

                        student.setGuardianMobile(
                                rs.getString(
                                        "guardian_mobile"
                                )
                        );

                        student.setAddress(
                                rs.getString("address")
                        );

                        student.setIdProof(
                                rs.getString("id_proof")
                        );

                        student.setPassword(
                                rs.getString("password")
                        );

                        return student;
                    },
                    email,
                    password
            );

        } catch (Exception e) {

            return null;
        }
    }
}