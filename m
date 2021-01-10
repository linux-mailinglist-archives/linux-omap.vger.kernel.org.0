Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C81332F086B
	for <lists+linux-omap@lfdr.de>; Sun, 10 Jan 2021 17:38:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726321AbhAJQhi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 10 Jan 2021 11:37:38 -0500
Received: from muru.com ([72.249.23.125]:42210 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726069AbhAJQhi (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 10 Jan 2021 11:37:38 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id D126380E4;
        Sun, 10 Jan 2021 16:36:54 +0000 (UTC)
Date:   Sun, 10 Jan 2021 18:36:51 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Arthur Demchenkov <spinal.by@gmail.com>,
        Carl Philipp Klemm <philipp@uvos.xyz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>, ruleh <ruleh@gmx.de>,
        Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH 4/4] Input: omap4-keypad - simplify probe with devm
Message-ID: <X/stIwdpy0OuPEs9@atomide.com>
References: <20210106125822.31315-1-tony@atomide.com>
 <20210106125822.31315-5-tony@atomide.com>
 <X/qfJKiM21uyksYl@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X/qfJKiM21uyksYl@google.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Dmitry Torokhov <dmitry.torokhov@gmail.com> [210110 06:31]:
> I do not quite like that we need to keep this in remove(). I had the
> patch below for quite some time, could you please try it?

Yes seems to work nice :)

> Input: omap4-keypad - switch to use managed resources
> 
> From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 
> Now that input core supports devres-managed input devices we can clean
> up this driver a bit.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Tested-by: Tony Lindgren <tony@atomide.com>


> ---
>  drivers/input/keyboard/omap4-keypad.c |  139 +++++++++++++--------------------
>  1 file changed, 55 insertions(+), 84 deletions(-)
> 
> diff --git a/drivers/input/keyboard/omap4-keypad.c b/drivers/input/keyboard/omap4-keypad.c
> index b17ac2a295b9..d36774a55a10 100644
> --- a/drivers/input/keyboard/omap4-keypad.c
> +++ b/drivers/input/keyboard/omap4-keypad.c
> @@ -252,8 +252,14 @@ static int omap4_keypad_check_revision(struct device *dev,
>  	return 0;
>  }
>  
> +static void omap4_disable_pm(void *d)
> +{
> +	pm_runtime_disable(d);
> +}
> +
>  static int omap4_keypad_probe(struct platform_device *pdev)
>  {
> +	struct device *dev = &pdev->dev;
>  	struct omap4_keypad *keypad_data;
>  	struct input_dev *input_dev;
>  	struct resource *res;
> @@ -271,33 +277,30 @@ static int omap4_keypad_probe(struct platform_device *pdev)
>  	if (irq < 0)
>  		return irq;
>  
> -	keypad_data = kzalloc(sizeof(struct omap4_keypad), GFP_KERNEL);
> +	keypad_data = devm_kzalloc(dev, sizeof(struct omap4_keypad),
> +				   GFP_KERNEL);
>  	if (!keypad_data) {
> -		dev_err(&pdev->dev, "keypad_data memory allocation failed\n");
> +		dev_err(dev, "keypad_data memory allocation failed\n");
>  		return -ENOMEM;
>  	}
>  
>  	keypad_data->irq = irq;
>  
> -	error = omap4_keypad_parse_dt(&pdev->dev, keypad_data);
> +	error = omap4_keypad_parse_dt(dev, keypad_data);
>  	if (error)
> -		goto err_free_keypad;
> +		return error;
>  
> -	res = request_mem_region(res->start, resource_size(res), pdev->name);
> -	if (!res) {
> -		dev_err(&pdev->dev, "can't request mem region\n");
> -		error = -EBUSY;
> -		goto err_free_keypad;
> -	}
> +	keypad_data->base = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(keypad_data->base))
> +		return PTR_ERR(keypad_data->base);
>  
> -	keypad_data->base = ioremap(res->start, resource_size(res));
> -	if (!keypad_data->base) {
> -		dev_err(&pdev->dev, "can't ioremap mem resource\n");
> -		error = -ENOMEM;
> -		goto err_release_mem;
> -	}
> +	pm_runtime_enable(dev);
>  
> -	pm_runtime_enable(&pdev->dev);
> +	error = devm_add_action_or_reset(dev, omap4_disable_pm, dev);
> +	if (error) {
> +		dev_err(dev, "unable to register cleanup action\n");
> +		return error;
> +	}
>  
>  	/*
>  	 * Enable clocks for the keypad module so that we can read
> @@ -307,27 +310,26 @@ static int omap4_keypad_probe(struct platform_device *pdev)
>  	if (error) {
>  		dev_err(&pdev->dev, "pm_runtime_get_sync() failed\n");
>  		pm_runtime_put_noidle(&pdev->dev);
> -	} else {
> -		error = omap4_keypad_check_revision(&pdev->dev,
> -						    keypad_data);
> -		if (!error) {
> -			/* Ensure device does not raise interrupts */
> -			omap4_keypad_stop(keypad_data);
> -		}
> -		pm_runtime_put_sync(&pdev->dev);
> +		return error;
> +	}
> +
> +	error = omap4_keypad_check_revision(&pdev->dev,
> +					    keypad_data);
> +	if (!error) {
> +		/* Ensure device does not raise interrupts */
> +		omap4_keypad_stop(keypad_data);
>  	}
> +
> +	pm_runtime_put_sync(&pdev->dev);
>  	if (error)
> -		goto err_pm_disable;
> +		return error;
>  
>  	/* input device allocation */
> -	keypad_data->input = input_dev = input_allocate_device();
> -	if (!input_dev) {
> -		error = -ENOMEM;
> -		goto err_pm_disable;
> -	}
> +	keypad_data->input = input_dev = devm_input_allocate_device(dev);
> +	if (!input_dev)
> +		return -ENOMEM;
>  
>  	input_dev->name = pdev->name;
> -	input_dev->dev.parent = &pdev->dev;
>  	input_dev->id.bustype = BUS_HOST;
>  	input_dev->id.vendor = 0x0001;
>  	input_dev->id.product = 0x0001;
> @@ -344,84 +346,53 @@ static int omap4_keypad_probe(struct platform_device *pdev)
>  
>  	keypad_data->row_shift = get_count_order(keypad_data->cols);
>  	max_keys = keypad_data->rows << keypad_data->row_shift;
> -	keypad_data->keymap = kcalloc(max_keys,
> -				      sizeof(keypad_data->keymap[0]),
> -				      GFP_KERNEL);
> +	keypad_data->keymap = devm_kcalloc(dev,
> +					   max_keys,
> +					   sizeof(keypad_data->keymap[0]),
> +					   GFP_KERNEL);
>  	if (!keypad_data->keymap) {
> -		dev_err(&pdev->dev, "Not enough memory for keymap\n");
> -		error = -ENOMEM;
> -		goto err_free_input;
> +		dev_err(dev, "Not enough memory for keymap\n");
> +		return -ENOMEM;
>  	}
>  
>  	error = matrix_keypad_build_keymap(NULL, NULL,
>  					   keypad_data->rows, keypad_data->cols,
>  					   keypad_data->keymap, input_dev);
>  	if (error) {
> -		dev_err(&pdev->dev, "failed to build keymap\n");
> -		goto err_free_keymap;
> +		dev_err(dev, "failed to build keymap\n");
> +		return error;
>  	}
>  
> -	error = request_threaded_irq(keypad_data->irq, omap4_keypad_irq_handler,
> -				     omap4_keypad_irq_thread_fn, IRQF_ONESHOT,
> -				     "omap4-keypad", keypad_data);
> +	error = devm_request_threaded_irq(dev, keypad_data->irq,
> +					  omap4_keypad_irq_handler,
> +					  omap4_keypad_irq_thread_fn,
> +					  IRQF_ONESHOT,
> +					  "omap4-keypad", keypad_data);
>  	if (error) {
> -		dev_err(&pdev->dev, "failed to register interrupt\n");
> -		goto err_free_keymap;
> +		dev_err(dev, "failed to register interrupt\n");
> +		return error;
>  	}
>  
>  	error = input_register_device(keypad_data->input);
> -	if (error < 0) {
> -		dev_err(&pdev->dev, "failed to register input device\n");
> -		goto err_free_irq;
> +	if (error) {
> +		dev_err(dev, "failed to register input device\n");
> +		return error;
>  	}
>  
> -	device_init_wakeup(&pdev->dev, true);
> -	error = dev_pm_set_wake_irq(&pdev->dev, keypad_data->irq);
> +	device_init_wakeup(dev, true);
> +	error = dev_pm_set_wake_irq(dev, keypad_data->irq);
>  	if (error)
> -		dev_warn(&pdev->dev,
> -			 "failed to set up wakeup irq: %d\n", error);
> +		dev_warn(dev, "failed to set up wakeup irq: %d\n", error);
>  
>  	platform_set_drvdata(pdev, keypad_data);
>  
>  	return 0;
> -
> -err_free_irq:
> -	free_irq(keypad_data->irq, keypad_data);
> -err_free_keymap:
> -	kfree(keypad_data->keymap);
> -err_free_input:
> -	input_free_device(input_dev);
> -err_pm_disable:
> -	pm_runtime_disable(&pdev->dev);
> -	iounmap(keypad_data->base);
> -err_release_mem:
> -	release_mem_region(res->start, resource_size(res));
> -err_free_keypad:
> -	kfree(keypad_data);
> -	return error;
>  }
>  
>  static int omap4_keypad_remove(struct platform_device *pdev)
>  {
> -	struct omap4_keypad *keypad_data = platform_get_drvdata(pdev);
> -	struct resource *res;
> -
>  	dev_pm_clear_wake_irq(&pdev->dev);
>  
> -	free_irq(keypad_data->irq, keypad_data);
> -
> -	pm_runtime_disable(&pdev->dev);
> -
> -	input_unregister_device(keypad_data->input);
> -
> -	iounmap(keypad_data->base);
> -
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	release_mem_region(res->start, resource_size(res));
> -
> -	kfree(keypad_data->keymap);
> -	kfree(keypad_data);
> -
>  	return 0;
>  }
>  
