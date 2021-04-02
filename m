Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5EAF352FAD
	for <lists+linux-omap@lfdr.de>; Fri,  2 Apr 2021 21:22:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236455AbhDBTWL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 2 Apr 2021 15:22:11 -0400
Received: from smtp-17.italiaonline.it ([213.209.10.17]:48550 "EHLO libero.it"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236491AbhDBTWI (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 2 Apr 2021 15:22:08 -0400
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([87.20.116.197])
        by smtp-17.iol.local with ESMTPA
        id SPLllsyFltpGHSPLrl2Fss; Fri, 02 Apr 2021 21:21:04 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1617391264; bh=up9YaF3qqoP9Rj40HYk4B0Nz1BazHLAaOp1YNJrouIQ=;
        h=From;
        b=TESdbrATyjqXIX85pZvAX3TDDFhu1d8EuzTDMZKnFdDL03IgwZxErC54yPsHyMs16
         3Au4op54V2NDSZHE0BqSsSTGKof6QyZZwXVqYIy9eukV0jZ2nn0t9hJy69TA0/DWyH
         3JTW/7JB78fuk5XgTvYcNKaUmdGe2vt3rSG3jnCpPWQ8KB/iGmUndQlSSyxAND6pn2
         MTA7JJ4E+JN3DjaGyPXLaJfow6t42D8eYPcKiRoNqsmx8nbzqPSftRXiKed5fnmOde
         qYA+peprbJ7zO484M1OPxfvW6blNYI3yuxEIZjhK6+m4nGZzLFpyLzJzOsj8VdbSbb
         hCAIh/Wl8hAAQ==
X-CNFS-Analysis: v=2.4 cv=Q7IXX66a c=1 sm=1 tr=0 ts=60676ea0 cx=a_exe
 a=AVqmXbCQpuNSdJmApS5GbQ==:117 a=AVqmXbCQpuNSdJmApS5GbQ==:17
 a=iFnIn8U_QRK4IMTQmbIA:9
From:   Dario Binacchi <dariobin@libero.it>
To:     linux-kernel@vger.kernel.org
Cc:     Dario Binacchi <dariobin@libero.it>, Bin Meng <bmeng.cn@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Tero Kristo <kristo@kernel.org>, linux-clk@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: [PATCH 2/2] clk: ti: get register address from device tree
Date:   Fri,  2 Apr 2021 21:20:54 +0200
Message-Id: <20210402192054.7934-3-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210402192054.7934-1-dariobin@libero.it>
References: <20210402192054.7934-1-dariobin@libero.it>
X-CMAE-Envelope: MS4xfCGuF4rrqDQOKDnnBQ7lm1YBN4uFpPE/WplwIiVTXbXv+UuvDo0U8eLC6wzT4orWzSwcPRCSbZaotZfsRorvRTYC6CV97ZfTwWpKVmylDgqjZ4v4ckQ/
 Sltsu/PCfcWVeeqcRCDPUas4W/3xQJEw3wPQY0mLI2tb/19vjHfIOJwOm2/lL34tbVGJsOqbOOSe2kllFLzFU+7q0F35qPnEbGtdcIB04DL+FNfsGfX0PdVP
 8oJgJwbUaxQY1QfY6t5AbhTW/5yNZ6fv3vjvNXpt45zZ8w0k3rmeQEt/6hM7x2abd+7+wJcIPPligRZRC9LH3Hbl5j0IyHY7Blch/jLdzd8WcDpV9x4EFN2l
 ZREezdkoUuMTx75NSLCdTpaNAsldVBI2zte9O+ZL2/IjcO8hOVdeEFZ1yVf+kg8tvIeWVC/YiEgu7c7MpqtfJ55Jp0tOENnt4v/s0b0m+C0aXa2ff84=
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Until now, only the register offset was retrieved from the device tree
to be added, during access, to a common base address for the clocks.
If possible, we try to retrieve the physical address of the register
directly from the device tree.

Signed-off-by: Dario Binacchi <dariobin@libero.it>

---

 drivers/clk/ti/clk.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/ti/clk.c b/drivers/clk/ti/clk.c
index 3da33c786d77..938f5a2cb425 100644
--- a/drivers/clk/ti/clk.c
+++ b/drivers/clk/ti/clk.c
@@ -265,9 +265,21 @@ int __init ti_clk_retry_init(struct device_node *node, void *user,
 int ti_clk_get_reg_addr(struct device_node *node, int index,
 			struct clk_omap_reg *reg)
 {
+	const __be32 *addrp;
+	u64 size, addr = OF_BAD_ADDR;
+	unsigned int flags;
 	u32 val;
 	int i;
 
+	addrp = of_get_address(node, index, &size, &flags);
+	if (addrp)
+		addr = of_translate_address(node, addrp);
+
+	if (addr != OF_BAD_ADDR) {
+		reg->ptr = ioremap(addr, sizeof(u32));
+		return 0;
+	}
+
 	for (i = 0; i < CLK_MAX_MEMMAPS; i++) {
 		if (clocks_node_ptr[i] == node->parent)
 			break;
@@ -287,7 +299,6 @@ int ti_clk_get_reg_addr(struct device_node *node, int index,
 
 	reg->offset = val;
 	reg->ptr = NULL;
-
 	return 0;
 }
 
-- 
2.17.1

