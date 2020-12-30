Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09D2E2E77DF
	for <lists+linux-omap@lfdr.de>; Wed, 30 Dec 2020 11:51:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726462AbgL3KvG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 30 Dec 2020 05:51:06 -0500
Received: from server28.superhosting.bg ([217.174.156.11]:51375 "EHLO
        server28.superhosting.bg" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726203AbgL3KvG (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 30 Dec 2020 05:51:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=dinux.eu;
         s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
        Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=5NxjBRTE6Qs/oxwd/tkNyVdQlRb6y3Ipf8TzIAmbsQY=; b=FseKKTYZsUqd8mnS3sYqqxp7rj
        AkYyTpqFimRwlO1MDHhLzkJjX20SIKelNo9nBj+eHgnRZlhtM/aFWWdN+dQ0gFybjtR654oM/H+zi
        gZbRb+daF1GvAGs6KHTibH9SPfHAAnR2/Re2KD91zorQDL5v178FOGuv3zeEhWA2t5wBDPl/Kq9pP
        GWERdnD+Ihc3nSaGttLKiIWcAiR0j0HlxMnwvULrynb34YvsLbh9+LSoO2JukNmTicjo8ilRhGYhs
        yTMS5m3j5xwK+vXtXL58PdW8AC+z9V+HK7ds/0d9Nkgv81DgKwsM+EmeGHxDBhamSy79jLebUHPrr
        UI4iaV6A==;
Received: from [95.87.234.74] (port=55922 helo=localhost.localdomain)
        by server28.superhosting.bg with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <dimitar@dinux.eu>)
        id 1kuZ3b-000C3T-Jg; Wed, 30 Dec 2020 12:50:21 +0200
From:   Dimitar Dimitrov <dimitar@dinux.eu>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     Dimitar Dimitrov <dimitar@dinux.eu>,
        Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-omap@vger.kernel.org,
        Suman Anna <s-anna@ti.com>
Subject: [PATCH v2] remoteproc: pru: Fix loading of GNU Binutils ELF
Date:   Wed, 30 Dec 2020 12:50:05 +0200
Message-Id: <20201230105005.30492-1-dimitar@dinux.eu>
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
 drivers/remoteproc/pru_rproc.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
index 2667919d76b3..5fad787ba012 100644
--- a/drivers/remoteproc/pru_rproc.c
+++ b/drivers/remoteproc/pru_rproc.c
@@ -450,6 +450,24 @@ static void *pru_i_da_to_va(struct pru_rproc *pru, u32 da, size_t len)
 	if (len == 0)
 		return NULL;
 
+	/*
+	 * GNU binutils do not support multiple address spaces. The GNU
+	 * linker's default linker script places IRAM at an arbitrary high
+	 * offset, in order to differentiate it from DRAM. Hence we need to
+	 * strip the artificial offset in the IRAM addresses coming from the
+	 * ELF file.
+	 *
+	 * The TI proprietary linker would never set those higher IRAM address
+	 * bits anyway. PRU architecture limits the program counter to 16-bit
+	 * word-address range. This in turn corresponds to 18-bit IRAM
+	 * byte-address range for ELF.
+	 *
+	 * Two more bits are added just in case to make the final 20-bit mask.
+	 * Idea is to have a safeguard in case TI decides to add banking
+	 * in future SoCs.
+	 */
+	da &= 0xfffff;
+
 	if (da >= PRU_IRAM_DA &&
 	    da + len <= PRU_IRAM_DA + pru->mem_regions[PRU_IOMEM_IRAM].size) {
 		offset = da - PRU_IRAM_DA;
-- 
2.20.1

