Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D255387E93
	for <lists+linux-omap@lfdr.de>; Tue, 18 May 2021 19:37:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242836AbhERRi1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 18 May 2021 13:38:27 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:45142 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230223AbhERRi1 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 18 May 2021 13:38:27 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14IHb6Vt121578;
        Tue, 18 May 2021 12:37:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1621359426;
        bh=6PuA0JT/PEa+7oDo9SxVkkM4qtgIRUKE0c3oFweGC0c=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=AeUGi1HnF03ldFsKfl73eSmr3PFoAns3NESsDDj49hCEqWSTnb68MJB+MGV+0xld+
         3sk7CLiiBkCZhO7aiVc3iPiIDegiteqpaep5lPXuOydG/QZlYkq4xZWMtGSzjMIPxv
         qxDJPA6ZM9uFx2CZ4+D4wUYw5VNxGoi8OW+xyX5Q=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14IHb5wc062987
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 18 May 2021 12:37:05 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 18
 May 2021 12:37:05 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 18 May 2021 12:37:05 -0500
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14IHb5r9008293;
        Tue, 18 May 2021 12:37:05 -0500
Received: from localhost ([10.250.32.40])
        by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 14IHb5pN013869;
        Tue, 18 May 2021 12:37:05 -0500
From:   Suman Anna <s-anna@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     Jassi Brar <jaswinder.singh@linaro.org>,
        <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 2/4] ARM: dts: OMAP2/OMAP3: Rename processor sub-mailbox nodes
Date:   Tue, 18 May 2021 12:36:43 -0500
Message-ID: <20210518173645.12270-3-s-anna@ti.com>
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

The OMAP sub-mailbox used to communicate with the DSP and IVA remote
processors are currently named after the processor name. These can be
confused with the remote processors themselves. Rename them to remove
the ambiguity and use the prefix mbox to also adhere to the sub-mailbox
node name convention being added in the OMAP Mailbox YAML binding.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 arch/arm/boot/dts/omap2420.dtsi | 4 ++--
 arch/arm/boot/dts/omap2430.dtsi | 2 +-
 arch/arm/boot/dts/omap3.dtsi    | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/omap2420.dtsi b/arch/arm/boot/dts/omap2420.dtsi
index 35f8d1f6878e..bb529a2a295d 100644
--- a/arch/arm/boot/dts/omap2420.dtsi
+++ b/arch/arm/boot/dts/omap2420.dtsi
@@ -196,11 +196,11 @@ mailbox: mailbox@48094000 {
 			#mbox-cells = <1>;
 			ti,mbox-num-users = <4>;
 			ti,mbox-num-fifos = <6>;
-			mbox_dsp: dsp {
+			mbox_dsp: mbox-dsp {
 				ti,mbox-tx = <0 0 0>;
 				ti,mbox-rx = <1 0 0>;
 			};
-			mbox_iva: iva {
+			mbox_iva: mbox-iva {
 				ti,mbox-tx = <2 1 3>;
 				ti,mbox-rx = <3 1 3>;
 			};
diff --git a/arch/arm/boot/dts/omap2430.dtsi b/arch/arm/boot/dts/omap2430.dtsi
index d19d8ba3b607..23115ba61bc0 100644
--- a/arch/arm/boot/dts/omap2430.dtsi
+++ b/arch/arm/boot/dts/omap2430.dtsi
@@ -284,7 +284,7 @@ mailbox: mailbox@48094000 {
 			#mbox-cells = <1>;
 			ti,mbox-num-users = <4>;
 			ti,mbox-num-fifos = <6>;
-			mbox_dsp: dsp {
+			mbox_dsp: mbox-dsp {
 				ti,mbox-tx = <0 0 0>;
 				ti,mbox-rx = <1 0 0>;
 			};
diff --git a/arch/arm/boot/dts/omap3.dtsi b/arch/arm/boot/dts/omap3.dtsi
index c5b9da0d7e6c..574bda7a4afd 100644
--- a/arch/arm/boot/dts/omap3.dtsi
+++ b/arch/arm/boot/dts/omap3.dtsi
@@ -440,7 +440,7 @@ mailbox: mailbox@48094000 {
 			#mbox-cells = <1>;
 			ti,mbox-num-users = <2>;
 			ti,mbox-num-fifos = <2>;
-			mbox_dsp: dsp {
+			mbox_dsp: mbox-dsp {
 				ti,mbox-tx = <0 0 0>;
 				ti,mbox-rx = <1 0 0>;
 			};
-- 
2.30.1

