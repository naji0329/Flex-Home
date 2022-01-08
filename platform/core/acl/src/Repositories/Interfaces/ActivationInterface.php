<?php

namespace Botble\ACL\Repositories\Interfaces;

use Botble\ACL\Models\Activation;
use Botble\ACL\Models\User;

interface ActivationInterface
{
    /**
     * Create a new activation record and code.
     *
     * @param User $user
     * @return Activation
     */
    public function createUser(User $user);

    /**
     * Checks if a valid activation for the given user exists.
     *
     * @param User $user
     * @param string $code
     * @return Activation|bool
     */
    public function exists(User $user, $code = null);

    /**
     * Completes the activation for the given user.
     *
     * @param User $user
     * @param string $code
     * @return bool
     */
    public function complete(User $user, $code);

    /**
     * Checks if a valid activation has been completed.
     *
     * @param User $user
     * @return Activation|bool
     */
    public function completed(User $user);

    /**
     * Remove an existing activation (deactivate).
     *
     * @param User $user
     * @return bool|null
     */
    public function remove(User $user);

    /**
     * Remove expired activation codes.
     *
     * @return int
     */
    public function removeExpired();
}
