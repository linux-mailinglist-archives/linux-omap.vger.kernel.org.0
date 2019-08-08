Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FE2486C7D
	for <lists+linux-omap@lfdr.de>; Thu,  8 Aug 2019 23:33:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390151AbfHHVdH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 8 Aug 2019 17:33:07 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:42149 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730768AbfHHVdG (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 8 Aug 2019 17:33:06 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.129]) with ESMTPA (Nemesis) id
 1M4384-1hvq1D3ixU-0004a5; Thu, 08 Aug 2019 23:32:20 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     Tony Lindgren <tony@atomide.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 12/22] serial: 8250/omap1: include linux/soc/ti/omap1-soc.h
Date:   Thu,  8 Aug 2019 23:22:21 +0200
Message-Id: <20190808212234.2213262-13-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190808212234.2213262-1-arnd@arndb.de>
References: <20190808212234.2213262-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:z2A+z2co/6ENTJV8BzitLCY3ir62bsxJ3qP0RIDtuRKBSxc8W+s
 UPlAmrmnNY1b4pYyNJWHze2+YeUDZ39fPMUaKr0ayGZKiv8kD1wSSTQCecLM54dKe66RFbq
 iCcnWHfAU23Yo48rHq+twDPQTUjVS1dw3p7pkfdu6mpGnBDeMDU9k0KAgVEuXpBMe866k9N
 drVQSjjKIytwnVomi/7ww==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ElvUHXaYh/I=:v35+aAwQWvH4rVEJdqF34z
 Dlek5Xw/Ls1nDpiDTzd9kSWiltHCOuAOfCYo6Ckspm4mpx/FRuCQrGJvBCpsCddwWu9pmlkQW
 UsGbYnmzqmoFGAbOGYqIDvMcK9qVPyDHFf9Wgqy4Kqft5lcwMXPqrGnWNqy5gKTytH33pM3Bv
 6tmbXUrgtnxSmewUepzYrKzs+hxLbop8xyqQj+0g51Q2gxKSc6RzW+ieQHkLmJUV4h04tcb3n
 vk2u3PW9tPmmQy2AJrabh+AzXQYAYHQLdwrkgwCOm5fR3lDXeSRPDUNqvjkgdHI7XzNutoXDl
 D6PUZxROQfXfsHkcj7ox8/2h4Lw4qQf69kDfs6G8INQmKuuO4nBfETWtxFIhTzVasS3hUaxND
 +HdpXW7jrvxLJHm6LM5mbGaDO+e47dJHLFVwb1bAxJyeYwgC1l9637Zw7BkooP8sC/KhxZiRO
 l6lS0o7x2Cd8yLYXepmkh+T/g5oDOmgdzHf2WwGNfaMEwuphCk2uLR1vXy7pSU8fo4DFe5bLe
 FXYWoz0UMXAJntMWHir+JpGEw/yltq+BzVklCQ7z8OrDqI4diNLJ5sw6mp3cE3Lb5qqmqYAl1
 CQGlBQVN8GFtqo6FdQifBPOP9L/ZJ9wFxnn3/y/Fsnb97R4DRs3/LTWdSWsTBNcbGIpvhwiQq
 Rfbmx1ZcSeKg5nG43YcotG6uoh1Ewc2BYofFsJ0qzdbPsFS9Yhn1VYIOzHxmSsEmH0ll/yepL
 Mi374DjQA0hby5rAVx4umG/4FluKYVzsWcbrmw==
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

As a preparation for cleaning up the omap1 headers, start
including linux/soc/ti/omap1-soc.h directly so we can
keep calling cpu_is_omap1510().

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/tty/serial/8250/8250.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/tty/serial/8250/8250.h b/drivers/tty/serial/8250/8250.h
index 33ad9d6de532..9deee198fae4 100644
--- a/drivers/tty/serial/8250/8250.h
+++ b/drivers/tty/serial/8250/8250.h
@@ -263,6 +263,7 @@ static inline int fintek_8250_probe(struct uart_8250_port *uart) { return 0; }
 #endif
 
 #ifdef CONFIG_ARCH_OMAP1
+#include <linux/soc/ti/omap1-soc.h>
 static inline int is_omap1_8250(struct uart_8250_port *pt)
 {
 	int res;
-- 
2.20.0

