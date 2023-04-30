Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86A2E6F2885
	for <lists+linux-omap@lfdr.de>; Sun, 30 Apr 2023 12:56:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230254AbjD3K4g (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 30 Apr 2023 06:56:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbjD3K4f (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 30 Apr 2023 06:56:35 -0400
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45B1D269E
        for <linux-omap@vger.kernel.org>; Sun, 30 Apr 2023 03:56:33 -0700 (PDT)
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-74e3c84e689so154732585a.1
        for <linux-omap@vger.kernel.org>; Sun, 30 Apr 2023 03:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682852192; x=1685444192;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PXKNY/tKlr39zm5OffwYY06aYBGMxeApby9ULHrzTOM=;
        b=PkmahHXT0E8tBZa5go9uKHg6bWqUerqB55J0ALs1NRnqY5otDYF+CY5xUQyEzmpNB8
         lzCq0kg1m+7vLiTS+RTroQVduX/JnFZIstdVay6VmdJ97FSxLNvSckGMcqpFwkV4OXQ4
         Oou0GrRf+iC/hLgoxU3i2JAyg8ctujKbTDdp2QGREHryD6EZHH5zIUHOsVuk5NrErl04
         Le53nK2vroxJdJRurrFbsBfWWdhamslFTpIxcchLOREO8rtjrN4cZjjdz7umfc251lXZ
         9DRlQSGjfix0gzFxCJO/xViv8aXr+05A3tbjacmumcQieWuncHwCSrXtrZBore1PBxrH
         Z92Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682852192; x=1685444192;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PXKNY/tKlr39zm5OffwYY06aYBGMxeApby9ULHrzTOM=;
        b=f+7kh+OdrskqxJxBu3v3f/MplhwNYNSQsYKY5m+un1n+dAWBgfb42dsZSAYZV1XXm5
         bnIxNw3pMfY0emSX7v5LfBw8B23qqOx9MmeblXyNJS8AAYVohH7gRt6fFXlh+0ZdbK5w
         b4uSatDIay/tw0S8v3+LKyX9i7kNhb0hfwILpOnOG6jr/sKIa9yP5iaYQ2kqIPD5yhCm
         6wW3OM0RI5iY3dSR/yotgXLUpQUiOcvsvjTq5cLiNZ6OezsSRWskeilNjFrobbM2Gx0S
         IJNoFLdh3FOZ5Wbjvln5yWY6ocuxEIofPfscCkVAL+RA9/gNpInh8Ono47WnykR20fR6
         H0jw==
X-Gm-Message-State: AC+VfDx5KA6Ps0cZWVKCUuXCykLtJT7lchhHSsS1UZespsoVOmb62EA7
        F5AKVbSm5o1lsFl43UaHx/GdbK9EvWhd1chrY4w=
X-Google-Smtp-Source: ACHHUZ4Z+YIy1fOzFxj+XxO/DgOdbTxavhMpXKB7MW2Kq8dZFKKm3H5yzK23OJ7lwwO4DOX/tEHtYusK4BxPZAxNhPk=
X-Received: by 2002:a05:622a:155:b0:3ec:489c:defb with SMTP id
 v21-20020a05622a015500b003ec489cdefbmr16994995qtw.9.1682852192261; Sun, 30
 Apr 2023 03:56:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230430093505.561265-1-linus.walleij@linaro.org>
In-Reply-To: <20230430093505.561265-1-linus.walleij@linaro.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 30 Apr 2023 13:55:56 +0300
Message-ID: <CAHp75VekbYuE0uWvypvcYTjO1k1pY-25fxRnRmyJVDL=OwQo9w@mail.gmail.com>
Subject: Re: [PATCH v3] ARM/mfd/gpio: Fixup TPS65010 regression on OMAP1 OSK1
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Andreas Kemnade <andreas@kemnade.info>,
        Lee Jones <lee@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sun, Apr 30, 2023 at 12:35=E2=80=AFPM Linus Walleij <linus.walleij@linar=
o.org> wrote:
>
> Aaro reports problems on the OSK1 board after we altered
> the dynamic base for GPIO allocations.
>
> It appears this happens because the OMAP driver now
> allocates GPIO numbers dynamically, so all that is
> references by number is a bit up in the air.
>
> Let's bite the bullet and try to just move the gpio_chip
> in the tps65010 MFD driver over to using dynamic allocations.
> Alter everything in the OSK1 board file to use a GPIO
> descriptor table and lookups.
>
> Utilize the NULL device to define some board-specific
> GPIO lookups and use these to immediately look up the
> same GPIOs, convert to IRQ numbers and pass as resources
> to the devices. This is ugly but should work.
>
> The .setup() callback for tps65010 was used for some GPIO
> hogging, but since the OSK1 is the only user in the entire
> kernel we can alter the signatures to something that
> is helpful and make a clean transition.

LGTM,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Thanks!

One minor remark below (in case new version will be issued)

> Fixes: 92bf78b33b0b ("gpio: omap: use dynamic allocation of base")
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: andy.shevchenko@gmail.com
> Cc: Andreas Kemnade <andreas@kemnade.info>
> Cc: Lee Jones <lee@kernel.org>
> Reported-by: Aaro Koskinen <aaro.koskinen@iki.fi>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v2->v3:
> - Add proper gpiod table terminators.
> - Use DEFINE_RES_IRQ()
> - Forward-declare struct gpio_chip instead of including a header.
> ChangeLog v1->v2:
> - Fix the CF card GPIO lookup
> - Use the right Fixes: tag
> ---
>  arch/arm/mach-omap1/board-osk.c | 137 ++++++++++++++++++++++----------
>  drivers/mfd/tps65010.c          |  14 ++--
>  include/linux/mfd/tps65010.h    |  11 +--
>  3 files changed, 102 insertions(+), 60 deletions(-)
>
> diff --git a/arch/arm/mach-omap1/board-osk.c b/arch/arm/mach-omap1/board-=
osk.c
> index df758c1f9237..03578d2c90f7 100644
> --- a/arch/arm/mach-omap1/board-osk.c
> +++ b/arch/arm/mach-omap1/board-osk.c
> @@ -25,7 +25,8 @@
>   * with this program; if not, write  to the Free Software Foundation, In=
c.,
>   * 675 Mass Ave, Cambridge, MA 02139, USA.
>   */
> -#include <linux/gpio.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/gpio/driver.h>
>  #include <linux/gpio/machine.h>
>  #include <linux/kernel.h>
>  #include <linux/init.h>
> @@ -64,13 +65,12 @@
>  /* TPS65010 has four GPIOs.  nPG and LED2 can be treated like GPIOs with
>   * alternate pin configurations for hardware-controlled blinking.
>   */
> -#define OSK_TPS_GPIO_BASE              (OMAP_MAX_GPIO_LINES + 16 /* MPUI=
O */)
> -#      define OSK_TPS_GPIO_USB_PWR_EN  (OSK_TPS_GPIO_BASE + 0)
> -#      define OSK_TPS_GPIO_LED_D3      (OSK_TPS_GPIO_BASE + 1)
> -#      define OSK_TPS_GPIO_LAN_RESET   (OSK_TPS_GPIO_BASE + 2)
> -#      define OSK_TPS_GPIO_DSP_PWR_EN  (OSK_TPS_GPIO_BASE + 3)
> -#      define OSK_TPS_GPIO_LED_D9      (OSK_TPS_GPIO_BASE + 4)
> -#      define OSK_TPS_GPIO_LED_D2      (OSK_TPS_GPIO_BASE + 5)
> +#define OSK_TPS_GPIO_USB_PWR_EN        0
> +#define OSK_TPS_GPIO_LED_D3    1
> +#define OSK_TPS_GPIO_LAN_RESET 2
> +#define OSK_TPS_GPIO_DSP_PWR_EN        3
> +#define OSK_TPS_GPIO_LED_D9    4
> +#define OSK_TPS_GPIO_LED_D2    5
>
>  static struct mtd_partition osk_partitions[] =3D {
>         /* bootloader (U-Boot, etc) in first sector */
> @@ -174,11 +174,20 @@ static const struct gpio_led tps_leds[] =3D {
>         /* NOTE:  D9 and D2 have hardware blink support.
>          * Also, D9 requires non-battery power.
>          */
> -       { .gpio =3D OSK_TPS_GPIO_LED_D9, .name =3D "d9",
> -                       .default_trigger =3D "disk-activity", },
> -       { .gpio =3D OSK_TPS_GPIO_LED_D2, .name =3D "d2", },
> -       { .gpio =3D OSK_TPS_GPIO_LED_D3, .name =3D "d3", .active_low =3D =
1,
> -                       .default_trigger =3D "heartbeat", },
> +       { .name =3D "d9", .default_trigger =3D "disk-activity", },
> +       { .name =3D "d2", },
> +       { .name =3D "d3", .default_trigger =3D "heartbeat", },
> +};
> +
> +static struct gpiod_lookup_table tps_leds_gpio_table =3D {
> +       .dev_id =3D "leds-gpio",
> +       .table =3D {
> +               /* Use local offsets on TPS65010 */
> +               GPIO_LOOKUP_IDX("tps65010", OSK_TPS_GPIO_LED_D9, NULL, 0,=
 GPIO_ACTIVE_HIGH),
> +               GPIO_LOOKUP_IDX("tps65010", OSK_TPS_GPIO_LED_D2, NULL, 1,=
 GPIO_ACTIVE_HIGH),
> +               GPIO_LOOKUP_IDX("tps65010", OSK_TPS_GPIO_LED_D3, NULL, 2,=
 GPIO_ACTIVE_LOW),
> +               { }
> +       },
>  };
>
>  static struct gpio_led_platform_data tps_leds_data =3D {
> @@ -192,29 +201,34 @@ static struct platform_device osk5912_tps_leds =3D =
{
>         .dev.platform_data      =3D &tps_leds_data,
>  };
>
> -static int osk_tps_setup(struct i2c_client *client, void *context)
> +/* The board just hold these GPIOs hogged from setup to teardown */
> +static struct gpio_desc *eth_reset;
> +static struct gpio_desc *vdd_dsp;
> +
> +static int osk_tps_setup(struct i2c_client *client, struct gpio_chip *gc=
)
>  {
> +       struct gpio_desc *d;
>         if (!IS_BUILTIN(CONFIG_TPS65010))
>                 return -ENOSYS;
>
>         /* Set GPIO 1 HIGH to disable VBUS power supply;
>          * OHCI driver powers it up/down as needed.
>          */
> -       gpio_request(OSK_TPS_GPIO_USB_PWR_EN, "n_vbus_en");
> -       gpio_direction_output(OSK_TPS_GPIO_USB_PWR_EN, 1);
> +       d =3D gpiochip_request_own_desc(gc, OSK_TPS_GPIO_USB_PWR_EN, "n_v=
bus_en",
> +                                     GPIO_ACTIVE_HIGH, GPIOD_OUT_HIGH);
>         /* Free the GPIO again as the driver will request it */
> -       gpio_free(OSK_TPS_GPIO_USB_PWR_EN);
> +       gpiochip_free_own_desc(d);
>
>         /* Set GPIO 2 high so LED D3 is off by default */
>         tps65010_set_gpio_out_value(GPIO2, HIGH);
>
>         /* Set GPIO 3 low to take ethernet out of reset */
> -       gpio_request(OSK_TPS_GPIO_LAN_RESET, "smc_reset");
> -       gpio_direction_output(OSK_TPS_GPIO_LAN_RESET, 0);
> +       eth_reset =3D gpiochip_request_own_desc(gc, OSK_TPS_GPIO_LAN_RESE=
T, "smc_reset",
> +                                             GPIO_ACTIVE_HIGH, GPIOD_OUT=
_LOW);
>
>         /* GPIO4 is VDD_DSP */
> -       gpio_request(OSK_TPS_GPIO_DSP_PWR_EN, "dsp_power");
> -       gpio_direction_output(OSK_TPS_GPIO_DSP_PWR_EN, 1);
> +       vdd_dsp =3D gpiochip_request_own_desc(gc, OSK_TPS_GPIO_DSP_PWR_EN=
, "dsp_power",
> +                                           GPIO_ACTIVE_HIGH, GPIOD_OUT_H=
IGH);
>         /* REVISIT if DSP support isn't configured, power it off ... */
>
>         /* Let LED1 (D9) blink; leds-gpio may override it */
> @@ -232,15 +246,22 @@ static int osk_tps_setup(struct i2c_client *client,=
 void *context)
>
>         /* register these three LEDs */
>         osk5912_tps_leds.dev.parent =3D &client->dev;
> +       gpiod_add_lookup_table(&tps_leds_gpio_table);
>         platform_device_register(&osk5912_tps_leds);
>
>         return 0;
>  }
>
> +static void osk_tps_teardown(struct i2c_client *client, struct gpio_chip=
 *gc)
> +{
> +       gpiochip_free_own_desc(eth_reset);
> +       gpiochip_free_own_desc(vdd_dsp);
> +}
> +
>  static struct tps65010_board tps_board =3D {
> -       .base           =3D OSK_TPS_GPIO_BASE,
>         .outmask        =3D 0x0f,
>         .setup          =3D osk_tps_setup,
> +       .teardown       =3D osk_tps_teardown,
>  };
>
>  static struct i2c_board_info __initdata osk_i2c_board_info[] =3D {
> @@ -263,11 +284,6 @@ static void __init osk_init_smc91x(void)
>  {
>         u32 l;
>
> -       if ((gpio_request(0, "smc_irq")) < 0) {
> -               printk("Error requesting gpio 0 for smc91x irq\n");
> -               return;
> -       }
> -
>         /* Check EMIFS wait states to fix errors with SMC_GET_PKT_HDR */
>         l =3D omap_readl(EMIFS_CCS(1));
>         l |=3D 0x3;
> @@ -279,10 +295,6 @@ static void __init osk_init_cf(int seg)
>         struct resource *res =3D &osk5912_cf_resources[1];
>
>         omap_cfg_reg(M7_1610_GPIO62);
> -       if ((gpio_request(62, "cf_irq")) < 0) {
> -               printk("Error requesting gpio 62 for CF irq\n");
> -               return;
> -       }
>
>         switch (seg) {
>         /* NOTE: CS0 could be configured too ... */
> @@ -308,18 +320,17 @@ static void __init osk_init_cf(int seg)
>                 seg, omap_readl(EMIFS_CCS(seg)), omap_readl(EMIFS_ACS(seg=
)));
>         omap_writel(0x0004a1b3, EMIFS_CCS(seg));        /* synch mode 4 e=
tc */
>         omap_writel(0x00000000, EMIFS_ACS(seg));        /* OE hold/setup =
*/
> -
> -       /* the CF I/O IRQ is really active-low */
> -       irq_set_irq_type(gpio_to_irq(62), IRQ_TYPE_EDGE_FALLING);
>  }
>
>  static struct gpiod_lookup_table osk_usb_gpio_table =3D {
>         .dev_id =3D "ohci",
>         .table =3D {
>                 /* Power GPIO on the I2C-attached TPS65010 */
> -               GPIO_LOOKUP("tps65010", 0, "power", GPIO_ACTIVE_HIGH),
> +               GPIO_LOOKUP("tps65010", OSK_TPS_GPIO_USB_PWR_EN, "power",
> +                           GPIO_ACTIVE_HIGH),
>                 GPIO_LOOKUP(OMAP_GPIO_LABEL, 9, "overcurrent",
>                             GPIO_ACTIVE_HIGH),
> +               { }
>         },
>  };
>
> @@ -341,8 +352,25 @@ static struct omap_usb_config osk_usb_config __initd=
ata =3D {
>
>  #define EMIFS_CS3_VAL  (0x88013141)
>
> +static struct gpiod_lookup_table osk_irq_gpio_table =3D {

> +       .dev_id =3D NULL,

Strictly speaking this is not needed, and rather would be a comment
why it's NULL.

> +       .table =3D {
> +               /* GPIO used for SMC91x IRQ */
> +               GPIO_LOOKUP(OMAP_GPIO_LABEL, 0, "smc_irq",
> +                           GPIO_ACTIVE_HIGH),
> +               /* GPIO used for CF IRQ */
> +               GPIO_LOOKUP("gpio-48-63", 14, "cf_irq",
> +                           GPIO_ACTIVE_HIGH),
> +               /* GPIO used by the TPS65010 chip */
> +               GPIO_LOOKUP("mpuio", 1, "tps65010",
> +                           GPIO_ACTIVE_HIGH),
> +               { }
> +       },
> +};
> +
>  static void __init osk_init(void)
>  {
> +       struct gpio_desc *d;
>         u32 l;
>
>         osk_init_smc91x();
> @@ -359,10 +387,29 @@ static void __init osk_init(void)
>
>         osk_flash_resource.end =3D osk_flash_resource.start =3D omap_cs3_=
phys();
>         osk_flash_resource.end +=3D SZ_32M - 1;
> -       osk5912_smc91x_resources[1].start =3D gpio_to_irq(0);
> -       osk5912_smc91x_resources[1].end =3D gpio_to_irq(0);
> -       osk5912_cf_resources[0].start =3D gpio_to_irq(62);
> -       osk5912_cf_resources[0].end =3D gpio_to_irq(62);
> +
> +       /*
> +        * Add the GPIOs to be used as IRQs and immediately look them up
> +        * to be passed as an IRQ resource. This is ugly but should work
> +        * until the day we convert to device tree.
> +        */
> +       gpiod_add_lookup_table(&osk_irq_gpio_table);
> +
> +       d =3D gpiod_get(NULL, "smc_irq", GPIOD_IN);
> +       if (IS_ERR(d))
> +               pr_err("Unable to get SMC IRQ GPIO descriptor\n");
> +       else
> +               osk5912_smc91x_resources[1] =3D DEFINE_RES_IRQ(gpiod_to_i=
rq(d));
> +
> +       d =3D gpiod_get(NULL, "cf_irq", GPIOD_IN);
> +       if (IS_ERR(d)) {
> +               pr_err("Unable to get CF IRQ GPIO descriptor\n");
> +       } else {
> +               /* the CF I/O IRQ is really active-low */
> +               irq_set_irq_type(gpiod_to_irq(d), IRQ_TYPE_EDGE_FALLING);
> +               osk5912_cf_resources[0] =3D DEFINE_RES_IRQ(gpiod_to_irq(d=
));
> +       }
> +
>         platform_add_devices(osk5912_devices, ARRAY_SIZE(osk5912_devices)=
);
>
>         l =3D omap_readl(USB_TRANSCEIVER_CTRL);
> @@ -372,13 +419,15 @@ static void __init osk_init(void)
>         gpiod_add_lookup_table(&osk_usb_gpio_table);
>         omap1_usb_init(&osk_usb_config);
>
> +       omap_serial_init();
> +
>         /* irq for tps65010 chip */
>         /* bootloader effectively does:  omap_cfg_reg(U19_1610_MPUIO1); *=
/
> -       if (gpio_request(OMAP_MPUIO(1), "tps65010") =3D=3D 0)
> -               gpio_direction_input(OMAP_MPUIO(1));
> -
> -       omap_serial_init();
> -       osk_i2c_board_info[0].irq =3D gpio_to_irq(OMAP_MPUIO(1));
> +       d =3D gpiod_get(NULL, "tps65010", GPIOD_IN);
> +       if (IS_ERR(d))
> +               pr_err("Unable to get TPS65010 IRQ GPIO descriptor\n");
> +       else
> +               osk_i2c_board_info[0].irq =3D gpiod_to_irq(d);
>         omap_register_i2c_bus(1, 400, osk_i2c_board_info,
>                               ARRAY_SIZE(osk_i2c_board_info));
>  }
> diff --git a/drivers/mfd/tps65010.c b/drivers/mfd/tps65010.c
> index fb733288cca3..faea4ff44c6f 100644
> --- a/drivers/mfd/tps65010.c
> +++ b/drivers/mfd/tps65010.c
> @@ -506,12 +506,8 @@ static void tps65010_remove(struct i2c_client *clien=
t)
>         struct tps65010         *tps =3D i2c_get_clientdata(client);
>         struct tps65010_board   *board =3D dev_get_platdata(&client->dev)=
;
>
> -       if (board && board->teardown) {
> -               int status =3D board->teardown(client, board->context);
> -               if (status < 0)
> -                       dev_dbg(&client->dev, "board %s %s err %d\n",
> -                               "teardown", client->name, status);
> -       }
> +       if (board && board->teardown)
> +               board->teardown(client, &tps->chip);
>         if (client->irq > 0)
>                 free_irq(client->irq, tps);
>         cancel_delayed_work_sync(&tps->work);
> @@ -619,7 +615,7 @@ static int tps65010_probe(struct i2c_client *client)
>                                 tps, DEBUG_FOPS);
>
>         /* optionally register GPIOs */
> -       if (board && board->base !=3D 0) {
> +       if (board) {
>                 tps->outmask =3D board->outmask;
>
>                 tps->chip.label =3D client->name;
> @@ -632,7 +628,7 @@ static int tps65010_probe(struct i2c_client *client)
>                 /* NOTE:  only partial support for inputs; nyet IRQs */
>                 tps->chip.get =3D tps65010_gpio_get;
>
> -               tps->chip.base =3D board->base;
> +               tps->chip.base =3D -1;
>                 tps->chip.ngpio =3D 7;
>                 tps->chip.can_sleep =3D 1;
>
> @@ -641,7 +637,7 @@ static int tps65010_probe(struct i2c_client *client)
>                         dev_err(&client->dev, "can't add gpiochip, err %d=
\n",
>                                         status);
>                 else if (board->setup) {
> -                       status =3D board->setup(client, board->context);
> +                       status =3D board->setup(client, &tps->chip);
>                         if (status < 0) {
>                                 dev_dbg(&client->dev,
>                                         "board %s %s err %d\n",
> diff --git a/include/linux/mfd/tps65010.h b/include/linux/mfd/tps65010.h
> index a1fb9bc5311d..5edf1aef1118 100644
> --- a/include/linux/mfd/tps65010.h
> +++ b/include/linux/mfd/tps65010.h
> @@ -28,6 +28,8 @@
>  #ifndef __LINUX_I2C_TPS65010_H
>  #define __LINUX_I2C_TPS65010_H
>
> +struct gpio_chip;
> +
>  /*
>   * ---------------------------------------------------------------------=
-------
>   * Registers, all 8 bits
> @@ -176,12 +178,10 @@ struct i2c_client;
>
>  /**
>   * struct tps65010_board - packages GPIO and LED lines
> - * @base: the GPIO number to assign to GPIO-1
>   * @outmask: bit (N-1) is set to allow GPIO-N to be used as an
>   *     (open drain) output
>   * @setup: optional callback issued once the GPIOs are valid
>   * @teardown: optional callback issued before the GPIOs are invalidated
> - * @context: optional parameter passed to setup() and teardown()
>   *
>   * Board data may be used to package the GPIO (and LED) lines for use
>   * in by the generic GPIO and LED frameworks.  The first four GPIOs
> @@ -193,12 +193,9 @@ struct i2c_client;
>   * devices in their initial states using these GPIOs.
>   */
>  struct tps65010_board {
> -       int                             base;
>         unsigned                        outmask;
> -
> -       int             (*setup)(struct i2c_client *client, void *context=
);
> -       int             (*teardown)(struct i2c_client *client, void *cont=
ext);
> -       void            *context;
> +       int             (*setup)(struct i2c_client *client, struct gpio_c=
hip *gc);
> +       void            (*teardown)(struct i2c_client *client, struct gpi=
o_chip *gc);
>  };
>
>  #endif /*  __LINUX_I2C_TPS65010_H */
> --
> 2.34.1
>


--=20
With Best Regards,
Andy Shevchenko
