Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE2242B725F
	for <lists+linux-omap@lfdr.de>; Wed, 18 Nov 2020 00:25:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729217AbgKQXYt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 17 Nov 2020 18:24:49 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:59446 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728193AbgKQXYs (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 17 Nov 2020 18:24:48 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AHNO712032017;
        Tue, 17 Nov 2020 17:24:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1605655447;
        bh=BPjxYG10nNEarUm95nLoroA2ShGvg7pn52uDyKMVgAk=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=FSwxrQQQRtLBvw28CJ46qgx188WRV3MOSiS8tPYqf5tP7nzTgVkVVR2J+XabXPsFi
         UZkGBZR6rnQcrAdtR64jgBMqWm4yccPbSr5txNDhSq2dp1jQ48P/VZe3av13KXWHTV
         le/fM99rJgr6CGgztSZlgEDHkaq1qra7IYBpRBxI=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AHNO7hi097004
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 17 Nov 2020 17:24:07 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 17
 Nov 2020 17:24:06 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 17 Nov 2020 17:24:06 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AHNO6Am130347;
        Tue, 17 Nov 2020 17:24:06 -0600
Date:   Tue, 17 Nov 2020 17:24:06 -0600
From:   Nishanth Menon <nm@ti.com>
To:     Arnd Bergmann <arnd@kernel.org>
CC:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>, <lkft-triage@lists.linaro.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Subject: Re: [arm] BUG: KASAN: slab-out-of-bounds in memcmp+0x30/0x5c
Message-ID: <20201117232343.rg37fkacw43matmh@revered>
References: <CA+G9fYuk4imvhyCN7D7T6PMDH6oNp6HDCRiTUKMQ6QXXjBa4ag@mail.gmail.com>
 <CAK8P3a2MmA257e486D2hj_qj9Wk0ybkfg9yk9f5hR=h-KWUHVg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAK8P3a2MmA257e486D2hj_qj9Wk0ybkfg9yk9f5hR=h-KWUHVg@mail.gmail.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 16:25-20201117, Arnd Bergmann wrote:
> On Tue, Nov 17, 2020 at 3:44 PM Naresh Kamboju
> <naresh.kamboju@linaro.org> wrote:
> >
> > While booting arm KASAN config enabled kernel on TI x15 device
> > Linux version 5.10.0-rc3-next-20201116.
> >
> > The reported issue is not a regression since we have recently started testing
> > arm+kasan builds on LKFT.
> >
> > The boot was not successful on x15 and qemu_arm  for some other reason.
> > The kernel config and crash log attached to this email.
> 
> Nice find!
> 
> > [   13.071906] BUG: KASAN: slab-out-of-bounds in memcmp+0x30/0x5c
> > [   13.077526] Synopsys Designware Multimedia Card Interface Driver
> > [   13.077781] Read of size 1 at addr c5ae1d90 by task kworker/0:0/5
> > [   13.089918]
> > [   13.091433] CPU: 0 PID: 5 Comm: kworker/0:0 Not tainted
> > 5.10.0-rc3-next-20201116 #2
> > [   13.093605] sdhci-pltfm: SDHCI platform and OF driver helper
> > [   13.099135] Hardware name: Generic DRA74X (Flattened Device Tree)
> > [   13.110942] Workqueue: events dbs_work_handler
> > [   13.115442] [<c0315abc>] (unwind_backtrace) from [<c030ebf8>]
> > (show_stack+0x10/0x14)
> > [   13.123240] [<c030ebf8>] (show_stack) from [<c16c91cc>]
> > (dump_stack+0xc8/0xe0)
> > [   13.130518] [<c16c91cc>] (dump_stack) from [<c051b4ec>]
> > (print_address_description.constprop.0+0x34/0x2dc)
> > [   13.140238] [<c051b4ec>] (print_address_description.constprop.0)
> > from [<c051b9e0>] (kasan_report+0x1a8/0x1c4)
> > [   13.145871] omap_gpio 4805d000.gpio: Could not set line 27 debounce
> > to 200000 microseconds (-22)
> > [   13.150221] [<c051b9e0>] (kasan_report) from [<c0997704>] (memcmp+0x30/0x5c)
> > [   13.159064] sdhci-omap 4809c000.mmc: Got CD GPIO
> > [   13.166123] [<c0997704>] (memcmp) from [<c0c33694>]
> > (ti_abb_set_voltage_sel+0x94/0x58c)
> > [   13.166150] [<c0c33694>] (ti_abb_set_voltage_sel) from [<c0c0f0f8>]
> > (_regulator_call_set_voltage_sel+0xd8/0x12c)
> 
> 
> I see this code in ti_abb_set_voltage_sel():
> 
>         if (sel >= desc->n_voltages) {
>                 dev_err(dev, "%s: sel idx(%d) >= n_voltages(%d)\n", __func__,
>                         sel, desc->n_voltages);
>                 return -EINVAL;
>         }
> 
>         /* If we are in the same index as we were, nothing to do here! */
>         if (sel == abb->current_info_idx) {
>                 dev_dbg(dev, "%s: Already at sel=%d\n", __func__, sel);
>                 return ret;
>         }
> 
>         /* If data is exactly the same, then just update index, no change */
>         info = &abb->info[sel];
>         oinfo = &abb->info[abb->current_info_idx];
>         if (!memcmp(info, oinfo, sizeof(*info))) {
> 
> One of the two pointers overflows the abb->info array that is allocated
> with length 'desc->n_voltages'. The 'sel' argument is checked against
> that limit, so I assume it's abb->current_info_idx, and this is indeed
> initialized as
> 
>         /* We do not know where the OPP voltage is at the moment */
>         abb->current_info_idx = -EINVAL;
> 
> Using the negative '-EINVAL' as an array index would indeed cause
> an out-of-bounds access.
> 
> Could you try adding this extra bounds check?
> 
> index 3e60bff76194..c475a9461027 100644
> --- a/drivers/regulator/ti-abb-regulator.c
> +++ b/drivers/regulator/ti-abb-regulator.c
> @@ -345,7 +345,8 @@ static int ti_abb_set_voltage_sel(struct
> regulator_dev *rdev, unsigned sel)
>         /* If data is exactly the same, then just update index, no change */
>         info = &abb->info[sel];
>         oinfo = &abb->info[abb->current_info_idx];
> -       if (!memcmp(info, oinfo, sizeof(*info))) {
> +       if (abb->current_info_idx >= 0 &&
> +           !memcmp(info, oinfo, sizeof(*info))) {
>                 dev_dbg(dev, "%s: Same data new idx=%d, old idx=%d\n", __func__,
>                         sel, abb->current_info_idx);
>                 goto out;
> 
>       Arnd


Yes, this was indeed a bug that has been around for some time now :(

I tested with a variant of the above (did'nt like that
oinfo was being assigned an invalid address)
Boot log: https://pastebin.ubuntu.com/p/nZfz3HF8N6/ (with the same
config as in the report): Would you prefer to me to send the following
as a formal patch?

diff --git a/drivers/regulator/ti-abb-regulator.c b/drivers/regulator/ti-abb-regulator.c
index 3e60bff76194..9f0a4d50cead 100644
--- a/drivers/regulator/ti-abb-regulator.c
+++ b/drivers/regulator/ti-abb-regulator.c
@@ -342,8 +342,17 @@ static int ti_abb_set_voltage_sel(struct regulator_dev *rdev, unsigned sel)
 		return ret;
 	}
 
-	/* If data is exactly the same, then just update index, no change */
 	info = &abb->info[sel];
+	/*
+	 * When Linux kernel is starting up, we are'nt sure of the
+	 * Bias configuration that bootloader has configured.
+	 * So, we get to know the actual setting the first time
+	 * we are asked to transition.
+	 */
+	if (abb->current_info_idx == -EINVAL)
+		goto just_set_abb;
+
+	/* If data is exactly the same, then just update index, no change */
 	oinfo = &abb->info[abb->current_info_idx];
 	if (!memcmp(info, oinfo, sizeof(*info))) {
 		dev_dbg(dev, "%s: Same data new idx=%d, old idx=%d\n", __func__,
@@ -351,6 +360,7 @@ static int ti_abb_set_voltage_sel(struct regulator_dev *rdev, unsigned sel)
 		goto out;
 	}
 
+just_set_abb:
 	ret = ti_abb_set_opp(rdev, abb, info);
 
 out:
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
