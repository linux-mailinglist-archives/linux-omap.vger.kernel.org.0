Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3C2A2E34FD
	for <lists+linux-omap@lfdr.de>; Mon, 28 Dec 2020 09:18:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726486AbgL1IR4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 28 Dec 2020 03:17:56 -0500
Received: from server28.superhosting.bg ([217.174.156.11]:38724 "EHLO
        server28.superhosting.bg" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726470AbgL1IR4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 28 Dec 2020 03:17:56 -0500
X-Greylist: delayed 1644 seconds by postgrey-1.27 at vger.kernel.org; Mon, 28 Dec 2020 03:17:54 EST
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=dinux.eu;
         s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
        Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=tZuFaG5joET93VOBoGovQ+P9CJGFAP2C2y5iFf+oEZQ=; b=TKWh38ujgVcC5yELFfnHLdSTc0
        feeQhH3To9cLhc23aTQvcDAdYgwiSdBGZB5iSuFx6gvm+OfEtW5aTj78W9mjNwp0vZlT1F/G3cJWi
        Mr3S0okq6S4l0Jdb7J2zAXLzbvrAlJbZTR8ODOW/N0G3/Q9Dd9GT9WkrRP7HRmQ2k2DL/5SAQqflP
        n+vR8W2ddnTNS+CNGInqeK3FenFYSr7Il903z3AcgkcF79uutotf4PT1Xco6YNYS3VyAbUu2ub3vq
        2SRJvotSqcsTKGvBhMpYgqZKbABy/+ZeuMjTHp7kLyR/ULAivMZXhNcNYVZL4KLmlMdn75bIK2r97
        3+kCrOfw==;
Received: from [95.87.234.74] (port=40156 helo=localhost.localdomain)
        by server28.superhosting.bg with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <dimitar@dinux.eu>)
        id 1ktnHl-0000iW-S4; Mon, 28 Dec 2020 09:49:48 +0200
From:   Dimitar Dimitrov <dimitar@dinux.eu>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     Dimitar Dimitrov <dimitar@dinux.eu>,
        Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-omap@vger.kernel.org,
        Suman Anna <s-anna@ti.com>
Subject: [PATCH] remoteproc: pru: Fix loading of GNU Binutils ELF
Date:   Mon, 28 Dec 2020 09:49:33 +0200
Message-Id: <20201228074933.22675-1-dimitar@dinux.eu>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OutGoing-Spam-Status: No, score=-0.2
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server28.superhosting.bg
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - dinux.eu
X-Get-Message-Sender-Via: server28.superhosting.bg: authenticated_id: dimitar@dinux.eu
X-Authenticated-Sender: server28.superhosting.bg: dimitar@dinux.eu
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

PRU port of GNU Binutils lacks support for separate address spaces.
PRU IRAM addresses are marked with artificial offset to differentiate
them from DRAM addresses. Hence remoteproc must mask IRAM addresses
coming from GNU ELF in order to get the true hardware address.

Patch was tested on top of latest linux-remoteproc/for-next branch:
  commit 4c0943255805 ("Merge branches 'hwspinlock-next', 'rpmsg-next' and 'rproc-next' into for-next")'

PRU firmware used for testing was the example in:
  https://github.com/dinuxbg/pru-gcc-examples/tree/master/blinking-led/pru

Signed-off-by: Dimitar Dimitrov <dimitar@dinux.eu>
---
 drivers/remoteproc/pru_rproc.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
index 2667919d76b3..b03114bbb9ab 100644
--- a/drivers/remoteproc/pru_rproc.c
+++ b/drivers/remoteproc/pru_rproc.c
@@ -61,6 +61,18 @@
 #define PRU_SDRAM_DA	0x2000	/* Secondary Data RAM */
 #define PRU_SHRDRAM_DA	0x10000 /* Shared Data RAM */
 
+/*
+ * GNU binutils do not support multiple address spaces. The GNU linker's
+ * default linker script places IRAM at an arbitrary high offset, in order
+ * to differentiate it from DRAM. Hence we need to strip the artificial offset
+ * in the IRAM addresses coming from the ELF file.
+ *
+ * The TI proprietary linker would never set those higher IRAM address bits
+ * anyway. PRU architecture limits the program counter to 16 bit word
+ * addresses.
+ */
+#define PRU_IRAM_DA_MASK	0xfffff
+
 #define MAX_PRU_SYS_EVENTS 160
 
 /**
@@ -450,6 +462,8 @@ static void *pru_i_da_to_va(struct pru_rproc *pru, u32 da, size_t len)
 	if (len == 0)
 		return NULL;
 
+	da &= PRU_IRAM_DA_MASK;
+
 	if (da >= PRU_IRAM_DA &&
 	    da + len <= PRU_IRAM_DA + pru->mem_regions[PRU_IOMEM_IRAM].size) {
 		offset = da - PRU_IRAM_DA;
-- 
2.20.1

