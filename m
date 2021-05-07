Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B4713762D6
	for <lists+linux-omap@lfdr.de>; Fri,  7 May 2021 11:28:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233468AbhEGJ3K (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 7 May 2021 05:29:10 -0400
Received: from muru.com ([72.249.23.125]:52674 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236718AbhEGJ3J (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 7 May 2021 05:29:09 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id C13A480E0;
        Fri,  7 May 2021 09:17:49 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     Dave Gerlach <d-gerlach@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Suman Anna <s-anna@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Naresh Kamboju <naresh.kamboju@linaro.org>
Subject: [PATCH] bus: ti-sysc: Fix missing quirk flags for sata
Date:   Fri,  7 May 2021 12:17:44 +0300
Message-Id: <20210507091744.19753-1-tony@atomide.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Naresh Kamboju <naresh.kamboju@linaro.org> reported that Beaglebone-X15
does not detect sata drives any longer after dra7 was flipped to boot with
device tree data only. Turns out we are now missing the sata related quirk
flags in ti-sysc that we used to have earlier.

Fixes: 98feab31ac49 ("ARM: OMAP2+: Drop legacy platform data for dra7 sata")
Fixes: 21206c8f2cb5 ("ARM: OMAP2+: Drop legacy platform data for omap5 sata")
Link: https://lore.kernel.org/regressions/CA+G9fYtTN6ug3eBAW3wMcDeESUo+ebj7L5HBe5_fj4uqDExFQg@mail.gmail.com/
Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Tested-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/bus/ti-sysc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -1455,6 +1455,8 @@ static const struct sysc_revision_quirk sysc_revision_quirks[] = {
 		   SYSC_QUIRK_SWSUP_SIDLE | SYSC_QUIRK_SWSUP_MSTANDBY),
 	SYSC_QUIRK("tptc", 0, 0, -ENODEV, -ENODEV, 0x40007c00, 0xffffffff,
 		   SYSC_QUIRK_SWSUP_SIDLE | SYSC_QUIRK_SWSUP_MSTANDBY),
+	SYSC_QUIRK("sata", 0, 0xfc, 0x1100, -ENODEV, 0x5e412000, 0xffffffff,
+		   SYSC_QUIRK_SWSUP_SIDLE | SYSC_QUIRK_SWSUP_MSTANDBY),
 	SYSC_QUIRK("usb_host_hs", 0, 0, 0x10, 0x14, 0x50700100, 0xffffffff,
 		   SYSC_QUIRK_SWSUP_SIDLE | SYSC_QUIRK_SWSUP_MSTANDBY),
 	SYSC_QUIRK("usb_host_hs", 0, 0, 0x10, -ENODEV, 0x50700101, 0xffffffff,
-- 
2.31.1
