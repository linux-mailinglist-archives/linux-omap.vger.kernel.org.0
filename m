Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E64194811BA
	for <lists+linux-omap@lfdr.de>; Wed, 29 Dec 2021 11:41:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235575AbhL2KlR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 29 Dec 2021 05:41:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235553AbhL2KlQ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 29 Dec 2021 05:41:16 -0500
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B256C061574
        for <linux-omap@vger.kernel.org>; Wed, 29 Dec 2021 02:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=PxAGsnf7ifUyNU+nGUfIxCWXrWF0nmnmpN2m1eGKYS0=; b=i7/5+8UdeOxyvlmgCNmvXcllV1
        HnOUEtKms3fBYd89N17FAwaLzLqImrAjFmlFEKIhpiAJ8aUqbI90994sFKqjA094DeMn3Eahfj073
        BQqzLz9xNrtDDSgWcKFZMzCogqTCuvqTC7aXzCX+jRQrlsvRK9CdghrlmGEMTu25QKsI=;
Received: from p200300ccff0806001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff08:600:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1n2WOF-0001Hl-Ha; Wed, 29 Dec 2021 11:41:03 +0100
Date:   Wed, 29 Dec 2021 11:41:02 +0100
From:   Andreas Kemnade <andreas@kemnade.info>
To:     Carl Philipp Klemm <philipp@uvos.xyz>
Cc:     sre@kernel.org, tony@atomide.com, merlijn@wizzup.org,
        linux-omap@vger.kernel.org
Subject: Re: [RFC PATCH] power: supply: cpcap-charger ramp up charge current
 slowly
Message-ID: <20211229114102.186d997f@aktux>
In-Reply-To: <20211228190029.5a58776acce1352e4aac3e9c@uvos.xyz>
References: <20211228190029.5a58776acce1352e4aac3e9c@uvos.xyz>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Score: -1.0 (-)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On Tue, 28 Dec 2021 19:00:29 +0100
Carl Philipp Klemm <philipp@uvos.xyz> wrote:

> Even after "power: supply: cpcap-charger: Add usleep to cpcap charger
> to avoid usb plug bounce" several usb host port and cable combinations,
> especially when combined with usb hubs can cause cpcap-charger to fail
> to activate charging even when vbus is seemingly fine. Using a scope
> this has been tracked down to vbus still dropping quite considerably
> (around 1.5V) for severl us when charging is enabled in these
> problematic port-hub-cable combinations. this is probubly due to line
> inductivity.
> 
> To avoid this, after this patch, cpcap-charger will ramp up charge
> current slowly until it hits set current. This makes vbus mutch
> cleaner on the scope and avoids the problem of charging being disabled
> due to under-voltage. As this ramping causes innate delay the dealy
> previously added to combat the related but independent problem of the
> usb plug pins bouncing has been made obsolete.
> 
this problem sounds familiar to me. I had a long battle with the
twl4030 charger in the GTA04. So the problem is that whenever vbus
drops below a certain line, charging is stopped. and not restarted when
vbus rises again?
The twl4030 charger driver has the logic to rise the current until
vbus drops below a certain limit (the limit mentioned above + some
safety margin).
That solves problems related to weak supply not providing the requested
current without too much voltage drop for whatever reason. 

It does not solve every problem. Voltage might drop too much if you move
cables around and charging stop, and you wonder why your phone battery
get drained.

I have also some solar cell with a usb cable without battery buffer.
That is also an interesting problem.
Similar situation if you just use a voltage converter at a bicycle hub
dynamo to charge your mobile device.


For that the following patch went in:
commit 7f4a633d21331155ee06c5ee44749ed35a3a3cc5
Author: NeilBrown <neil@brown.name>
Date:   Thu Jul 30 10:11:24 2015 +1000

    twl4030_charger: add software controlled linear charging mode.

Charging path is not disabled because of vbus drops then, but also not
when current drops below a limit, so you should not have the device in
that mode for days.

What I am now thinking: What about a functionality in power supply core
(enabled by drivers requring that) to try to rise current/start charging
periodically when vbus is there but current is below set limit? 

Regards,
Andreas


> Signed-off-by: Carl Philipp Klemm <philipp@uvos.xyz>
> ---
>  drivers/power/supply/cpcap-charger.c | 85 +++++++++++++++++++++-------
>  1 file changed, 65 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/power/supply/cpcap-charger.c b/drivers/power/supply/cpcap-charger.c
> index 60e0ce105a29..1ae252d84685 100644
> --- a/drivers/power/supply/cpcap-charger.c
> +++ b/drivers/power/supply/cpcap-charger.c
> @@ -22,6 +22,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/power_supply.h>
>  #include <linux/regmap.h>
> +#include <linux/sched.h>
>  
>  #include <linux/gpio/consumer.h>
>  #include <linux/usb/phy_companion.h>
> @@ -128,6 +129,7 @@ struct cpcap_charger_ddata {
>  	struct list_head irq_list;
>  	struct delayed_work detect_work;
>  	struct delayed_work vbus_work;
> +	struct delayed_work ramp_work;
>  	struct gpio_desc *gpio[2];		/* gpio_reven0 & 1 */
>  
>  	struct iio_channel *channels[CPCAP_CHARGER_IIO_NR];
> @@ -142,6 +144,7 @@ struct cpcap_charger_ddata {
>  	int status;
>  	int voltage;
>  	int limit_current;
> +	int set_current;
>  };
>  
>  struct cpcap_interrupt_desc {
> @@ -440,6 +443,21 @@ static int cpcap_charger_enable(struct cpcap_charger_ddata *ddata,
>  	return error;
>  }
>  
> +static int cpcap_charger_get_charge_current_reg(struct cpcap_charger_ddata *ddata)
> +{
> +	int error;
> +	unsigned int val;
> +
> +	error = regmap_read(ddata->reg, CPCAP_REG_CRM, &val);
> +
> +	if (error) {
> +		dev_err(ddata->dev, "%s failed with %i\n", __func__, error);
> +		return -1;
> +	}
> +
> +	return val & 0xf;
> +}
> +
>  static bool cpcap_charger_vbus_valid(struct cpcap_charger_ddata *ddata)
>  {
>  	int error, value = 0;
> @@ -607,6 +625,9 @@ static void cpcap_charger_disconnect(struct cpcap_charger_ddata *ddata,
>  		break;
>  	}
>  
> +	cancel_delayed_work_sync(&ddata->ramp_work);
> +	ddata->set_current = 0;
> +
>  	error = cpcap_charger_disable(ddata);
>  	if (error) {
>  		cpcap_charger_update_state(ddata, POWER_SUPPLY_STATUS_UNKNOWN);
> @@ -618,6 +639,40 @@ static void cpcap_charger_disconnect(struct cpcap_charger_ddata *ddata,
>  	schedule_delayed_work(&ddata->detect_work, delay);
>  }
>  
> +static void cpcap_charger_ramp_work(struct work_struct *work)
> +{
> +	struct cpcap_charger_ddata *ddata;
> +	int ichrg;
> +	int vchrg;
> +	int ichrg_current;
> +	int error;
> +
> +	ddata = container_of(work, struct cpcap_charger_ddata,
> +		     ramp_work.work);
> +
> +	ichrg_current = cpcap_charger_get_charge_current_reg(ddata);
> +	ichrg = cpcap_charger_current_to_regval(ddata->set_current);
> +	vchrg = cpcap_charger_voltage_to_regval(ddata->voltage);
> +	if (ichrg_current < ichrg)
> +		++ichrg_current;
> +	else if (ichrg_current > ichrg)
> +		ichrg_current = ichrg;
> +	else
> +		return;
> +
> +	error = cpcap_charger_enable(ddata,
> +					CPCAP_REG_CRM_VCHRG(vchrg),
> +					ichrg_current, 0);
> +	if (error) {
> +		dev_err(ddata->dev, "cpcap_charger_enable failed with %i\n", error);
> +		cpcap_charger_update_state(ddata, POWER_SUPPLY_STATUS_UNKNOWN);
> +	} else {
> +		if (ichrg_current == ichrg && ddata->status != POWER_SUPPLY_STATUS_CHARGING)
> +			cpcap_charger_update_state(ddata, POWER_SUPPLY_STATUS_CHARGING);
> +		schedule_delayed_work(&ddata->ramp_work, HZ/20);
> +	}
> +}
> +
>  static void cpcap_usb_detect(struct work_struct *work)
>  {
>  	struct cpcap_charger_ddata *ddata;
> @@ -651,13 +706,10 @@ static void cpcap_usb_detect(struct work_struct *work)
>  		return;
>  	}
>  
> -	/* Delay for 80ms to avoid vbus bouncing when usb cable is plugged in */
> -	usleep_range(80000, 120000);
> -
>  	/* Throttle chrgcurr2 interrupt for charger done and retry */
>  	switch (ddata->status) {
>  	case POWER_SUPPLY_STATUS_CHARGING:
> -		if (s.chrgcurr2)
> +		if (s.chrgcurr2 || delayed_work_pending(&ddata->ramp_work))
>  			break;
>  		new_state = POWER_SUPPLY_STATUS_FULL;
>  
> @@ -683,8 +735,6 @@ static void cpcap_usb_detect(struct work_struct *work)
>  
>  	if (!ddata->feeding_vbus && cpcap_charger_vbus_valid(ddata) &&
>  	    s.chrgcurr1) {
> -		int max_current;
> -		int vchrg, ichrg;
>  		union power_supply_propval val;
>  		struct power_supply *battery;
>  
> @@ -701,25 +751,18 @@ static void cpcap_usb_detect(struct work_struct *work)
>  			goto out_err;
>  
>  		if (val.intval) {
> -			max_current = 1596000;
> +			ddata->set_current = 1596000;
>  		} else {
>  			dev_info(ddata->dev, "battery not inserted, charging disabled\n");
> -			max_current = 0;
> +			ddata->set_current = 0;
>  		}
>  
> -		if (max_current > ddata->limit_current)
> -			max_current = ddata->limit_current;
> -
> -		ichrg = cpcap_charger_current_to_regval(max_current);
> -		vchrg = cpcap_charger_voltage_to_regval(ddata->voltage);
> -		error = cpcap_charger_enable(ddata,
> -					     CPCAP_REG_CRM_VCHRG(vchrg),
> -					     ichrg, 0);
> -		if (error)
> -			goto out_err;
> -		cpcap_charger_update_state(ddata,
> -					   POWER_SUPPLY_STATUS_CHARGING);
> +		if (ddata->set_current > ddata->limit_current)
> +			ddata->set_current = ddata->limit_current;
> +		if (!delayed_work_pending(&ddata->ramp_work))
> +			schedule_delayed_work(&ddata->ramp_work, HZ/20);
>  	} else {
> +		ddata->set_current = 0;
>  		error = cpcap_charger_disable(ddata);
>  		if (error)
>  			goto out_err;
> @@ -902,6 +945,7 @@ static int cpcap_charger_probe(struct platform_device *pdev)
>  	INIT_LIST_HEAD(&ddata->irq_list);
>  	INIT_DELAYED_WORK(&ddata->detect_work, cpcap_usb_detect);
>  	INIT_DELAYED_WORK(&ddata->vbus_work, cpcap_charger_vbus_work);
> +	INIT_DELAYED_WORK(&ddata->ramp_work, cpcap_charger_ramp_work);
>  	platform_set_drvdata(pdev, ddata);
>  
>  	error = cpcap_charger_init_iio(ddata);
> @@ -964,6 +1008,7 @@ static void cpcap_charger_shutdown(struct platform_device *pdev)
>  	cpcap_charger_update_state(ddata, POWER_SUPPLY_STATUS_DISCHARGING);
>  	cancel_delayed_work_sync(&ddata->vbus_work);
>  	cancel_delayed_work_sync(&ddata->detect_work);
> +	cancel_delayed_work_sync(&ddata->ramp_work);
>  }
>  
>  static int cpcap_charger_remove(struct platform_device *pdev)

