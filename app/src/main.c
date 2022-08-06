#include <zephyr/zephyr.h>

#include <zephyr/logging/log.h>
LOG_MODULE_REGISTER(main, CONFIG_APP_LOG_LEVEL);

void main(void)
{
    LOG_INF("First line of main");
    printk("First line of main\n");
    while(1)
    {
        LOG_INF("while loop");
        LOG_ERR("while loop");
        printk("while loop\n");
        k_sleep(K_MSEC(1000));
    }
}