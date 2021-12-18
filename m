Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74C6247996A
	for <lists+linux-omap@lfdr.de>; Sat, 18 Dec 2021 08:34:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232276AbhLRHe0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 18 Dec 2021 02:34:26 -0500
Received: from muru.com ([72.249.23.125]:39774 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230506AbhLRHeZ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sat, 18 Dec 2021 02:34:25 -0500
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 67A9880F5;
        Sat, 18 Dec 2021 07:35:07 +0000 (UTC)
Date:   Sat, 18 Dec 2021 09:34:22 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Merlijn Wajer <merlijn@wizzup.org>
Cc:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        "Merlijn B.W. Wajer" <merlijn@archive.org>,
        Andreas Kemnade <andreas@kemnade.info>,
        Pavel Machek <pavel@ucw.cz>,
        linux-omap <linux-omap@vger.kernel.org>,
        Dev Null <devnull@uvos.xyz>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Sebastian Reichel <sre@kernel.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: Oops while booting 5.15.2 on Nokia N900
Message-ID: <Yb2O/m4wMYdMgZbh@atomide.com>
References: <ee94556b-2c35-c641-a86a-e9e70600aab7@archive.org>
 <20211210111345.GD799423@darkstar.musicnaut.iki.fi>
 <7438fa4a-ea92-a3ce-4cc7-8da8a4af02b5@wizzup.org>
 <YbRL75F/SlcPJjtf@atomide.com>
 <370c8e25-d582-decb-5dd9-625d6548dcd3@wizzup.org>
 <Ybbegfbnl8+5Xqc5@atomide.com>
 <9dc4e8d4-ca35-c931-d4c7-7bae43184ef1@wizzup.org>
 <7b61f212-b665-f8fb-72c7-4c354e773f5a@wizzup.org>
 <YbdPn21Xf8HD6ILM@atomide.com>
 <aaf5d01a-4e31-67cc-7312-4449a30a0de8@wizzup.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="D0CIRCs4ifS3yrDj"
Content-Disposition: inline
In-Reply-To: <aaf5d01a-4e31-67cc-7312-4449a30a0de8@wizzup.org>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--D0CIRCs4ifS3yrDj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Merlijn Wajer <merlijn@wizzup.org> [211216 11:34]:
> Hi,
> 
> On 13/12/2021 14:50, Tony Lindgren wrote:
> > * Merlijn Wajer <merlijn@wizzup.org> [211213 10:45]:
> >
> >> and I am no longer seeing the oopses or resets when running "sleep 30;
> >> blkid" from minimal userspace.
> > 
> > If disabling the cpu_thermal makes things behave, chances are we have wrong
> > thermal values in the dts for n900 and possible all 34xx devices. The 36xx
> > values are behaving AFAIK.
> 
> Just disabling the bandgap doesn't seem to be enough. I also tried
> disabling just the bandgap and thermal_zones, but that is also isn't
> enough. However, *just* disabling cpu_thermal also isn't enough.
> 
> Disabling both cpu_thermal and bandgap is enough to stop the oopses [1].
> So it sounds like there might potentially be some problems in
> cpu_thermal as well then?

Not sure what's wrong..

But meanwhile, looks like the patch below produces thermal values, so
maybe check if it allows idling with thermal enabled on n900. It might
just leave out all the extra polling.

Regards,

Tony

--D0CIRCs4ifS3yrDj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline; filename="test.patch"

diff --git a/drivers/thermal/ti-soc-thermal/omap3-thermal-data.c b/drivers/thermal/ti-soc-thermal/omap3-thermal-data.c
--- a/drivers/thermal/ti-soc-thermal/omap3-thermal-data.c
+++ b/drivers/thermal/ti-soc-thermal/omap3-thermal-data.c
@@ -66,7 +66,8 @@ omap34xx_adc_to_temp[128] = {
 
 /* OMAP34XX data */
 const struct ti_bandgap_data omap34xx_data = {
-	.features = TI_BANDGAP_FEATURE_CLK_CTRL | TI_BANDGAP_FEATURE_UNRELIABLE,
+	.features = TI_BANDGAP_FEATURE_CLK_CTRL | TI_BANDGAP_FEATURE_UNRELIABLE |
+		    TI_BANDGAP_FEATURE_CONT_MODE_ONLY,
 	.fclock_name = "ts_fck",
 	.div_ck_name = "ts_fck",
 	.conv_table = omap34xx_adc_to_temp,

--D0CIRCs4ifS3yrDj--
