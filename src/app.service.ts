import { Injectable } from '@nestjs/common';

@Injectable()
export class AppService {
  getHello(): string {
    return 'Hello, DevOps with NestJS on Azure! 🚀';
  }
}
