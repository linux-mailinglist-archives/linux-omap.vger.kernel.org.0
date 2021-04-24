Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88AEC36A081
	for <lists+linux-omap@lfdr.de>; Sat, 24 Apr 2021 11:17:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231203AbhDXJSQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 24 Apr 2021 05:18:16 -0400
Received: from sender11-of-o51.zoho.eu ([31.186.226.237]:21165 "EHLO
        sender11-of-o51.zoho.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229850AbhDXJSQ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 24 Apr 2021 05:18:16 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1619255844; cv=none; 
        d=zohomail.eu; s=zohoarc; 
        b=JhwujuQ+D6ZLmOJ5A0WkalK9EgvvQU1p0nCEytCzSAWjlYMk1YKXQXeFN7TPpyNfOvaKuO8pDx02fwLpNwgjq5K+/uabtzpI/PgyR7azVc74PHEMoftXjdtiXA8PB/q0SEOMTMI4hbTLXl05k8nhW09HTRFeOHS8wSB5osLcBgk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
        t=1619255844; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=MG9e1kFuIb53D0cUOfIstKRGH6wKvCIsKbrL880RlEg=; 
        b=d829v0BjKM6Rs8Zf5p+dpuzpHvA8gk+DN0FOzMSeFIPPCB+tOKy0O7lyWdQmWZXbhNOHmjgrSH4Sfy1nffA2V5QBlDxHBHVyKBUuzZMFJnzhpY+xQ6mbtolgWntUA52ZW+PmQ5mqoX6XMHqLhv6f4CKsH0/FjnttMVPVn9oS0cc=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
        spf=pass  smtp.mailfrom=philipp@uvos.xyz;
        dmarc=pass header.from=<philipp@uvos.xyz> header.from=<philipp@uvos.xyz>
Received: from UVOSLinux (ip-95-222-212-190.hsi15.unitymediagroup.de [95.222.212.190]) by mx.zoho.eu
        with SMTPS id 1619255842634493.17175410863695; Sat, 24 Apr 2021 11:17:22 +0200 (CEST)
Date:   Sat, 24 Apr 2021 11:17:22 +0200
From:   Carl Philipp Klemm <philipp@uvos.xyz>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Pavel Machek <pavel@ucw.cz>,
        Arthur Demchenkov <spinal.by@gmail.com>,
        Merlijn Wajer <merlijn@wizzup.org>, linux-omap@vger.kernel.org,
        Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH v2 1/2] power: supply: cpcap-battery: Add battery type
 auto detection for mapphone devices
Message-Id: <20210424111722.5defa3b4bab246143ca2c0ae@uvos.xyz>
In-Reply-To: <17902adc982.11f94042187264621.8712932018769506839@zoho.eu>
References: <17902adc982.11f94042187264621.8712932018769506839@zoho.eu>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

> On Apr 24, 2021 08:47, Tony Lindgren <tony@atomide.com> wrote:
> >
> > Hi, 
> >
> > * Carl Philipp Klemm <philipp@uvos.xyz> [210423 12:55]: 
> > > +static void cpcap_battery_detect_battery_type(struct cpcap_battery_ddata *ddata) 
> > > +{ 
> > > + struct nvmem_device *nvmem; 
> > > + u8 battery_id = 0; 
> > > + 
> > > + ddata->check_nvmem = false; 
> > > + 
> > > + nvmem = nvmem_device_find(NULL, &cpcap_battery_match_nvmem); 
> > > + if (IS_ERR_OR_NULL(nvmem)) { 
> > > + ddata->check_nvmem = true; 
> > > + if (!ddata->no_nvmem_warned) { 
> > > + dev_info(ddata->dev, "Can not find battery nvmem device. Assuming generic lipo battery\n"); 
> > > + ddata->no_nvmem_warned = true; 
> > > + } 
> >
> > Folks are also using the device with no battery at all to have it directly 
> > connected to the power supply. This is handy for remotely power cycling 
> > the device, and also for measuring power consumption with a bench power 
> > supply. So by default I think we should continue assuming no battery is 
> > inserted rather than assume a generic battery is inserted. 
> >
> > How about require configuring the undetected battery parameters via 
> > /sys/class/power_supply to indicate a non-standard battery is inserted? 
> >
> > At least battery type, capacity, and voltage can depend on the generic 
> > battery inserted. 
> >
> > Other than that, the NVRAM changes look nice to me. 
> >
> > Regards, 
> >
> > Tony 
> 
> The battery inserted property is still based on the presence of a thermistor, so I don't see how this patch changes the bevior with regards to this use case at all except for that info print. Previously the battery information struct was simply set to the values expected from eb41 no matter what.

Vefore writing this patch i did use the below on my xt875, which dose what you ask. maybe this is something you would like to see included in addition to the above? if so i can submitt it aswell:

[PATCH] power: supply: cpcap-battery: make charge_full_design writeable, so that different/custom batteries can be used.

Especially usfull on XTT875 where both HW4X and BW8X exsist

---
 drivers/power/supply/cpcap-battery.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/power/supply/cpcap-battery.c b/drivers/power/supply/cpcap-battery.c
index be8d8b746f24..6465cb1b084c 100644
--- a/drivers/power/supply/cpcap-battery.c
+++ b/drivers/power/supply/cpcap-battery.c
@@ -769,6 +769,13 @@ static int cpcap_battery_set_property(struct power_supply *psy,
 
 		ddata->charge_full = val->intval;
 
+		return 0;
+			case POWER_SUPPLY_PROP_CHARGE_FULL_DESIGN:
+		if (val->intval < 0)
+			return -EINVAL;
+
+		ddata->config.info.charge_full_design = val->intval;
+
 		return 0;
 	default:
 		return -EINVAL;
@@ -783,6 +790,7 @@ static int cpcap_battery_property_is_writeable(struct power_supply *psy,
 	switch (psp) {
 	case POWER_SUPPLY_PROP_CONSTANT_CHARGE_VOLTAGE:
 	case POWER_SUPPLY_PROP_CHARGE_FULL:
+	case POWER_SUPPLY_PROP_CHARGE_FULL_DESIGN:
 		return 1;
 	default:
 		return 0;
-- 
2.31.0
