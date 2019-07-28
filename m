Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23D05782CC
	for <lists+linux-omap@lfdr.de>; Mon, 29 Jul 2019 02:23:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726248AbfG2AXU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 28 Jul 2019 20:23:20 -0400
Received: from gateway22.websitewelcome.com ([192.185.46.194]:46476 "EHLO
        gateway22.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726238AbfG2AXT (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Sun, 28 Jul 2019 20:23:19 -0400
X-Greylist: delayed 1459 seconds by postgrey-1.27 at vger.kernel.org; Sun, 28 Jul 2019 20:23:19 EDT
Received: from cm10.websitewelcome.com (cm10.websitewelcome.com [100.42.49.4])
        by gateway22.websitewelcome.com (Postfix) with ESMTP id E10702FD8
        for <linux-omap@vger.kernel.org>; Sun, 28 Jul 2019 18:58:59 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id rt47hR2Yq2PzOrt47hX9Pv; Sun, 28 Jul 2019 18:58:59 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
        Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=PnpOUz+ntdJPawVX2iaj0kEkJmhXCKqTbDBvO3kRWpo=; b=W0wdNcHdB5vA5TrmPC8kCcEa0o
        aLR8p+2Ta3Obw3CylGM5ig/eg9GzYkJGpClHeV8yMsE7WXKTqra27NGIywJTFNmVWCYGt4/n+fbYx
        NxaulxKYvUUZXeegrQuwKjlJCA3EoMTHUPILaHdyXAYPGTcZsBjQpPFgndfcxWFJH0DVcAMpfSZbP
        WfiS/AZqAw+f9G82dQX77HfCI+c+IPTSInqgj0jq4fCCxj+VvP8OKV9mMEjGP1mD2G/zIfG9m7hM1
        LRzQ+0WmV4xSCUZ4sJ1aDK/+ffzn5L3dHeO2L0TzSAGlsMWnyc+xz+8MEHAMpcl0JtMWmFB9tGtTQ
        l3/QQKsQ==;
Received: from [187.192.11.120] (port=39628 helo=embeddedor)
        by gator4166.hostgator.com with esmtpa (Exim 4.92)
        (envelope-from <gustavo@embeddedor.com>)
        id 1hrt46-003mmd-Pj; Sun, 28 Jul 2019 18:58:58 -0500
Date:   Sun, 28 Jul 2019 18:58:58 -0500
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Tony Lindgren <tony@atomide.com>, Lee Jones <lee.jones@linaro.org>
Cc:     linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Kees Cook <keescook@chromium.org>
Subject: [PATCH] mfd: omap-usb-host: Mark expected switch fall-throughs
Message-ID: <20190728235858.GA23755@embeddedor>
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
X-Exim-ID: 1hrt46-003mmd-Pj
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [187.192.11.120]:39628
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 57
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Mark switch cases where we are expecting to fall through.

This patch fixes the following warnings:

drivers/mfd/omap-usb-host.c: In function 'usbhs_runtime_resume':
drivers/mfd/omap-usb-host.c:303:7: warning: this statement may fall through [-Wimplicit-fallthrough=]
    if (!IS_ERR(omap->hsic480m_clk[i])) {
       ^
drivers/mfd/omap-usb-host.c:313:3: note: here
   case OMAP_EHCI_PORT_MODE_TLL:
   ^~~~
drivers/mfd/omap-usb-host.c: In function 'usbhs_runtime_suspend':
drivers/mfd/omap-usb-host.c:345:7: warning: this statement may fall through [-Wimplicit-fallthrough=]
    if (!IS_ERR(omap->hsic480m_clk[i]))
       ^
drivers/mfd/omap-usb-host.c:349:3: note: here
   case OMAP_EHCI_PORT_MODE_TLL:
   ^~~~

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/mfd/omap-usb-host.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/omap-usb-host.c b/drivers/mfd/omap-usb-host.c
index 792b855a9104..4798d9f3f9d5 100644
--- a/drivers/mfd/omap-usb-host.c
+++ b/drivers/mfd/omap-usb-host.c
@@ -308,7 +308,7 @@ static int usbhs_runtime_resume(struct device *dev)
 					 i, r);
 				}
 			}
-		/* Fall through as HSIC mode needs utmi_clk */
+		/* Fall through - as HSIC mode needs utmi_clk */
 
 		case OMAP_EHCI_PORT_MODE_TLL:
 			if (!IS_ERR(omap->utmi_clk[i])) {
@@ -344,7 +344,7 @@ static int usbhs_runtime_suspend(struct device *dev)
 
 			if (!IS_ERR(omap->hsic480m_clk[i]))
 				clk_disable_unprepare(omap->hsic480m_clk[i]);
-		/* Fall through as utmi_clks were used in HSIC mode */
+		/* Fall through - as utmi_clks were used in HSIC mode */
 
 		case OMAP_EHCI_PORT_MODE_TLL:
 			if (!IS_ERR(omap->utmi_clk[i]))
-- 
2.22.0

