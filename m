Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 881F12AD256
	for <lists+linux-omap@lfdr.de>; Tue, 10 Nov 2020 10:21:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727001AbgKJJVd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Nov 2020 04:21:33 -0500
Received: from muru.com ([72.249.23.125]:47606 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726467AbgKJJVd (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 10 Nov 2020 04:21:33 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id CC1B180BA;
        Tue, 10 Nov 2020 09:21:36 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     Dave Gerlach <d-gerlach@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCHv2] bus: ti-sysc: Fix bogus resetdone warning on enable for cpsw
Date:   Tue, 10 Nov 2020 11:21:27 +0200
Message-Id: <20201110092127.46638-1-tony@atomide.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Bail out early from sysc_wait_softreset() just like we do in sysc_reset()
if there's no sysstatus srst_shift to fix a bogus resetdone warning on
enable as suggested by Grygorii Strashko <grygorii.strashko@ti.com>.

We do not currently handle resets for modules that need writing to the
sysstatus register. If we at some point add that, we also need to add
SYSS_QUIRK_RESETDONE_INVERTED flag for cpsw as the sysstatus bit is low
when reset is done as described in the am335x TRM "Table 14-202
SOFT_RESET Register Field Descriptions"

Fixes: d46f9fbec719 ("bus: ti-sysc: Use optional clocks on for enable and wait for softreset bit")
Suggested-by: Grygorii Strashko <grygorii.strashko@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---

Changes since v1:
- Drop quirk handling and use fix suggested by Grygorii

---
 drivers/bus/ti-sysc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -227,6 +227,9 @@ static int sysc_wait_softreset(struct sysc *ddata)
 	u32 sysc_mask, syss_done, rstval;
 	int syss_offset, error = 0;
 
+	if (ddata->cap->regbits->srst_shift < 0)
+		return 0;
+
 	syss_offset = ddata->offsets[SYSC_SYSSTATUS];
 	sysc_mask = BIT(ddata->cap->regbits->srst_shift);
 
-- 
2.29.2
