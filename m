Return-Path: <linux-omap+bounces-5036-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CC81EC85126
	for <lists+linux-omap@lfdr.de>; Tue, 25 Nov 2025 14:02:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7105B4E9F6A
	for <lists+linux-omap@lfdr.de>; Tue, 25 Nov 2025 13:01:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2406322C97;
	Tue, 25 Nov 2025 13:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="F6p8XvBr"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B6D26FA60;
	Tue, 25 Nov 2025 13:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764075700; cv=none; b=XUkmLy+ibCKj62aXvoOJ1DbFRy8WBQpN+QWA5k77svsW/sJRlEWmydPNu89by0u1rkZ6RR4Pg7IKLkVJDeGQftq3FO1wKQRUhxr1jEWyPmsefSBqC+bwy9GM8THlmpn4xAAJo2H89lIGP31KMuvcetNFnfOM42aXRRRo7lUcYos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764075700; c=relaxed/simple;
	bh=G3HKP2Zge3E04Zuo/rdw+5DkrcltqprZ6AwejN+xf64=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lIs3hNUFMaDgchFpttX6EYu3EC4pq0JA0T8hf4B89eVbPgmKDb7S42gA8eCuamrJxSchjdF5VJe6j73FJxkj5wNL8BbCrE724z7TpvzgQ+9W+B7ImU84V0jYSWgM+uLl0lpVzWNPITfCMRkKNEgmkfcYb89Y2AA6m5s/uWuOxBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=F6p8XvBr; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=KUfiFQr68Z61wWlRME4ocmNHWi+DLLp14q9sof5MrSs=; b=F6p8XvBroB9fXs8P9Pz27l+roz
	CzY7igoP4TRO/BGIjBdoufNjMoKkLhDhISTWaoo55UKoUXFFj7hjlt4Y68egUdHGXD88dCocXD4re
	M0J0nRQ6nP2F73Qa4alj20/CwDv7o3kDIBFJiiCDoOMGE1xhNqLFE4HLO42/w0PnWXtmtV9Np5Wn/
	ou/yFyBx4lJXtQEFB2fdktRGvuw5Z1QMFMSSsMCbjpjpqo8RG6wgX969mr5u7t4TXBb5xPcJOo4Ch
	WAzB1V4+WDS5GFcyKCP2W1CBoxxk3ucij+uCfdMEzbDDTVj+6kauw/DRT9rdObnPSOKurVOT2FFH9
	1EWwFYZg==;
Date: Tue, 25 Nov 2025 14:01:26 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: akemnade@kernel.org
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Dmitry
 Torokhov <dmitry.torokhov@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Kevin Hilman <khilman@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
 linux-omap@vger.kernel.org
Subject: Re: [PATCH v4 2/3] Input: twl4030 - add TWL603x power button
Message-ID: <20251125140126.3752c075@kemnade.info>
In-Reply-To: <20251106-twl6030-button-v4-2-fdf1aa6e1e9a@kernel.org>
References: <20251106-twl6030-button-v4-0-fdf1aa6e1e9a@kernel.org>
	<20251106-twl6030-button-v4-2-fdf1aa6e1e9a@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 06 Nov 2025 10:00:26 +0100
akemnade@kernel.org wrote:

> From: Andreas Kemnade <andreas@kemnade.info>
> 
> Like the TWL4030, these PMICs also have a power button feature, so extend
> the TWL4030 power button driver. As the irqchip of the TWL6030 mfd driver
> does not provide mask, unmask finctions, do it manually.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
a friendly ping
anything still to do here?

Regards,
Andreas
>  drivers/input/misc/twl4030-pwrbutton.c | 58 +++++++++++++++++++++++++++++++---
>  1 file changed, 54 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/input/misc/twl4030-pwrbutton.c b/drivers/input/misc/twl4030-pwrbutton.c
> index f85cc289c053..8673b1b441bf 100644
> --- a/drivers/input/misc/twl4030-pwrbutton.c
> +++ b/drivers/input/misc/twl4030-pwrbutton.c
> @@ -20,6 +20,7 @@
>   * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
>   */
>  
> +#include <linux/bits.h>
>  #include <linux/module.h>
>  #include <linux/init.h>
>  #include <linux/kernel.h>
> @@ -30,17 +31,31 @@
>  #include <linux/platform_device.h>
>  #include <linux/mfd/twl.h>
>  
> -#define PWR_PWRON_IRQ (1 << 0)
> +#define PWR_PWRON_IRQ BIT(0)
>  
> -#define STS_HW_CONDITIONS 0xf
> +struct twl_pwrbutton_chipdata {
> +	u8 status_reg;
> +	bool need_manual_irq;
> +};
> +
> +static const struct twl_pwrbutton_chipdata twl4030_chipdata = {
> +	.status_reg = 0xf,
> +	.need_manual_irq = false,
> +};
> +
> +static const struct twl_pwrbutton_chipdata twl6030_chipdata = {
> +	.status_reg = 0x2,
> +	.need_manual_irq = true,
> +};
>  
>  static irqreturn_t powerbutton_irq(int irq, void *_pwr)
>  {
>  	struct input_dev *pwr = _pwr;
> +	const struct twl_pwrbutton_chipdata *pdata = dev_get_drvdata(pwr->dev.parent);
>  	int err;
>  	u8 value;
>  
> -	err = twl_i2c_read_u8(TWL_MODULE_PM_MASTER, &value, STS_HW_CONDITIONS);
> +	err = twl_i2c_read_u8(TWL_MODULE_PM_MASTER, &value, pdata->status_reg);
>  	if (!err)  {
>  		pm_wakeup_event(pwr->dev.parent, 0);
>  		input_report_key(pwr, KEY_POWER, value & PWR_PWRON_IRQ);
> @@ -55,10 +70,17 @@ static irqreturn_t powerbutton_irq(int irq, void *_pwr)
>  
>  static int twl4030_pwrbutton_probe(struct platform_device *pdev)
>  {
> +	const struct twl_pwrbutton_chipdata *pdata;
>  	struct input_dev *pwr;
>  	int irq = platform_get_irq(pdev, 0);
>  	int err;
>  
> +	pdata = device_get_match_data(&pdev->dev);
> +	if (!pdata)
> +		return -EINVAL;
> +
> +	platform_set_drvdata(pdev, (void *)pdata);
> +
>  	pwr = devm_input_allocate_device(&pdev->dev);
>  	if (!pwr) {
>  		dev_err(&pdev->dev, "Can't allocate power button\n");
> @@ -85,14 +107,41 @@ static int twl4030_pwrbutton_probe(struct platform_device *pdev)
>  		return err;
>  	}
>  
> +	if (pdata->need_manual_irq) {
> +		err = twl6030_interrupt_unmask(0x01, REG_INT_MSK_LINE_A);
> +		if (err < 0)
> +			return err;
> +
> +		err = twl6030_interrupt_unmask(0x01, REG_INT_MSK_STS_A);
> +		if (err < 0)
> +			return err;
> +	}
> +
>  	device_init_wakeup(&pdev->dev, true);
>  
>  	return 0;
>  }
>  
> +static void twl4030_pwrbutton_remove(struct platform_device *pdev)
> +{
> +	const struct twl_pwrbutton_chipdata *pdata = platform_get_drvdata(pdev);
> +
> +	if (pdata->need_manual_irq) {
> +		twl6030_interrupt_mask(0x01, REG_INT_MSK_LINE_A);
> +		twl6030_interrupt_mask(0x01, REG_INT_MSK_STS_A);
> +	}
> +}
> +
>  #ifdef CONFIG_OF
>  static const struct of_device_id twl4030_pwrbutton_dt_match_table[] = {
> -       { .compatible = "ti,twl4030-pwrbutton" },
> +	{
> +		.compatible = "ti,twl4030-pwrbutton",
> +		.data = &twl4030_chipdata,
> +	},
> +	{
> +		.compatible = "ti,twl6030-pwrbutton",
> +		.data = &twl6030_chipdata,
> +	},
>         {},
>  };
>  MODULE_DEVICE_TABLE(of, twl4030_pwrbutton_dt_match_table);
> @@ -100,6 +149,7 @@ MODULE_DEVICE_TABLE(of, twl4030_pwrbutton_dt_match_table);
>  
>  static struct platform_driver twl4030_pwrbutton_driver = {
>  	.probe		= twl4030_pwrbutton_probe,
> +	.remove		= twl4030_pwrbutton_remove,
>  	.driver		= {
>  		.name	= "twl4030_pwrbutton",
>  		.of_match_table = of_match_ptr(twl4030_pwrbutton_dt_match_table),
> 


