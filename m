Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CB95375340
	for <lists+linux-omap@lfdr.de>; Thu,  6 May 2021 13:53:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231461AbhEFLyh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 6 May 2021 07:54:37 -0400
Received: from muru.com ([72.249.23.125]:52258 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229733AbhEFLyh (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 6 May 2021 07:54:37 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 6C6DF80F9;
        Thu,  6 May 2021 11:53:39 +0000 (UTC)
Date:   Thu, 6 May 2021 14:53:34 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, lkft-triage@lists.linaro.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        regressions@lists.linux.dev,
        Benoit Cousson <bcousson@baylibre.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: #regzb introduced: 98feab31ac49 ("ARM: OMAP2+: Drop legacy
 platform data for dra7 sata")
Message-ID: <YJPYvsdkfx4JD4vT@atomide.com>
References: <CA+G9fYtTN6ug3eBAW3wMcDeESUo+ebj7L5HBe5_fj4uqDExFQg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYtTN6ug3eBAW3wMcDeESUo+ebj7L5HBe5_fj4uqDExFQg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Naresh Kamboju <naresh.kamboju@linaro.org> [210506 11:00]:
> Our bisect script pointed this as the first bad commit on linux
> mainline master branch.
> 
> Full test log:
> ----------------
> SATA detection failed log link,
> https://lkft.validation.linaro.org/scheduler/job/2580998#L1973
> 
> --
> commit 98feab31ac491400f28b76a04dabd18ce21e91ba
> Author: Tony Lindgren <tony@atomide.com>
> Date:   Wed Mar 10 14:03:51 2021 +0200
> 
>     ARM: OMAP2+: Drop legacy platform data for dra7 sata

Thanks for the report, looks like we are now missing the sata related
quirk flags compared to the patch above.

Below is a quick patch to add the missing quirk flags that might help
if you can give it a try.

Regards,

Tony

8< --------------------------
diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -1459,6 +1459,8 @@ static const struct sysc_revision_quirk sysc_revision_quirks[] = {
 		   SYSC_QUIRK_SWSUP_SIDLE | SYSC_QUIRK_SWSUP_MSTANDBY),
 	SYSC_QUIRK("tptc", 0, 0, -ENODEV, -ENODEV, 0x40007c00, 0xffffffff,
 		   SYSC_QUIRK_SWSUP_SIDLE | SYSC_QUIRK_SWSUP_MSTANDBY),
+	SYSC_QUIRK("sata", 0, 0xfc, 0x1100, -ENODEV, 0x5e412000, 0xffffffff,
+		   SYSC_QUIRK_SWSUP_SIDLE | SYSC_QUIRK_SWSUP_MSTANDBY),
 	SYSC_QUIRK("usb_host_hs", 0, 0, 0x10, 0x14, 0x50700100, 0xffffffff,
 		   SYSC_QUIRK_SWSUP_SIDLE | SYSC_QUIRK_SWSUP_MSTANDBY),
 	SYSC_QUIRK("usb_host_hs", 0, 0, 0x10, -ENODEV, 0x50700101, 0xffffffff,
@@ -1524,7 +1526,6 @@ static const struct sysc_revision_quirk sysc_revision_quirks[] = {
 	SYSC_QUIRK("prcm", 0, 0, -ENODEV, -ENODEV, 0x40000400, 0xffffffff, 0),
 	SYSC_QUIRK("rfbi", 0x4832a800, 0, 0x10, 0x14, 0x00000010, 0xffffffff, 0),
 	SYSC_QUIRK("rfbi", 0x58002000, 0, 0x10, 0x14, 0x00000010, 0xffffffff, 0),
-	SYSC_QUIRK("sata", 0, 0xfc, 0x1100, -ENODEV, 0x5e412000, 0xffffffff, 0),
 	SYSC_QUIRK("scm", 0, 0, 0x10, -ENODEV, 0x40000900, 0xffffffff, 0),
 	SYSC_QUIRK("scm", 0, 0, -ENODEV, -ENODEV, 0x4e8b0100, 0xffffffff, 0),
 	SYSC_QUIRK("scm", 0, 0, -ENODEV, -ENODEV, 0x4f000100, 0xffffffff, 0),
-- 
2.31.1
