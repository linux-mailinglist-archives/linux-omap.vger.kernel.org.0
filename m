Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AA4336A149
	for <lists+linux-omap@lfdr.de>; Sat, 24 Apr 2021 14:59:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232250AbhDXNAJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 24 Apr 2021 09:00:09 -0400
Received: from muru.com ([72.249.23.125]:48198 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232148AbhDXNAI (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sat, 24 Apr 2021 09:00:08 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 5B6D480C3;
        Sat, 24 Apr 2021 12:59:28 +0000 (UTC)
Date:   Sat, 24 Apr 2021 15:59:25 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Carl Philipp Klemm <philipp@uvos.xyz>
Cc:     Pavel Machek <pavel@ucw.cz>,
        Arthur Demchenkov <spinal.by@gmail.com>,
        Merlijn Wajer <merlijn@wizzup.org>, linux-omap@vger.kernel.org,
        Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH v2 1/2] power: supply: cpcap-battery: Add battery type
 auto detection for mapphone devices
Message-ID: <YIQWLfKU8WaqYsuo@atomide.com>
References: <17902adc982.11f94042187264621.8712932018769506839@zoho.eu>
 <20210424111722.5defa3b4bab246143ca2c0ae@uvos.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210424111722.5defa3b4bab246143ca2c0ae@uvos.xyz>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Carl Philipp Klemm <philipp@uvos.xyz> [210424 09:17]:
> > The battery inserted property is still based on the presence of a thermistor, so I don't see how this patch changes the bevior with regards to this use case at all except for that info print. Previously the battery information struct was simply set to the values expected from eb41 no matter what.

OK sounds like I should test these patches with a power supply.

> Vefore writing this patch i did use the below on my xt875, which dose what you ask. maybe this is something you would like to see included in addition to the above? if so i can submitt it aswell:
> 
> [PATCH] power: supply: cpcap-battery: make charge_full_design writeable, so that different/custom batteries can be used.
> 
> Especially usfull on XTT875 where both HW4X and BW8X exsist

Yeah I think for generic batteries we should require that the battery
properties get initialized. Also the type can be li-ion vs li-po, I think
the charge voltage we already have configurable.

Regards,

Tony

> ---
>  drivers/power/supply/cpcap-battery.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/power/supply/cpcap-battery.c b/drivers/power/supply/cpcap-battery.c
> index be8d8b746f24..6465cb1b084c 100644
> --- a/drivers/power/supply/cpcap-battery.c
> +++ b/drivers/power/supply/cpcap-battery.c
> @@ -769,6 +769,13 @@ static int cpcap_battery_set_property(struct power_supply *psy,
>  
>  		ddata->charge_full = val->intval;
>  
> +		return 0;
> +			case POWER_SUPPLY_PROP_CHARGE_FULL_DESIGN:
> +		if (val->intval < 0)
> +			return -EINVAL;
> +
> +		ddata->config.info.charge_full_design = val->intval;
> +
>  		return 0;
>  	default:
>  		return -EINVAL;
> @@ -783,6 +790,7 @@ static int cpcap_battery_property_is_writeable(struct power_supply *psy,
>  	switch (psp) {
>  	case POWER_SUPPLY_PROP_CONSTANT_CHARGE_VOLTAGE:
>  	case POWER_SUPPLY_PROP_CHARGE_FULL:
> +	case POWER_SUPPLY_PROP_CHARGE_FULL_DESIGN:
>  		return 1;
>  	default:
>  		return 0;
> -- 
> 2.31.0
