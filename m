Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FC19369FA5
	for <lists+linux-omap@lfdr.de>; Sat, 24 Apr 2021 08:49:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244407AbhDXGtC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 24 Apr 2021 02:49:02 -0400
Received: from muru.com ([72.249.23.125]:48106 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231701AbhDXGsS (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sat, 24 Apr 2021 02:48:18 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 0943080C3;
        Sat, 24 Apr 2021 06:47:33 +0000 (UTC)
Date:   Sat, 24 Apr 2021 09:47:27 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Carl Philipp Klemm <philipp@uvos.xyz>
Cc:     Sebastian Reichel <sre@kernel.org>, linux-omap@vger.kernel.org,
        Arthur Demchenkov <spinal.by@gmail.com>,
        Merlijn Wajer <merlijn@wizzup.org>, Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2 1/2] power: supply: cpcap-battery: Add battery type
 auto detection for mapphone devices
Message-ID: <YIO+/0OnFCoYkVIB@atomide.com>
References: <20210423145543.d007e8aa9bd2fc91dc51caa5@uvos.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210423145543.d007e8aa9bd2fc91dc51caa5@uvos.xyz>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Carl Philipp Klemm <philipp@uvos.xyz> [210423 12:55]:
> +static void cpcap_battery_detect_battery_type(struct cpcap_battery_ddata *ddata)
> +{
> +	struct nvmem_device *nvmem;
> +	u8 battery_id = 0;
> +
> +	ddata->check_nvmem = false;
> +
> +	nvmem = nvmem_device_find(NULL, &cpcap_battery_match_nvmem);
> +	if (IS_ERR_OR_NULL(nvmem)) {
> +		ddata->check_nvmem = true;
> +		if (!ddata->no_nvmem_warned) {
> +			dev_info(ddata->dev, "Can not find battery nvmem device. Assuming generic lipo battery\n");
> +			ddata->no_nvmem_warned = true;
> +		}

Folks are also using the device with no battery at all to have it directly
connected to the power supply. This is handy for remotely power cycling
the device, and also for measuring power consumption with a bench power
supply. So by default I think we should continue assuming no battery is
inserted rather than assume a generic battery is inserted.

How about require configuring the undetected battery parameters via
/sys/class/power_supply to indicate a non-standard battery is inserted?

At least battery type, capacity, and voltage can depend on the generic
battery inserted.

Other than that, the NVRAM changes look nice to me.

Regards,

Tony
