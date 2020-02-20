Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5CB3165930
	for <lists+linux-omap@lfdr.de>; Thu, 20 Feb 2020 09:30:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726764AbgBTIaC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 20 Feb 2020 03:30:02 -0500
Received: from honk.sigxcpu.org ([24.134.29.49]:46392 "EHLO honk.sigxcpu.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726679AbgBTIaC (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 20 Feb 2020 03:30:02 -0500
Received: from localhost (localhost [127.0.0.1])
        by honk.sigxcpu.org (Postfix) with ESMTP id C8BE0FB03;
        Thu, 20 Feb 2020 09:29:59 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
        by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id zMjbSs77NzEe; Thu, 20 Feb 2020 09:29:57 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
        id 7B4B5405C2; Thu, 20 Feb 2020 09:29:56 +0100 (CET)
Date:   Thu, 20 Feb 2020 09:29:56 +0100
From:   Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Tony Lindgren <tony@atomide.com>, Lee Jones <lee.jones@linaro.org>,
        kernel list <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-omap@vger.kernel.org, sre@kernel.org, nekit1000@gmail.com,
        mpartap@gmx.net, merlijn@wizzup.org, martin_rysavy@centrum.cz,
        daniel.thompson@linaro.org, jingoohan1@gmail.com,
        dri-devel@lists.freedesktop.org, tomi.valkeinen@ti.com,
        jjhiblot@ti.com
Subject: Re: [PATCH] backlight: add led-backlight driver
Message-ID: <20200220082956.GA3383@bogon.m.sigxcpu.org>
References: <20200219191412.GA15905@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200219191412.GA15905@amd>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,
On Wed, Feb 19, 2020 at 08:14:12PM +0100, Pavel Machek wrote:
> From: Tomi Valkeinen <tomi.valkeinen@ti.com>
> 
> This patch adds a led-backlight driver (led_bl), which is similar to
> pwm_bl except the driver uses a LED class driver to adjust the
> brightness in the HW. Multiple LEDs can be used for a single backlight.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
> Acked-by: Pavel Machek <pavel@ucw.cz>
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> Acked-by: Lee Jones <lee.jones@linaro.org>
> Acked-by: Tony Lindgren <tony@atomide.com>
> Tested-by: Tony Lindgren <tony@atomide.com>
> Signed-off-by: Pavel Machek <pavel@ucw.cz>

Tested-by: Guido Günther <agx@sigxcpu.org>

Cheers,
 -- Guido

> ---
>  drivers/video/backlight/Kconfig  |   7 ++
>  drivers/video/backlight/Makefile |   1 +
>  drivers/video/backlight/led_bl.c | 260 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 268 insertions(+)
>  create mode 100644 drivers/video/backlight/led_bl.c
> 
> Hi!
> 
> Here's the version of the driver I have. AFAICT
> default-brightness-level handling is ok, so does not need to be
> changed.
> 
> Lee, it would be easiest for me if you could apply it to your tree and
> push, but given enough time I can push it to Linus, too.
> 
> Thanks,
> 								Pavel
> 
> diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
> index 403707a3e503..0093bbd0d326 100644
> --- a/drivers/video/backlight/Kconfig
> +++ b/drivers/video/backlight/Kconfig
> @@ -456,6 +456,13 @@ config BACKLIGHT_RAVE_SP
>  	help
>  	  Support for backlight control on RAVE SP device.
>  
> +config BACKLIGHT_LED
> +	tristate "Generic LED based Backlight Driver"
> +	depends on LEDS_CLASS && OF
> +	help
> +	  If you have a LCD backlight adjustable by LED class driver, say Y
> +	  to enable this driver.
> +
>  endif # BACKLIGHT_CLASS_DEVICE
>  
>  endmenu
> diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
> index 6f8777037c37..0c1a1524627a 100644
> --- a/drivers/video/backlight/Makefile
> +++ b/drivers/video/backlight/Makefile
> @@ -57,3 +57,4 @@ obj-$(CONFIG_BACKLIGHT_TPS65217)	+= tps65217_bl.o
>  obj-$(CONFIG_BACKLIGHT_WM831X)		+= wm831x_bl.o
>  obj-$(CONFIG_BACKLIGHT_ARCXCNN) 	+= arcxcnn_bl.o
>  obj-$(CONFIG_BACKLIGHT_RAVE_SP)		+= rave-sp-backlight.o
> +obj-$(CONFIG_BACKLIGHT_LED)		+= led_bl.o
> diff --git a/drivers/video/backlight/led_bl.c b/drivers/video/backlight/led_bl.c
> new file mode 100644
> index 000000000000..3f66549997c8
> --- /dev/null
> +++ b/drivers/video/backlight/led_bl.c
> @@ -0,0 +1,260 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2015-2019 Texas Instruments Incorporated -  http://www.ti.com/
> + * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
> + *
> + * Based on pwm_bl.c
> + */
> +
> +#include <linux/backlight.h>
> +#include <linux/leds.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +
> +struct led_bl_data {
> +	struct device		*dev;
> +	struct backlight_device	*bl_dev;
> +	struct led_classdev	**leds;
> +	bool			enabled;
> +	int			nb_leds;
> +	unsigned int		*levels;
> +	unsigned int		default_brightness;
> +	unsigned int		max_brightness;
> +};
> +
> +static void led_bl_set_brightness(struct led_bl_data *priv, int level)
> +{
> +	int i;
> +	int bkl_brightness;
> +
> +	if (priv->levels)
> +		bkl_brightness = priv->levels[level];
> +	else
> +		bkl_brightness = level;
> +
> +	for (i = 0; i < priv->nb_leds; i++)
> +		led_set_brightness(priv->leds[i], bkl_brightness);
> +
> +	priv->enabled = true;
> +}
> +
> +static void led_bl_power_off(struct led_bl_data *priv)
> +{
> +	int i;
> +
> +	if (!priv->enabled)
> +		return;
> +
> +	for (i = 0; i < priv->nb_leds; i++)
> +		led_set_brightness(priv->leds[i], LED_OFF);
> +
> +	priv->enabled = false;
> +}
> +
> +static int led_bl_update_status(struct backlight_device *bl)
> +{
> +	struct led_bl_data *priv = bl_get_data(bl);
> +	int brightness = bl->props.brightness;
> +
> +	if (bl->props.power != FB_BLANK_UNBLANK ||
> +	    bl->props.fb_blank != FB_BLANK_UNBLANK ||
> +	    bl->props.state & BL_CORE_FBBLANK)
> +		brightness = 0;
> +
> +	if (brightness > 0)
> +		led_bl_set_brightness(priv, brightness);
> +	else
> +		led_bl_power_off(priv);
> +
> +	return 0;
> +}
> +
> +static const struct backlight_ops led_bl_ops = {
> +	.update_status	= led_bl_update_status,
> +};
> +
> +static int led_bl_get_leds(struct device *dev,
> +			   struct led_bl_data *priv)
> +{
> +	int i, nb_leds, ret;
> +	struct device_node *node = dev->of_node;
> +	struct led_classdev **leds;
> +	unsigned int max_brightness;
> +	unsigned int default_brightness;
> +
> +	ret = of_count_phandle_with_args(node, "leds", NULL);
> +	if (ret < 0) {
> +		dev_err(dev, "Unable to get led count\n");
> +		return -EINVAL;
> +	}
> +
> +	nb_leds = ret;
> +	if (nb_leds < 1) {
> +		dev_err(dev, "At least one LED must be specified!\n");
> +		return -EINVAL;
> +	}
> +
> +	leds = devm_kzalloc(dev, sizeof(struct led_classdev *) * nb_leds,
> +			    GFP_KERNEL);
> +	if (!leds)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < nb_leds; i++) {
> +		leds[i] = devm_of_led_get(dev, i);
> +		if (IS_ERR(leds[i]))
> +			return PTR_ERR(leds[i]);
> +	}
> +
> +	/* check that the LEDs all have the same brightness range */
> +	max_brightness = leds[0]->max_brightness;
> +	for (i = 1; i < nb_leds; i++) {
> +		if (max_brightness != leds[i]->max_brightness) {
> +			dev_err(dev, "LEDs must have identical ranges\n");
> +			return -EINVAL;
> +		}
> +	}
> +
> +	/* get the default brightness from the first LED from the list */
> +	default_brightness = leds[0]->brightness;
> +
> +	priv->nb_leds = nb_leds;
> +	priv->leds = leds;
> +	priv->max_brightness = max_brightness;
> +	priv->default_brightness = default_brightness;
> +
> +	return 0;
> +}
> +
> +static int led_bl_parse_levels(struct device *dev,
> +			   struct led_bl_data *priv)
> +{
> +	struct device_node *node = dev->of_node;
> +	int num_levels;
> +	u32 value;
> +	int ret;
> +
> +	if (!node)
> +		return -ENODEV;
> +
> +	num_levels = of_property_count_u32_elems(node, "brightness-levels");
> +	if (num_levels > 1) {
> +		int i;
> +		unsigned int db;
> +		u32 *levels = NULL;
> +
> +		levels = devm_kzalloc(dev, sizeof(u32) * num_levels,
> +				      GFP_KERNEL);
> +		if (!levels)
> +			return -ENOMEM;
> +
> +		ret = of_property_read_u32_array(node, "brightness-levels",
> +						levels,
> +						num_levels);
> +		if (ret < 0)
> +			return ret;
> +
> +		/*
> +		 * Try to map actual LED brightness to backlight brightness
> +		 * level
> +		 */
> +		db = priv->default_brightness;
> +		for (i = 0 ; i < num_levels; i++) {
> +			if ((i && db > levels[i-1]) && db <= levels[i])
> +				break;
> +		}
> +		priv->default_brightness = i;
> +		priv->max_brightness = num_levels - 1;
> +		priv->levels = levels;
> +	} else if (num_levels >= 0)
> +		dev_warn(dev, "Not enough levels defined\n");
> +
> +	ret = of_property_read_u32(node, "default-brightness-level", &value);
> +	if (!ret && value <= priv->max_brightness)
> +		priv->default_brightness = value;
> +	else if (!ret  && value > priv->max_brightness)
> +		dev_warn(dev, "Invalid default brightness. Ignoring it\n");
> +
> +	return 0;
> +}
> +
> +static int led_bl_probe(struct platform_device *pdev)
> +{
> +	struct backlight_properties props;
> +	struct led_bl_data *priv;
> +	int ret, i;
> +
> +	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, priv);
> +
> +	priv->dev = &pdev->dev;
> +
> +	ret = led_bl_get_leds(&pdev->dev, priv);
> +	if (ret)
> +		return ret;
> +
> +	ret = led_bl_parse_levels(&pdev->dev, priv);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "Failed to parse DT data\n");
> +		return ret;
> +	}
> +
> +	memset(&props, 0, sizeof(struct backlight_properties));
> +	props.type = BACKLIGHT_RAW;
> +	props.max_brightness = priv->max_brightness;
> +	props.brightness = priv->default_brightness;
> +	props.power = (priv->default_brightness > 0) ? FB_BLANK_POWERDOWN :
> +		      FB_BLANK_UNBLANK;
> +	priv->bl_dev = backlight_device_register(dev_name(&pdev->dev),
> +			&pdev->dev, priv, &led_bl_ops, &props);
> +	if (IS_ERR(priv->bl_dev)) {
> +		dev_err(&pdev->dev, "Failed to register backlight\n");
> +		return PTR_ERR(priv->bl_dev);
> +	}
> +
> +	for (i = 0; i < priv->nb_leds; i++)
> +		led_sysfs_disable(priv->leds[i]);
> +
> +	backlight_update_status(priv->bl_dev);
> +
> +	return 0;
> +}
> +
> +static int led_bl_remove(struct platform_device *pdev)
> +{
> +	struct led_bl_data *priv = platform_get_drvdata(pdev);
> +	struct backlight_device *bl = priv->bl_dev;
> +	int i;
> +
> +	backlight_device_unregister(bl);
> +
> +	led_bl_power_off(priv);
> +	for (i = 0; i < priv->nb_leds; i++)
> +		led_sysfs_enable(priv->leds[i]);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id led_bl_of_match[] = {
> +	{ .compatible = "led-backlight" },
> +	{ }
> +};
> +
> +MODULE_DEVICE_TABLE(of, led_bl_of_match);
> +
> +static struct platform_driver led_bl_driver = {
> +	.driver		= {
> +		.name		= "led-backlight",
> +		.of_match_table	= of_match_ptr(led_bl_of_match),
> +	},
> +	.probe		= led_bl_probe,
> +	.remove		= led_bl_remove,
> +};
> +
> +module_platform_driver(led_bl_driver);
> +
> +MODULE_DESCRIPTION("LED based Backlight Driver");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:led-backlight");
> -- 
> 2.11.0


