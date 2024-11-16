import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

async function testConnection() {
  try {
    // Cria um novo usuário
    const newUser = await prisma.user.create({
      data: {
        name: "Test User",
        email: "test@example.com",
      },
    });
    console.log("User created:", newUser);

    // Consulta todos os usuários
    const users = await prisma.user.findMany();
    console.log("All users:", users);
  } catch (error) {
    console.error("Error testing connection:", error);
  } finally {
    await prisma.$disconnect();
  }
}

testConnection();
