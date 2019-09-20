Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C7D2B8C2A
	for <lists+linux-omap@lfdr.de>; Fri, 20 Sep 2019 10:00:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405211AbfITIAJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 20 Sep 2019 04:00:09 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:43958 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405200AbfITIAI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 20 Sep 2019 04:00:08 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8K7xviX035637;
        Fri, 20 Sep 2019 02:59:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568966397;
        bh=NxwuVo0T+us0h+x9zXFAnE213YwmEGZylga/7E0/EBk=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=HZXB9zcnSX5YTG+7J0OU8B40rk6GHtc7DWGesWjWv01vGLQxjDdtYb7LRRIKRiUia
         cJVqFJUCq5hkLOb+iSTS/PZre4nhwACLXiwArrfmyjhokxEuPOC8GXmW+YkPL7FXSe
         yFNd0XcgOEFm/ahQ6Abb68zev+O8Ykd/ICCyqQ9I=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8K7xvn9033720;
        Fri, 20 Sep 2019 02:59:57 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 20
 Sep 2019 02:59:56 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 20 Sep 2019 02:59:52 -0500
Received: from a0393675ula.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8K7xeXV118255;
        Fri, 20 Sep 2019 02:59:53 -0500
From:   Keerthy <j-keerthy@ti.com>
To:     <arnd@arndb.de>, <nsekhar@ti.com>, <olof@lixom.net>,
        <t-kristo@ti.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
        <tony@atomide.com>
CC:     <s-anna@ti.com>, <hch@lst.de>, <bjorn.andersson@linaro.org>,
        <j-keerthy@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 linux-next 3/4] arm: configs: multi_v7_defconfig: Change CONFIG_REMOTEPROC  from m to y
Date:   Fri, 20 Sep 2019 13:29:45 +0530
Message-ID: <20190920075946.13282-4-j-keerthy@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190920075946.13282-1-j-keerthy@ti.com>
References: <20190920075946.13282-1-j-keerthy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Commit 6334150e9a36 ("remoteproc: don't allow modular build")
changes CONFIG_REMOTEPROC to a boolean from a tristate config
option which inhibits all defconfigs marking CONFIG_REMOTEPROC as
a module in compiling the remoteproc and dependent config options.

So fix the multi_v7_defconfig to have CONFIG_REMOTEPROC built in.

Fixes: 6334150e9a36 ("remoteproc: don't allow modular build")
Signed-off-by: Keerthy <j-keerthy@ti.com>
---
 arch/arm/configs/multi_v7_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 13ba53286901..198de8e36d92 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -933,7 +933,7 @@ CONFIG_BCM2835_MBOX=y
 CONFIG_ROCKCHIP_IOMMU=y
 CONFIG_TEGRA_IOMMU_GART=y
 CONFIG_TEGRA_IOMMU_SMMU=y
-CONFIG_REMOTEPROC=m
+CONFIG_REMOTEPROC=y
 CONFIG_ST_REMOTEPROC=m
 CONFIG_RPMSG_VIRTIO=m
 CONFIG_ASPEED_LPC_CTRL=m
-- 
2.17.1

