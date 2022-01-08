<?php

namespace Botble\ACL\Commands;

use Botble\ACL\Repositories\Interfaces\UserInterface;
use Botble\ACL\Services\ActivateUserService;
use Exception;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Validator;

class UserCreateCommand extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'cms:user:create';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Create a super user';

    /**
     * @var UserInterface
     */
    protected $userRepository;

    /**
     * @var ActivateUserService
     */
    protected $activateUserService;

    /**
     * UserCreateCommand constructor.
     * @param UserInterface $userRepository
     * @param ActivateUserService $activateUserService
     */
    public function __construct(UserInterface $userRepository, ActivateUserService $activateUserService)
    {
        parent::__construct();

        $this->userRepository = $userRepository;
        $this->activateUserService = $activateUserService;
    }

    /**
     * @return int
     */
    public function handle()
    {
        $this->info('Creating a super user...');

        try {
            $user = $this->userRepository->getModel();
            $user->first_name = $this->askWithValidate('Enter first name', 'required|min:2|max:60');
            $user->last_name = $this->askWithValidate('Enter last name', 'required|min:2|max:60');
            $user->email = $this->askWithValidate('Enter email address', 'required|email|unique:users,email');
            $user->username = $this->askWithValidate('Enter username', 'required|min:4|max:60|unique:users,username');
            $user->password = bcrypt($this->askWithValidate('Enter password', 'required|min:6|max:60', true));
            $user->super_user = 1;
            $user->manage_supers = 1;

            $this->userRepository->createOrUpdate($user);
            if ($this->activateUserService->activate($user)) {
                $this->info('Super user is created.');
            }

            return 0;
        } catch (Exception $exception) {
            $this->error('User could not be created.');
            $this->error($exception->getMessage());
            return 1;
        }
    }

    /**
     * @param string $message
     * @param string $rules
     * @param bool $secret
     * @return string
     */
    protected function askWithValidate(string $message, string $rules, $secret = false): string
    {
        do {
            if ($secret) {
                $input = $this->secret($message);
            } else {
                $input = $this->ask($message);
            }
            $validate = $this->validate(compact('input'), ['input' => $rules]);
            if ($validate['error']) {
                $this->error($validate['message']);
            }
        } while ($validate['error']);

        return $input;
    }

    /**
     * @param array $data
     * @param array $rules
     * @return array
     */
    protected function validate(array $data, array $rules): array
    {
        $validator = Validator::make($data, $rules);
        if ($validator->fails()) {
            return [
                'error'   => true,
                'message' => $validator->messages()->first(),
            ];
        }

        return [
            'error' => false,
        ];
    }
}
