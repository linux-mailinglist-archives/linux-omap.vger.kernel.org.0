Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 037DD2B4AE
	for <lists+linux-omap@lfdr.de>; Mon, 27 May 2019 14:15:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727124AbfE0MOW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 27 May 2019 08:14:22 -0400
Received: from muru.com ([72.249.23.125]:51190 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726463AbfE0MOV (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 27 May 2019 08:14:21 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 1EB3080F3;
        Mon, 27 May 2019 12:14:40 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     Dave Gerlach <d-gerlach@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH 06/12] bus: ti-sysc: Handle swsup idle mode quirks
Date:   Mon, 27 May 2019 05:13:42 -0700
Message-Id: <20190527121348.45251-7-tony@atomide.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190527121348.45251-1-tony@atomide.com>
References: <20190527121348.45251-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Some modules have idlemodes wired, but not completely functional. We have
quirks for SWSUP_SIDLE and SWSUP_SIDLE_ACT to manage interconnect target
modules without hardware support, but we've been only using them so far
in legacy mode. Let's add support for SWSUP quirks in non-legacy mode too.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/bus/ti-sysc.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -872,10 +872,15 @@ static int sysc_enable_module(struct device *dev)
 	if (!idlemodes || regbits->sidle_shift < 0)
 		goto set_midle;
 
-	best_mode = fls(ddata->cfg.sidlemodes) - 1;
-	if (best_mode > SYSC_IDLE_MASK) {
-		dev_err(dev, "%s: invalid sidlemode\n", __func__);
-		return -EINVAL;
+	if (ddata->cfg.quirks & (SYSC_QUIRK_SWSUP_SIDLE |
+				 SYSC_QUIRK_SWSUP_SIDLE_ACT)) {
+		best_mode = SYSC_IDLE_NO;
+	} else {
+		best_mode = fls(ddata->cfg.sidlemodes) - 1;
+		if (best_mode > SYSC_IDLE_MASK) {
+			dev_err(dev, "%s: invalid sidlemode\n", __func__);
+			return -EINVAL;
+		}
 	}
 
 	reg &= ~(SYSC_IDLE_MASK << regbits->sidle_shift);
@@ -959,10 +964,14 @@ static int sysc_disable_module(struct device *dev)
 	if (!idlemodes || regbits->sidle_shift < 0)
 		return 0;
 
-	ret = sysc_best_idle_mode(idlemodes, &best_mode);
-	if (ret) {
-		dev_err(dev, "%s: invalid sidlemode\n", __func__);
-		return ret;
+	if (ddata->cfg.quirks & SYSC_QUIRK_SWSUP_SIDLE) {
+		best_mode = SYSC_IDLE_FORCE;
+	} else {
+		ret = sysc_best_idle_mode(idlemodes, &best_mode);
+		if (ret) {
+			dev_err(dev, "%s: invalid sidlemode\n", __func__);
+			return ret;
+		}
 	}
 
 	reg &= ~(SYSC_IDLE_MASK << regbits->sidle_shift);
-- 
2.21.0
