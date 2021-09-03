Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDE8C3FF9DB
	for <lists+linux-omap@lfdr.de>; Fri,  3 Sep 2021 07:06:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232679AbhICFHD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 3 Sep 2021 01:07:03 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:38814 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231705AbhICFHC (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 3 Sep 2021 01:07:02 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 18355pJj083943;
        Fri, 3 Sep 2021 00:05:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1630645551;
        bh=16inEFXabsPQ+5fjvMPHMEARvL9pL0EtQ7YJm/2UNcs=;
        h=From:To:CC:Subject:Date;
        b=zRgMVe7D5f06jqnvYeS2Try55WQgWxvqVYqtOXxxSIB4AMGi111ls2J03HJI8YurU
         uLs4pF3R0YRhXOISc6V8KjIy6epZ7qIL6RnjGbHdqXTLzxpx5A8uRh57yHjqGNGE1M
         +dG7YnYu6i48BGICpaOcOUKdlhZp6dXVI9S3ycTY=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 18355p1m043738
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 3 Sep 2021 00:05:51 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 3
 Sep 2021 00:05:51 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 3 Sep 2021 00:05:51 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 18355pZm090983;
        Fri, 3 Sep 2021 00:05:51 -0500
From:   Nishanth Menon <nm@ti.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-kernel@vger.kernel.org>, <linux-serial@vger.kernel.org>,
        Nishanth Menon <nm@ti.com>, Tony Lindgren <tony@atomide.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH] serial: 8250: 8250_omap: Fix RX_LVL register offset
Date:   Fri, 3 Sep 2021 00:05:50 -0500
Message-ID: <20210903050550.29050-1-nm@ti.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Commit b67e830d38fa ("serial: 8250: 8250_omap: Fix possible interrupt
storm on K3 SoCs") introduced fixup including a register read to
RX_LVL, however, we should be using word offset than byte offset
since our registers are on 4 byte boundary (port.regshift = 2) for
8250_omap.

Fixes: b67e830d38fa ("serial: 8250: 8250_omap: Fix possible interrupt storm on K3 SoCs")
Cc: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Signed-off-by: Nishanth Menon <nm@ti.com>
---

Issue discovered on simulation platform where invalid address read is forced
to generate aborts than default behavior of read of invalid address
returning 0x0 (only writes to invalid address would abort).

Test logs: https://gist.github.com/nmenon/46b1adc2be0a2e771fb848e1c799475a (am654, j721e, j7200)

There is a minor checkpatch error requesting < 75 character commit
description, but I felt breaking the Fixes line up is probably not good.

 drivers/tty/serial/8250/8250_omap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
index 891fd8345e25..73e5f1dbd075 100644
--- a/drivers/tty/serial/8250/8250_omap.c
+++ b/drivers/tty/serial/8250/8250_omap.c
@@ -106,7 +106,7 @@
 #define UART_OMAP_EFR2_TIMEOUT_BEHAVE	BIT(6)
 
 /* RX FIFO occupancy indicator */
-#define UART_OMAP_RX_LVL		0x64
+#define UART_OMAP_RX_LVL		0x19
 
 struct omap8250_priv {
 	int line;
-- 
2.32.0

