Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CC1B413118
	for <lists+linux-omap@lfdr.de>; Tue, 21 Sep 2021 12:01:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231609AbhIUKDW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Sep 2021 06:03:22 -0400
Received: from muru.com ([72.249.23.125]:35486 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231565AbhIUKDN (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 21 Sep 2021 06:03:13 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 4BC868520;
        Tue, 21 Sep 2021 10:02:11 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     Dave Gerlach <d-gerlach@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Kevin Hilman <khilman@baylibre.com>,
        Nishanth Menon <nm@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 9/9] bus: ti-sysc: Drop legacy quirk flag for sham
Date:   Tue, 21 Sep 2021 13:01:15 +0300
Message-Id: <20210921100115.59865-10-tony@atomide.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210921100115.59865-1-tony@atomide.com>
References: <20210921100115.59865-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

There is no need for the legacy flag any longer for gpio as the omap-sham
driver has been fixed to not rely on pm_runtime_irq_safe().

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/bus/ti-sysc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -1539,8 +1539,6 @@ struct sysc_revision_quirk {
 
 static const struct sysc_revision_quirk sysc_revision_quirks[] = {
 	/* These drivers need to be fixed to not use pm_runtime_irq_safe() */
-	SYSC_QUIRK("sham", 0, 0x100, 0x110, 0x114, 0x40000c03, 0xffffffff,
-		   SYSC_QUIRK_LEGACY_IDLE),
 	SYSC_QUIRK("uart", 0, 0x50, 0x54, 0x58, 0x00000046, 0xffffffff,
 		   SYSC_QUIRK_SWSUP_SIDLE | SYSC_QUIRK_LEGACY_IDLE),
 	SYSC_QUIRK("uart", 0, 0x50, 0x54, 0x58, 0x00000052, 0xffffffff,
@@ -1679,6 +1677,7 @@ static const struct sysc_revision_quirk sysc_revision_quirks[] = {
 	SYSC_QUIRK("sdio", 0, 0, 0x10, -ENODEV, 0x40202301, 0xffff0ff0, 0),
 	SYSC_QUIRK("sdio", 0, 0x2fc, 0x110, 0x114, 0x31010000, 0xffffffff, 0),
 	SYSC_QUIRK("sdma", 0, 0, 0x2c, 0x28, 0x00010900, 0xffffffff, 0),
+	SYSC_QUIRK("sham", 0, 0x100, 0x110, 0x114, 0x40000c03, 0xffffffff, 0),
 	SYSC_QUIRK("slimbus", 0, 0, 0x10, -ENODEV, 0x40000902, 0xffffffff, 0),
 	SYSC_QUIRK("slimbus", 0, 0, 0x10, -ENODEV, 0x40002903, 0xffffffff, 0),
 	SYSC_QUIRK("smartreflex", 0, -ENODEV, 0x24, -ENODEV, 0x00000000, 0xffffffff, 0),
-- 
2.33.0
