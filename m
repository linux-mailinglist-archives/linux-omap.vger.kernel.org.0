Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5DD88D420
	for <lists+linux-omap@lfdr.de>; Wed, 14 Aug 2019 15:02:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727865AbfHNNCw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 14 Aug 2019 09:02:52 -0400
Received: from muru.com ([72.249.23.125]:57584 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727850AbfHNNCw (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 14 Aug 2019 09:02:52 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 3834181DD;
        Wed, 14 Aug 2019 13:03:20 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org
Subject: [PATCH 5/5] bus: ti-sysc: Detect d2d when debug is enabled
Date:   Wed, 14 Aug 2019 06:02:40 -0700
Message-Id: <20190814130240.56202-6-tony@atomide.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190814130240.56202-1-tony@atomide.com>
References: <20190814130240.56202-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We want to see what modules probe when debug is enabled.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/bus/ti-sysc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -1266,6 +1266,8 @@ static const struct sysc_revision_quirk sysc_revision_quirks[] = {
 	SYSC_QUIRK("dcan", 0, 0x20, -1, -1, 0x4edb1902, 0xffffffff, 0),
 	SYSC_QUIRK("dmic", 0, 0, 0x10, -1, 0x50010000, 0xffffffff, 0),
 	SYSC_QUIRK("dwc3", 0, 0, 0x10, -1, 0x500a0200, 0xffffffff, 0),
+	SYSC_QUIRK("d2d", 0x4a0b6000, 0, 0x10, 0x14, 0x00000010, 0xffffffff, 0),
+	SYSC_QUIRK("d2d", 0x4a0cd000, 0, 0x10, 0x14, 0x00000010, 0xffffffff, 0),
 	SYSC_QUIRK("epwmss", 0, 0, 0x4, -1, 0x47400001, 0xffffffff, 0),
 	SYSC_QUIRK("gpu", 0, 0x1fc00, 0x1fc10, -1, 0, 0, 0),
 	SYSC_QUIRK("hsi", 0, 0, 0x10, 0x14, 0x50043101, 0xffffffff, 0),
-- 
2.21.0
