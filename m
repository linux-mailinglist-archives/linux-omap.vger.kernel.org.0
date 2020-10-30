Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D650E2A05B7
	for <lists+linux-omap@lfdr.de>; Fri, 30 Oct 2020 13:47:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726078AbgJ3MrI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 30 Oct 2020 08:47:08 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:51712 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725939AbgJ3MrI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 30 Oct 2020 08:47:08 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09UCkoSo076934;
        Fri, 30 Oct 2020 07:46:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1604062010;
        bh=2qSGOItmaUl7+k/ZKn+vgyZIOTshegTsZdVz3ypY4BI=;
        h=From:To:CC:Subject:Date;
        b=RrM+sKZwpfcMm2Vvk9npufcJFb9zHVphHeaPBV0xD6Z5UGiXjOSmBhX/f6mGBq+cu
         MoW8Bd1RSwyD8SaYXl7GSzKco6rytzJxPZL2hA324HtawglwmCnKcxjXls+NbYf6qv
         n6E9y/qRpbiz06v0Zz8fBMjQewSOgq7fcX7sWsiA=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09UCkocF013697
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 30 Oct 2020 07:46:50 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 30
 Oct 2020 07:46:50 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 30 Oct 2020 07:46:50 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09UCknBX121081;
        Fri, 30 Oct 2020 07:46:50 -0500
From:   Grygorii Strashko <grygorii.strashko@ti.com>
To:     Tony Lindgren <tony@atomide.com>, Nishanth Menon <nm@ti.com>,
        <soc@kernel.org>, Arnd Bergmann <arnd@arndb.de>
CC:     Sekhar Nori <nsekhar@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        <linux-omap@vger.kernel.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH v2] ARM: multi_v7_defconfig: ti: Enable networking options for nfs boot
Date:   Fri, 30 Oct 2020 14:46:50 +0200
Message-ID: <20201030124650.20349-1-grygorii.strashko@ti.com>
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
drivers will stay built-in.

vmlinux size changes:
- before:
   text       data        bss        dec        hex    filename
14703736    8024602     444976    23173314    16198c2    ./omap-arm/vmlinux

- after:
   text       data        bss        dec        hex    filename
14727271    8029150     444528    23200949    16204b5    ./omap-arm/vmlinux

diff: 27635 (dec)

Cc: Tony Lindgren <tony@atomide.com>
Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
Reviewed-by: Nishanth Menon <nm@ti.com>
---

changes in v2:
- rebased on top of 5.10-rc1
- commit mesage updated

 arch/arm/configs/multi_v7_defconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index e731cdf7c88c..32aaec92736b 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -154,6 +154,7 @@ CONFIG_INET6_IPCOMP=m
 CONFIG_IPV6_MIP6=m
 CONFIG_IPV6_TUNNEL=m
 CONFIG_IPV6_MULTIPLE_TABLES=y
+CONFIG_NET_SWITCHDEV=y
 CONFIG_NET_DSA=m
 CONFIG_CAN=y
 CONFIG_CAN_AT91=m
@@ -270,9 +271,12 @@ CONFIG_SNI_AVE=y
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
@@ -436,6 +440,7 @@ CONFIG_SPI_TEGRA20_SLINK=y
 CONFIG_SPI_XILINX=y
 CONFIG_SPI_SPIDEV=y
 CONFIG_SPMI=y
+CONFIG_PTP_1588_CLOCK=y
 CONFIG_PINCTRL_AS3722=y
 CONFIG_PINCTRL_RZA2=y
 CONFIG_PINCTRL_STMFX=y
-- 
2.17.1

