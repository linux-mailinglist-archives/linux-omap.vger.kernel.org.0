Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D64CB280875
	for <lists+linux-omap@lfdr.de>; Thu,  1 Oct 2020 22:27:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730045AbgJAU1v (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 1 Oct 2020 16:27:51 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:48348 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726855AbgJAU1v (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 1 Oct 2020 16:27:51 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 091KRYij031484;
        Thu, 1 Oct 2020 15:27:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1601584054;
        bh=zUXpfpiFdmkwvXzdHHcONnE58XGrF2Y+NcBdyFQGd18=;
        h=From:To:CC:Subject:Date;
        b=N5IyGadIyPyeTogzeiaI5vh16inWfy6gLqjp+vCLv6U/40ZRkAnEsM/rUct91GbTs
         2pHHvAgWQRXsrtKdAmLjIMbrZDChL6P3V2snTzxBmnVZKapqmjXc0Vkhu5cNTdfNDB
         GhFwO38+BMpX1QMTcgkDSsfaO099PwSlsHpv+xH0=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 091KRYeX092935;
        Thu, 1 Oct 2020 15:27:34 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 1 Oct
 2020 15:27:33 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 1 Oct 2020 15:27:33 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 091KRWXQ004744;
        Thu, 1 Oct 2020 15:27:33 -0500
From:   Grygorii Strashko <grygorii.strashko@ti.com>
To:     Tony Lindgren <tony@atomide.com>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, Nishanth Menon <nm@ti.com>,
        Arnd Bergmann <arnd@arndb.de>
CC:     <linux-kernel@vger.kernel.org>, Sekhar Nori <nsekhar@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Russell King <linux@armlinux.org.uk>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH] ARM: multi_v7_defconfig: ti: Enable networking options for nfs boot
Date:   Thu, 1 Oct 2020 23:27:25 +0300
Message-ID: <20201001202725.16034-1-grygorii.strashko@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Enable networking options required for NFS boot on TI platforms, which is
widely for automated test systems.
- enable new TI CPSW switch driver and related NET_SWITCHDEV config
- enable TI DP83867 phy
- explicitly enable PTP clock support to ensure dependent networking
drivers will stay built-in

Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 arch/arm/configs/multi_v7_defconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index e9e76e32f10f..11b3184d8154 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -152,6 +152,7 @@ CONFIG_INET6_IPCOMP=m
 CONFIG_IPV6_MIP6=m
 CONFIG_IPV6_TUNNEL=m
 CONFIG_IPV6_MULTIPLE_TABLES=y
+CONFIG_NET_SWITCHDEV=y
 CONFIG_NET_DSA=m
 CONFIG_CAN=y
 CONFIG_CAN_AT91=m
@@ -268,9 +269,12 @@ CONFIG_SNI_AVE=y
 CONFIG_STMMAC_ETH=y
 CONFIG_DWMAC_DWC_QOS_ETH=y
 CONFIG_TI_CPSW=y
+CONFIG_TI_CPSW_SWITCHDEV=y
+CONFIG_TI_CPTS=y
 CONFIG_XILINX_EMACLITE=y
 CONFIG_BROADCOM_PHY=y
 CONFIG_ICPLUS_PHY=y
+CONFIG_DP83867_PHY=y
 CONFIG_MARVELL_PHY=y
 CONFIG_MICREL_PHY=y
 CONFIG_AT803X_PHY=y
@@ -434,6 +438,7 @@ CONFIG_SPI_TEGRA20_SLINK=y
 CONFIG_SPI_XILINX=y
 CONFIG_SPI_SPIDEV=y
 CONFIG_SPMI=y
+CONFIG_PTP_1588_CLOCK=y
 CONFIG_PINCTRL_AS3722=y
 CONFIG_PINCTRL_RZA2=y
 CONFIG_PINCTRL_STMFX=y
-- 
2.17.1

