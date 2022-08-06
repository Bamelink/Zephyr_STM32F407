#include <zephyr/zephyr.h>

#include <zephyr/logging/log.h>
LOG_MODULE_REGISTER(main, CONFIG_APP_LOG_LEVEL);

void main(void)
{
    LOG_INF("First line of main");
    prinkt("First line of main\n");
    while(1)
    {
        LOG_INF("while loop");
        LOG_ERR("while loop");
        prinkt("while loop\n");
        k_sleep(K_MSEC(1000));
    }
}