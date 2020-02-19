Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B5F5163E1F
	for <lists+linux-omap@lfdr.de>; Wed, 19 Feb 2020 08:47:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726663AbgBSHrI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 19 Feb 2020 02:47:08 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:44503 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726664AbgBSHrH (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 19 Feb 2020 02:47:07 -0500
Received: by mail-wr1-f65.google.com with SMTP id m16so26919858wrx.11
        for <linux-omap@vger.kernel.org>; Tue, 18 Feb 2020 23:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=AySmLIYsWtvcCXv7Xaz2smxRH6W+EenMOBf4ub6ztI8=;
        b=bFDgLtwjoQzbwuSl939RWSiJCf7qXnTYi0J3TsRl8Q64qWqIHnEoozze0OGlBaNA2L
         Hu6Dn95vLs4YrPSQ6lOQNYtbM1BX35T9MTLO5pXucPrXZXcWrrD7n0SAV1YtSSk9VYI9
         ePCo9MiBVrSvPbduguSJ53jWbFRMPRzm+g45/otQwLKJEEN/saxUnsJ1ikdLtfedylQ/
         44gnnPDFBXiynrVqREHOMvmiULrL6/sjapj7Cfjp7JcZwBJP8KR4vW9tX1DCQvfDkNKl
         ODXTOPJNkFw1tBwNPTrlIgQa/DIGmjQOyc62TcRWi3ntmeAJGx0CTshyr5G3kiCrXdUN
         zeGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=AySmLIYsWtvcCXv7Xaz2smxRH6W+EenMOBf4ub6ztI8=;
        b=dnOXf8fZPy1mz6Ajxh2zZw+XIsBtS6yNW3TjUa0Rrj4ylHNUGa/rZZHp/Vy2b9RDRK
         ysbWXHa49cClIYfwGQaOBiGMsY7b3RvIbC6V6rTLUn2EUeO36esw4dONc4+3+8FUGfuX
         FGMRlz3QfTCbmuWtfa2nyZttOvqkJufyiM8giJbbYSmVNpDBBi88FSSSR+a2tin6vcoV
         8o+p//MC+ykgMZ7XCZRh7V5b3acZX8cDt3WIEoV8dsctN0BK7j8CInrCyZHn+i3Np6z3
         RhMVxCQrEaUm6DJKS9WstW0KdgcqeNjPnjtbv9NzCmzb1xq7FP3aM3vmCXbul+XYBurq
         jn2Q==
X-Gm-Message-State: APjAAAVFek1+ojsY2FbCYV4TsWJ2l/a2v4aQdwMg2FMZ83lhQmdmbKZ5
        bW2gQhoVJNhljShcwoW+lbfz2Q==
X-Google-Smtp-Source: APXvYqwvdTSZ5Bz88iJbsZk5BCT+ScNenQ+7sUrT8+MLVN9AbvV14Ny/r2PnMQPMXPlx4S9+Fkil8Q==
X-Received: by 2002:a5d:510f:: with SMTP id s15mr33886678wrt.408.1582098423177;
        Tue, 18 Feb 2020 23:47:03 -0800 (PST)
Received: from dell ([2.31.163.122])
        by smtp.gmail.com with ESMTPSA id h10sm1853680wml.18.2020.02.18.23.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2020 23:47:02 -0800 (PST)
Date:   Wed, 19 Feb 2020 07:47:30 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Tony Lindgren <tony@atomide.com>,
        kernel list <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-omap@vger.kernel.org, sre@kernel.org, nekit1000@gmail.com,
        mpartap@gmx.net, merlijn@wizzup.org, martin_rysavy@centrum.cz,
        agx@sigxcpu.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
        dri-devel@lists.freedesktop.org, tomi.valkeinen@ti.com,
        jjhiblot@ti.com
Subject: Re: LED backlight on Droid 4 and others
Message-ID: <20200219074730.GD3494@dell>
References: <20200105183202.GA17784@duo.ucw.cz>
 <20200106084549.GA14821@dell>
 <20200211172900.GH64767@atomide.com>
 <20200212201638.GB20085@amd>
 <20200218135219.GC3494@dell>
 <20200218141452.GF35972@atomide.com>
 <20200218231001.GA28817@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200218231001.GA28817@amd>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, 19 Feb 2020, Pavel Machek wrote:

> Hi!
> 
> > > > > > > It would be good to get LED backlight to work in clean way for 5.6
> > > > > > > kernel.
> > > > > ...
> > > > > > > [If you have an idea what else is needed, it would be welcome; it
> > > > > > > works for me in development tree but not in tree I'd like to
> > > > > > > upstream.]
> > > > > > > 
> > > > > > > Lee, would you be willing to take "backlight: add led-backlight
> > > > > > > driver"? Would it help if I got "leds: Add managed API to get a LED
> > > > > > > from a device driver" and "leds: Add of_led_get() and led_put()" into
> > > > > > > for_next tree of the LED subsystem?
> > > > > > 
> > > > > > It looks like you have an open question from Tony on v10.
> > > > > > 
> > > > > > Is that patch orthogonal, or are there depend{ants,encies}?
> > > > > 
> > > > > Uhh looks like we messed up a bit with integration. Now droid4
> > > > > LCD backlight can no longer be enabled at all manually in v5.6-rc1
> > > > > without the "add led-backlight driver" patch.. Should we just
> > > > > merge it to fix it rather than start scrambling with other
> > > > > temporary hacks?
> > > > 
> > > > We should just merge the "add led-backlight driver". Everything should
> > > > be ready for it. I'm sorry if I broke something working, I was not
> > > > aware it worked at all.
> > > > 
> > > > Unfortunately, this is backlight code, not LED, so I can't just merge it.
> > > 
> > > Please go ahead.  Apply my Acked-by and merge away ASAP.
> > > 
> > > Acked-by: Lee Jones <lee.jones@linaro.org>
> > 
> > OK best to merge the driver via the LED tree:
> > 
> > Acked-by: Tony Lindgren <tony@atomide.com>
> > Tested-by: Tony Lindgren <tony@atomide.com>
> 
> Is the patch below the one both of you are talking about?
> 
> Hmm. I should s/default-brightness-level/default-brightness/
> below.
> 
> Lee, I can of course take it (thanks), but won't Kconfig/Makefile
> pieces cause rejects? It might be still better if you took it. I can
> hand-edit it and submit it in form for easy application... tommorow.

My suggestion would be to send it to Linus ASAP.

Ideally it would get into the -rcs, as it 'fixes' things.

> Best regards,
> 
> 									Pavel
> 
> commit 81a2daadf8dd6c8e0cbc3b60246932436be3c714
> Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Date:   Thu Oct 3 10:28:12 2019 +0200
> 
>     backlight: add led-backlight driver
>     
>     This patch adds a led-backlight driver (led_bl), which is similar to
>     pwm_bl except the driver uses a LED class driver to adjust the
>     brightness in the HW. Multiple LEDs can be used for a single backlight.
>     
>     Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
>     Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
>     Acked-by: Pavel Machek <pavel@ucw.cz>
>     Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> 
> diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
> index 4c8f73394aac..93836ef872f5 100644
> --- a/drivers/video/backlight/Kconfig
> +++ b/drivers/video/backlight/Kconfig
> @@ -463,6 +463,13 @@ config BACKLIGHT_RAVE_SP
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
> index 961fb553b9c0..5e13242f31d6 100644
> --- a/drivers/video/backlight/Makefile
> +++ b/drivers/video/backlight/Makefile
> @@ -60,3 +60,4 @@ obj-$(CONFIG_BACKLIGHT_TPS65217)	+= tps65217_bl.o
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
> 



-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
