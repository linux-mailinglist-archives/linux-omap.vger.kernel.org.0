Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E7BB413110
	for <lists+linux-omap@lfdr.de>; Tue, 21 Sep 2021 12:01:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231570AbhIUKDI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Sep 2021 06:03:08 -0400
Received: from muru.com ([72.249.23.125]:35442 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231609AbhIUKDE (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 21 Sep 2021 06:03:04 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 91DEA8171;
        Tue, 21 Sep 2021 10:02:02 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     Dave Gerlach <d-gerlach@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Kevin Hilman <khilman@baylibre.com>,
        Nishanth Menon <nm@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 5/9] bus: ti-sysc: Use context lost quirks for gpmc
Date:   Tue, 21 Sep 2021 13:01:11 +0300
Message-Id: <20210921100115.59865-6-tony@atomide.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210921100115.59865-1-tony@atomide.com>
References: <20210921100115.59865-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

At least on am335x, the gpmc module needs a re-init and reset if context
has been lost on resume. We can enable this for all gpmc revisions as we
check if the context was lost before restoring it.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/bus/ti-sysc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -1574,6 +1574,7 @@ static const struct sysc_revision_quirk sysc_revision_quirks[] = {
 	SYSC_QUIRK("dwc3", 0x488c0000, 0, 0x10, -ENODEV, 0x500a0200, 0xffffffff,
 		   SYSC_QUIRK_CLKDM_NOAUTO),
 	SYSC_QUIRK("gpmc", 0, 0, 0x10, 0x14, 0x00000060, 0xffffffff,
+		   SYSC_QUIRK_REINIT_ON_CTX_LOST | SYSC_QUIRK_RESET_ON_CTX_LOST |
 		   SYSC_QUIRK_GPMC_DEBUG),
 	SYSC_QUIRK("hdmi", 0, 0, 0x10, -ENODEV, 0x50030200, 0xffffffff,
 		   SYSC_QUIRK_OPT_CLKS_NEEDED),
-- 
2.33.0
