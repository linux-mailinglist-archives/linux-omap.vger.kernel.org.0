Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BB13387E95
	for <lists+linux-omap@lfdr.de>; Tue, 18 May 2021 19:37:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343605AbhERRic (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 18 May 2021 13:38:32 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:45156 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344033AbhERRic (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 18 May 2021 13:38:32 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14IHbBxs121616;
        Tue, 18 May 2021 12:37:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1621359431;
        bh=PP0glKOo9BBkOzqcbeN07uHeVMq3WA6dmnAPZ/ftyeM=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=YcwuNQ3AzXPMqvLlGxp4lW0aTqN6YwWHwArn54Xl41HzQncEJZvVO9JJQ8D1J0NvL
         bYVi1X2HWI+d7CKmEnu6KPxEr7VtiTZNKJnPVAhmAGkkhzdC6wOdxTgjD8Av3kZMyI
         XxsWpW4JmagjXNTB1nz/KOj/aY1Nv/DlSG3neBbw=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14IHbBkf125765
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 18 May 2021 12:37:11 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 18
 May 2021 12:37:10 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 18 May 2021 12:37:10 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14IHbA3w114305;
        Tue, 18 May 2021 12:37:10 -0500
Received: from localhost ([10.250.32.40])
        by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 14IHbAxd127021;
        Tue, 18 May 2021 12:37:10 -0500
From:   Suman Anna <s-anna@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     Jassi Brar <jaswinder.singh@linaro.org>,
        <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 3/4] ARM: dts: AM33xx/AM43xx: Rename wkup_m3 sub-mailbox node
Date:   Tue, 18 May 2021 12:36:44 -0500
Message-ID: <20210518173645.12270-4-s-anna@ti.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210518173645.12270-1-s-anna@ti.com>
References: <20210518173645.12270-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The OMAP sub-mailbox used to communicate with the Wakeup M3 remote
processor is currently named wkup_m3. This name can be confused with
the remote processor node. So, rename this to mbox-wkup-m3 to remove
the ambiguity and to also adhere to the sub-mailbox node name convention
being added in the OMAP Mailbox YAML binding.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 arch/arm/boot/dts/am33xx-l4.dtsi | 2 +-
 arch/arm/boot/dts/am437x-l4.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
index 039a9ab4c7ea..50663b506205 100644
--- a/arch/arm/boot/dts/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/am33xx-l4.dtsi
@@ -1486,7 +1486,7 @@ mailbox: mailbox@0 {
 				#mbox-cells = <1>;
 				ti,mbox-num-users = <4>;
 				ti,mbox-num-fifos = <8>;
-				mbox_wkupm3: wkup_m3 {
+				mbox_wkupm3: mbox-wkup-m3 {
 					ti,mbox-send-noirq;
 					ti,mbox-tx = <0 0 0>;
 					ti,mbox-rx = <0 0 3>;
diff --git a/arch/arm/boot/dts/am437x-l4.dtsi b/arch/arm/boot/dts/am437x-l4.dtsi
index e217ffc09770..667086297f36 100644
--- a/arch/arm/boot/dts/am437x-l4.dtsi
+++ b/arch/arm/boot/dts/am437x-l4.dtsi
@@ -1168,7 +1168,7 @@ mailbox: mailbox@0 {
 				#mbox-cells = <1>;
 				ti,mbox-num-users = <4>;
 				ti,mbox-num-fifos = <8>;
-				mbox_wkupm3: wkup_m3 {
+				mbox_wkupm3: mbox-wkup-m3 {
 					ti,mbox-send-noirq;
 					ti,mbox-tx = <0 0 0>;
 					ti,mbox-rx = <0 0 3>;
-- 
2.30.1

