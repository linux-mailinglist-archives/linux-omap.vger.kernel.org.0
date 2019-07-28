Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 096FE7827B
	for <lists+linux-omap@lfdr.de>; Mon, 29 Jul 2019 01:45:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726247AbfG1Xpq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 28 Jul 2019 19:45:46 -0400
Received: from gateway21.websitewelcome.com ([192.185.45.38]:16019 "EHLO
        gateway21.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726211AbfG1Xpp (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Sun, 28 Jul 2019 19:45:45 -0400
X-Greylist: delayed 1383 seconds by postgrey-1.27 at vger.kernel.org; Sun, 28 Jul 2019 19:45:45 EDT
Received: from cm11.websitewelcome.com (cm11.websitewelcome.com [100.42.49.5])
        by gateway21.websitewelcome.com (Postfix) with ESMTP id 39475400C7AFD
        for <linux-omap@vger.kernel.org>; Sun, 28 Jul 2019 18:22:42 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id rsV0h1a5udnCersV0hV5qK; Sun, 28 Jul 2019 18:22:42 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
        Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=BmW2RfoXAHRi8AOdRBXZg9reqgHBod2XI3YMj7+4uaI=; b=Epbc1QFhThpWOZMLwZuxgHekBO
        1kEPn4X/U819iKB9MWl9+NktSUaAv6zJiAo7vkElUrWtyldYi0WnVCTYDX1W0yCYgcBursoP6oYgx
        zRfM6njao97ObDBR7j+EPWjfbZWwp2b4qQbpRcBed8m1nhYGTkeAWAWfBKEEORS6ADlSWshKn+e1I
        MaGJmoxaIbq8fRJy6t+E8Zu8kTVdvuAVBxNxE42oTEN9uHBz88Nqp7V/jbS50CL1E7lIDBpQeYGb1
        RNqNsH40FR/0N442DXnNrPvPu2xw9jocTXnex/iq46qefUfvyxRFrUOGiPbbIeMUv+ui9oK/bm4eG
        Kk1dQZJg==;
Received: from [187.192.11.120] (port=39072 helo=embeddedor)
        by gator4166.hostgator.com with esmtpa (Exim 4.92)
        (envelope-from <gustavo@embeddedor.com>)
        id 1hrsUz-003Z6H-25; Sun, 28 Jul 2019 18:22:41 -0500
Date:   Sun, 28 Jul 2019 18:22:40 -0500
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>
Cc:     linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Kees Cook <keescook@chromium.org>
Subject: [PATCH] ARM: OMAP: dma: Mark expected switch fall-throughs
Message-ID: <20190728232240.GA22393@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.192.11.120
X-Source-L: No
X-Exim-ID: 1hrsUz-003Z6H-25
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [187.192.11.120]:39072
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 25
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Mark switch cases where we are expecting to fall through.

This patch fixes the following warnings:

arch/arm/plat-omap/dma.c: In function 'omap_set_dma_src_burst_mode':
arch/arm/plat-omap/dma.c:384:6: warning: this statement may fall through [-Wimplicit-fallthrough=]
   if (dma_omap2plus()) {
      ^
arch/arm/plat-omap/dma.c:393:2: note: here
  case OMAP_DMA_DATA_BURST_16:
  ^~~~
arch/arm/plat-omap/dma.c:394:6: warning: this statement may fall through [-Wimplicit-fallthrough=]
   if (dma_omap2plus()) {
      ^
arch/arm/plat-omap/dma.c:402:2: note: here
  default:
  ^~~~~~~
arch/arm/plat-omap/dma.c: In function 'omap_set_dma_dest_burst_mode':
arch/arm/plat-omap/dma.c:473:6: warning: this statement may fall through [-Wimplicit-fallthrough=]
   if (dma_omap2plus()) {
      ^
arch/arm/plat-omap/dma.c:481:2: note: here
  default:
  ^~~~~~~

Notice that, in this particular case, the code comment is
modified in accordance with what GCC is expecting to find.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 arch/arm/plat-omap/dma.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/arch/arm/plat-omap/dma.c b/arch/arm/plat-omap/dma.c
index 79f43acf9acb..08c99413d02c 100644
--- a/arch/arm/plat-omap/dma.c
+++ b/arch/arm/plat-omap/dma.c
@@ -388,17 +388,15 @@ void omap_set_dma_src_burst_mode(int lch, enum omap_dma_burst_mode burst_mode)
 		/*
 		 * not supported by current hardware on OMAP1
 		 * w |= (0x03 << 7);
-		 * fall through
 		 */
+		/* fall through */
 	case OMAP_DMA_DATA_BURST_16:
 		if (dma_omap2plus()) {
 			burst = 0x3;
 			break;
 		}
-		/*
-		 * OMAP1 don't support burst 16
-		 * fall through
-		 */
+		/* OMAP1 don't support burst 16 */
+		/* fall through */
 	default:
 		BUG();
 	}
@@ -474,10 +472,8 @@ void omap_set_dma_dest_burst_mode(int lch, enum omap_dma_burst_mode burst_mode)
 			burst = 0x3;
 			break;
 		}
-		/*
-		 * OMAP1 don't support burst 16
-		 * fall through
-		 */
+		/* OMAP1 don't support burst 16 */
+		/* fall through */
 	default:
 		printk(KERN_ERR "Invalid DMA burst mode\n");
 		BUG();
-- 
2.22.0

