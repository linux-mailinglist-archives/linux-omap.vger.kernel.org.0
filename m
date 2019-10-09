Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2031DD1052
	for <lists+linux-omap@lfdr.de>; Wed,  9 Oct 2019 15:39:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731138AbfJINjL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 9 Oct 2019 09:39:11 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:58219 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731083AbfJINjK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 9 Oct 2019 09:39:10 -0400
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1iICBE-0007Zc-6m; Wed, 09 Oct 2019 14:39:04 +0100
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.2)
        (envelope-from <ben@rainbowdash.codethink.co.uk>)
        id 1iICBD-0007Ow-Nt; Wed, 09 Oct 2019 14:39:03 +0100
From:   Ben Dooks <ben.dooks@codethink.co.uk>
To:     linux-kernel@lists.codethink.co.uk
Cc:     Ben Dooks <ben.dooks@codethink.co.uk>,
        Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Subject: [PATCH] ARM: OMAP2+: force iomem for omap_interconnect_sync
Date:   Wed,  9 Oct 2019 14:39:02 +0100
Message-Id: <20191009133902.28405-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Force the type of omap_interconnect_sync to avoid the
following sparse warnign:

arch/arm/mach-omap2/omap4-common.c:142:27: warning: incorrect type in assignment (different address spaces)
arch/arm/mach-omap2/omap4-common.c:142:27:    expected void [noderef] <asn:2> *static [toplevel] sram_sync
arch/arm/mach-omap2/omap4-common.c:142:27:    got void *

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
Cc: Tony Lindgren <tony@atomide.com>
Cc: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-omap@vger.kernel.org
---
 arch/arm/mach-omap2/omap4-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap2/omap4-common.c b/arch/arm/mach-omap2/omap4-common.c
index 5c3845730dbf..d27c5f61d708 100644
--- a/arch/arm/mach-omap2/omap4-common.c
+++ b/arch/arm/mach-omap2/omap4-common.c
@@ -139,7 +139,7 @@ static int __init omap4_sram_init(void)
 		pr_warn("%s:Unable to get sram pool needed to handle errata I688\n",
 			__func__);
 	else
-		sram_sync = (void *)gen_pool_alloc(sram_pool, PAGE_SIZE);
+		sram_sync = (void __force __iomem *)gen_pool_alloc(sram_pool, PAGE_SIZE);
 
 	return 0;
 }
-- 
2.23.0

