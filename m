Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C828A11DC71
	for <lists+linux-omap@lfdr.de>; Fri, 13 Dec 2019 04:07:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732013AbfLMDHZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 Dec 2019 22:07:25 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:59948 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731465AbfLMDHP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 12 Dec 2019 22:07:15 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBD37868123073;
        Thu, 12 Dec 2019 21:07:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576206428;
        bh=zmYs0/zB/kVEjKiVKzUcurkphCnzgxZPOtkxkVMJYOo=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=HEvONee7yOwaGXI9krekeApZPE/D9yuWlQ72Au2hyMkyT7svc5A0GgoMyUYaePIT6
         SvjWBaQYsnKgc5jSr542rblNcFurgfjKYE4V4bOrZxJjmlgW/axrqRQl2LPr3ywdxt
         ibJIsMRh++TXR9QqpMYhzI8D/Z9487gOPNx4BQC8=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBD378qI128874
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 12 Dec 2019 21:07:08 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 12
 Dec 2019 21:07:08 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 12 Dec 2019 21:07:08 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBD3788l058989;
        Thu, 12 Dec 2019 21:07:08 -0600
From:   Dave Gerlach <d-gerlach@ti.com>
To:     Tony Lindgren <tony@atomide.com>,
        Santosh Shilimkar <ssantosh@kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Dave Gerlach <d-gerlach@ti.com>
Subject: [PATCH 5/5] ARM: omap2plus_defconfig: Add CONFIG_ARM_CPUIDLE
Date:   Thu, 12 Dec 2019 21:07:55 -0600
Message-ID: <20191213030755.16096-6-d-gerlach@ti.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191213030755.16096-1-d-gerlach@ti.com>
References: <20191213030755.16096-1-d-gerlach@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add CONFIG_ARM_CPUIDLE and supporting CONFIG_DT_IDLE_STATES as am335x
and am437x will make use of these drivers.

Signed-off-by: Dave Gerlach <d-gerlach@ti.com>
---
 arch/arm/configs/omap2plus_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
index 8c37cc8ab6f2..84c2423cbe89 100644
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -56,6 +56,8 @@ CONFIG_CPUFREQ_DT=m
 # CONFIG_ARM_OMAP2PLUS_CPUFREQ is not set
 CONFIG_ARM_TI_CPUFREQ=y
 CONFIG_CPU_IDLE=y
+CONFIG_ARM_CPUIDLE=y
+CONFIG_DT_IDLE_STATES=y
 CONFIG_KERNEL_MODE_NEON=y
 CONFIG_PM_DEBUG=y
 CONFIG_ARM_CRYPTO=y
-- 
2.20.1

