Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3BE83D7345
	for <lists+linux-omap@lfdr.de>; Tue, 27 Jul 2021 12:31:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236310AbhG0Kb5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 27 Jul 2021 06:31:57 -0400
Received: from muru.com ([72.249.23.125]:55880 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231745AbhG0Kb4 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 27 Jul 2021 06:31:56 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 24BED8106;
        Tue, 27 Jul 2021 10:32:12 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Vignesh Raghavendra <vigneshr@ti.com>,
        linux-serial@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Dario Binacchi <dariobin@libero.it>
Subject: [PATCH 2/2] serial: omap: Only allow if 8250_omap is not selected
Date:   Tue, 27 Jul 2021 13:31:49 +0300
Message-Id: <20210727103149.51175-2-tony@atomide.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210727103149.51175-1-tony@atomide.com>
References: <20210727103149.51175-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

For years we've been carrying legacy omap-serial in addition to
8250_omap driver and 8250_omap should be used instead.

Let's finally start planning on removing omap-serial by first not
building it if 8250_omap is selected to save some memory.

The defconfigs have switched over to using 8250_omap, and we have
a fixup in place for the the serial console since commit 00648d0282dc
("tty: serial: 8250: omap: add ttySx console if the user didn't").
So people updating their systems without omap-serial will see
boot time warnings on what is going on.

Cc: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Dario Binacchi <dariobin@libero.it>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/tty/serial/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
--- a/drivers/tty/serial/Kconfig
+++ b/drivers/tty/serial/Kconfig
@@ -959,7 +959,7 @@ config SERIAL_VT8500_CONSOLE
 
 config SERIAL_OMAP
 	tristate "OMAP serial port support"
-	depends on ARCH_OMAP2PLUS || COMPILE_TEST
+	depends on (ARCH_OMAP2PLUS && !SERIAL_8250_OMAP) || COMPILE_TEST
 	select SERIAL_CORE
 	help
 	  If you have a machine based on an Texas Instruments OMAP CPU you
-- 
2.32.0
