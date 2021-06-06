Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FF2439D18C
	for <lists+linux-omap@lfdr.de>; Sun,  6 Jun 2021 23:14:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230272AbhFFVQd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 6 Jun 2021 17:16:33 -0400
Received: from ns3007574.ip-87-98-218.eu ([87.98.218.168]:40904 "EHLO
        ns3007574.ip-87-98-218.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229723AbhFFVQd (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 6 Jun 2021 17:16:33 -0400
X-Greylist: delayed 497 seconds by postgrey-1.27 at vger.kernel.org; Sun, 06 Jun 2021 17:16:32 EDT
Received: from ns3007574.ip-87-98-218.eu (localhost [127.0.0.1])
        by ns3007574.ip-87-98-218.eu (8.15.2/8.15.2/Debian-18) with ESMTP id 156L5OqX2064323;
        Sun, 6 Jun 2021 21:05:24 GMT
Received: (from alucero@localhost)
        by ns3007574.ip-87-98-218.eu (8.15.2/8.15.2/Submit) id 156L5IoY2064318;
        Sun, 6 Jun 2021 21:05:18 GMT
From:   Alejandro Lucero <alucero@os3sl.com>
Cc:     alucero@os3sl.com, Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: OMAP2+: remove duplicated prototype
Date:   Sun,  6 Jun 2021 21:04:22 +0000
Message-Id: <20210606210422.2064255-1-alucero@os3sl.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The am33xx_init_early prototype is defined twice.

Signed-off-by: Alejandro Lucero <alucero@os3sl.com>
---
 arch/arm/mach-omap2/common.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/mach-omap2/common.h b/arch/arm/mach-omap2/common.h
index db446f271f5d..32f58f58515e 100644
--- a/arch/arm/mach-omap2/common.h
+++ b/arch/arm/mach-omap2/common.h
@@ -130,7 +130,6 @@ void am33xx_init_early(void);
 void am35xx_init_early(void);
 void ti814x_init_early(void);
 void ti816x_init_early(void);
-void am33xx_init_early(void);
 void am43xx_init_early(void);
 void am43xx_init_late(void);
 void omap4430_init_early(void);
-- 
2.25.1

