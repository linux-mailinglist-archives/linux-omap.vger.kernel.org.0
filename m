Return-Path: <linux-omap+bounces-3553-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B3BA7DE3F
	for <lists+linux-omap@lfdr.de>; Mon,  7 Apr 2025 14:52:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D5613A1F3F
	for <lists+linux-omap@lfdr.de>; Mon,  7 Apr 2025 12:50:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A1922505AA;
	Mon,  7 Apr 2025 12:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b="uW6DFyBw"
X-Original-To: linux-omap@vger.kernel.org
Received: from server.wki.vra.mybluehostin.me (server.wki.vra.mybluehostin.me [162.240.238.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DCD23644A;
	Mon,  7 Apr 2025 12:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.240.238.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744030231; cv=none; b=pb0Xl0d/bZmqnE6w+0kfqM15MEd6+quI0W4jMDU8ii0Qe+LgwIx5yv55l2XTwaue5RS3TQrhtf/c+rU6wP/uG+1Xt1bPUGGYCUUCbf+RsCKR8VeFA4WsWIC/fArRlxwTqjPuRYeZCWN68N+Yehkw5YMMvFE16TJ6mxw6UEavQAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744030231; c=relaxed/simple;
	bh=MswzFPLRtdF1ntuQPF4u7WKlnMDYDv/6HGwI0Ysfxos=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g+OyVOQsdAVxD7OUbZFL7lfGSEuGULip726JBgGuheN7zDFKIPUQqh9dA5yRBWzFilLFiJpcZEQezuieQLwkWRFbIuyqATavDmkfLM7XwrwlY6cTEbcjyWYIBjnqRfN4Gh+7LALGgSqqPL6fxh+LFOq1noGu+AWF7GS3skyYIcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=couthit.com; spf=pass smtp.mailfrom=couthit.com; dkim=pass (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b=uW6DFyBw; arc=none smtp.client-ip=162.240.238.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=couthit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=couthit.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=fAH/GgkaLiBmG6P+FvQ+oQsEGaCIQyFk6HSwvwijn2s=; b=uW6DFyBwSLdGbGG9aJy6tqtlIz
	pPu37KMSRVuLWMWA5tOOhECPjykuy2zwjj0rzqZqPvcZX6MaM4KGQke7RF3OigdecCu110Iht8IDG
	USrjSE1Latisgi8ivKQZKZGXuNovI2RfFDJtpow4rjyNLbYPFbkCFm0rDYL1nZb4nW58SNHwVZ+RK
	91P6h2K9BMtPIw8sqMQ+PRAOMSQT/R/xaC8gzhCXauOVyfQxdJADqZJY6BooiudJC9IraDRSv6bsr
	YBEDtZv6OSrJsn4CDLOHHp2QWr2sghzIE9TGURa/TryeG6AzD+TFv2L60SxIJKJF5ph4ypZ69QQvj
	NyacMMXA==;
Received: from [122.175.9.182] (port=42615 helo=cypher.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpa (Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1u1lvk-0000000047R-0HwI;
	Mon, 07 Apr 2025 18:20:24 +0530
From: Parvathi Pudi <parvathi@couthit.com>
To: danishanwar@ti.com,
	rogerq@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nm@ti.com,
	ssantosh@kernel.org,
	tony@atomide.com,
	richardcochran@gmail.com,
	glaroque@baylibre.com,
	schnelle@linux.ibm.com,
	m-karicheri2@ti.com,
	rdunlap@infradead.org,
	diogo.ivo@siemens.com,
	basharath@couthit.com,
	parvathi@couthit.com,
	horms@kernel.org,
	jacob.e.keller@intel.com,
	m-malladi@ti.com,
	javier.carrasco.cruz@gmail.com,
	afd@ti.com,
	s-anna@ti.com
Cc: linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	pratheesh@ti.com,
	prajith@ti.com,
	vigneshr@ti.com,
	praneeth@ti.com,
	srk@ti.com,
	rogerq@ti.com,
	krishna@couthit.com,
	pmohan@couthit.com,
	mohan@couthit.com
Subject: [PATCH net-next v4 10/11] net: ti: prueth: Adds support for PRUETH on AM33x and AM43x SOCs
Date: Mon,  7 Apr 2025 18:19:03 +0530
Message-Id: <20250407124904.1051462-11-parvathi@couthit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250407102528.1048589-1-parvathi@couthit.com>
References: <20250407102528.1048589-1-parvathi@couthit.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.wki.vra.mybluehostin.me
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - couthit.com
X-Get-Message-Sender-Via: server.wki.vra.mybluehostin.me: authenticated_id: parvathi@couthit.com
X-Authenticated-Sender: server.wki.vra.mybluehostin.me: parvathi@couthit.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

From: Roger Quadros <rogerq@ti.com>

Adds support for AM335x and AM437x datasets. Dual-EMAC and Switch mode
firmware elf file to switch between protocols at run time.

Added API hooks for IEP module (legacy 32-bit model) to support
timestamping requests from application.

Signed-off-by: Roger Quadros <rogerq@ti.com>
Signed-off-by: Andrew F. Davis <afd@ti.com>
Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>
Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
---
 drivers/net/ethernet/ti/icssg/icss_iep.c     | 61 ++++++++++++++++++++
 drivers/net/ethernet/ti/icssm/icssm_prueth.c | 32 ++++++++++
 2 files changed, 93 insertions(+)

diff --git a/drivers/net/ethernet/ti/icssg/icss_iep.c b/drivers/net/ethernet/ti/icssg/icss_iep.c
index 783cf9677be9..8522901ec721 100644
--- a/drivers/net/ethernet/ti/icssg/icss_iep.c
+++ b/drivers/net/ethernet/ti/icssg/icss_iep.c
@@ -1011,6 +1011,59 @@ static const struct icss_iep_plat_data am57xx_icss_iep_plat_data = {
 	.config = &am654_icss_iep_regmap_config,
 };
 
+static bool am335x_icss_iep_valid_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case ICSS_IEP_GLOBAL_CFG_REG ... ICSS_IEP_CAPTURE_STAT_REG:
+	case ICSS_IEP_CAP6_RISE_REG0:
+	case ICSS_IEP_CMP_CFG_REG ... ICSS_IEP_CMP0_REG0:
+	case ICSS_IEP_CMP8_REG0 ... ICSS_IEP_SYNC_START_REG:
+		return true;
+	default:
+		return false;
+	}
+
+	return false;
+}
+
+static const struct regmap_config am335x_icss_iep_regmap_config = {
+	.name = "icss iep",
+	.reg_stride = 1,
+	.reg_write = icss_iep_regmap_write,
+	.reg_read = icss_iep_regmap_read,
+	.writeable_reg = am335x_icss_iep_valid_reg,
+	.readable_reg = am335x_icss_iep_valid_reg,
+};
+
+static const struct icss_iep_plat_data am335x_icss_iep_plat_data = {
+	.flags = 0,
+	.reg_offs = {
+		[ICSS_IEP_GLOBAL_CFG_REG] = 0x00,
+		[ICSS_IEP_COMPEN_REG] = 0x08,
+		[ICSS_IEP_COUNT_REG0] = 0x0C,
+		[ICSS_IEP_CAPTURE_CFG_REG] = 0x10,
+		[ICSS_IEP_CAPTURE_STAT_REG] = 0x14,
+
+		[ICSS_IEP_CAP6_RISE_REG0] = 0x30,
+
+		[ICSS_IEP_CAP7_RISE_REG0] = 0x38,
+
+		[ICSS_IEP_CMP_CFG_REG] = 0x40,
+		[ICSS_IEP_CMP_STAT_REG] = 0x44,
+		[ICSS_IEP_CMP0_REG0] = 0x48,
+
+		[ICSS_IEP_CMP8_REG0] = 0x88,
+		[ICSS_IEP_SYNC_CTRL_REG] = 0x100,
+		[ICSS_IEP_SYNC0_STAT_REG] = 0x108,
+		[ICSS_IEP_SYNC1_STAT_REG] = 0x10C,
+		[ICSS_IEP_SYNC_PWIDTH_REG] = 0x110,
+		[ICSS_IEP_SYNC0_PERIOD_REG] = 0x114,
+		[ICSS_IEP_SYNC1_DELAY_REG] = 0x118,
+		[ICSS_IEP_SYNC_START_REG] = 0x11C,
+	},
+	.config = &am335x_icss_iep_regmap_config,
+};
+
 static const struct of_device_id icss_iep_of_match[] = {
 	{
 		.compatible = "ti,am654-icss-iep",
@@ -1020,6 +1073,14 @@ static const struct of_device_id icss_iep_of_match[] = {
 		.compatible = "ti,am5728-icss-iep",
 		.data = &am57xx_icss_iep_plat_data,
 	},
+	{
+		.compatible = "ti,am3356-icss-iep",
+		.data = &am335x_icss_iep_plat_data,
+	},
+	{
+		.compatible = "ti,am4376-icss-iep",
+		.data = &am335x_icss_iep_plat_data,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, icss_iep_of_match);
diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth.c b/drivers/net/ethernet/ti/icssm/icssm_prueth.c
index 90b5876b93ed..87b366030aa1 100644
--- a/drivers/net/ethernet/ti/icssm/icssm_prueth.c
+++ b/drivers/net/ethernet/ti/icssm/icssm_prueth.c
@@ -2122,6 +2122,10 @@ static int icssm_prueth_probe(struct platform_device *pdev)
 	}
 
 	prueth->ocmc_ram_size = OCMC_RAM_SIZE;
+	/* Decreased by 8KB to address the reserved region for AM33x */
+	if (prueth->fw_data->driver_data == PRUSS_AM33XX)
+		prueth->ocmc_ram_size = (SZ_64K - SZ_8K);
+
 	prueth->mem[PRUETH_MEM_OCMC].va =
 			(void __iomem *)gen_pool_alloc(prueth->sram_pool,
 						       prueth->ocmc_ram_size);
@@ -2365,6 +2369,32 @@ static const struct dev_pm_ops prueth_dev_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(icssm_prueth_suspend, icssm_prueth_resume)
 };
 
+/* AM335x SoC-specific firmware data */
+static struct prueth_private_data am335x_prueth_pdata = {
+	.driver_data = PRUSS_AM33XX,
+	.fw_pru[PRUSS_PRU0] = {
+		.fw_name[PRUSS_ETHTYPE_EMAC] =
+			"ti-pruss/am335x-pru0-prueth-fw.elf",
+	},
+	.fw_pru[PRUSS_PRU1] = {
+		.fw_name[PRUSS_ETHTYPE_EMAC] =
+			"ti-pruss/am335x-pru1-prueth-fw.elf",
+	},
+};
+
+/* AM437x SoC-specific firmware data */
+static struct prueth_private_data am437x_prueth_pdata = {
+	.driver_data = PRUSS_AM43XX,
+	.fw_pru[PRUSS_PRU0] = {
+		.fw_name[PRUSS_ETHTYPE_EMAC] =
+			"ti-pruss/am437x-pru0-prueth-fw.elf",
+	},
+	.fw_pru[PRUSS_PRU1] = {
+		.fw_name[PRUSS_ETHTYPE_EMAC] =
+			"ti-pruss/am437x-pru1-prueth-fw.elf",
+	},
+};
+
 /* AM57xx SoC-specific firmware data */
 static struct prueth_private_data am57xx_prueth_pdata = {
 	.driver_data = PRUSS_AM57XX,
@@ -2380,6 +2410,8 @@ static struct prueth_private_data am57xx_prueth_pdata = {
 
 static const struct of_device_id prueth_dt_match[] = {
 	{ .compatible = "ti,am57-prueth", .data = &am57xx_prueth_pdata, },
+	{ .compatible = "ti,am4376-prueth", .data = &am437x_prueth_pdata, },
+	{ .compatible = "ti,am3359-prueth", .data = &am335x_prueth_pdata, },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, prueth_dt_match);
-- 
2.34.1


