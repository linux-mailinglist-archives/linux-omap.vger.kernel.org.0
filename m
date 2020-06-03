Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BDAE1ED850
	for <lists+linux-omap@lfdr.de>; Thu,  4 Jun 2020 00:03:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725922AbgFCWCw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 3 Jun 2020 18:02:52 -0400
Received: from muru.com ([72.249.23.125]:56922 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726354AbgFCWCt (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 3 Jun 2020 18:02:49 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 72D84809C;
        Wed,  3 Jun 2020 22:03:38 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     "Andrew F . Davis" <afd@ti.com>, Dave Gerlach <d-gerlach@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Merlijn Wajer <merlijn@wizzup.org>
Subject: [PATCH] bus: ti-sysc: Increase max softreset wait
Date:   Wed,  3 Jun 2020 15:02:42 -0700
Message-Id: <20200603220242.24165-1-tony@atomide.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Otherwise we can get "OCP softreset timed out" warnings occasionally
at least for i2c2 on omap4 now that we check the OCP softreset completed
bit on enable.

Reported-by: Merlijn Wajer <merlijn@wizzup.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/bus/ti-sysc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -29,7 +29,7 @@
 
 #define SOC_FLAG(match, flag)	{ .machine = match, .data = (void *)(flag), }
 
-#define MAX_MODULE_SOFTRESET_WAIT		10000
+#define MAX_MODULE_SOFTRESET_WAIT		20000
 
 enum sysc_soc {
 	SOC_UNKNOWN,
-- 
2.26.2
