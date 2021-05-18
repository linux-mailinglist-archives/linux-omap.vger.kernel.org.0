Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 052FD387E92
	for <lists+linux-omap@lfdr.de>; Tue, 18 May 2021 19:37:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241151AbhERRiW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 18 May 2021 13:38:22 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:45128 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230223AbhERRiW (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 18 May 2021 13:38:22 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14IHb0GD121546;
        Tue, 18 May 2021 12:37:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1621359420;
        bh=ZxtJagynQ0w3EPS+CtClA0glsIoWdakPQ8+mjjmrClg=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=GUy0zvMPOl40Y4hzn2pVxVi4GSe/gmUIjGsf/NRImxWxbNQLJY9/psByYWIDGo1Lh
         ZR0XX10Bbo5zAnHv/QLHiluQKshKcAiNVdDZ0cHgIZwTtBLZey9jbp7YrNgwZNxFtt
         dRnnaKtu0idxQRqkQTEQdPPDpEhYdDXHBos4C41Y=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14IHb0VS028710
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 18 May 2021 12:37:00 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 18
 May 2021 12:37:00 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 18 May 2021 12:37:00 -0500
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14IHb06w007513;
        Tue, 18 May 2021 12:37:00 -0500
Received: from localhost ([10.250.32.40])
        by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 14IHb0f5013461;
        Tue, 18 May 2021 12:37:00 -0500
From:   Suman Anna <s-anna@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     Jassi Brar <jaswinder.singh@linaro.org>,
        <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 1/4] ARM: dts: OMAP2420: Drop interrupt-names from mailbox node
Date:   Tue, 18 May 2021 12:36:42 -0500
Message-ID: <20210518173645.12270-2-s-anna@ti.com>
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

The interrupt-names property is neither defined nor used in either
of the OMAP Mailbox binding or the driver. So, drop them. This is
in preparation for converting the OMAP Mailbox binding to YAML
format.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 arch/arm/boot/dts/omap2420.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/omap2420.dtsi b/arch/arm/boot/dts/omap2420.dtsi
index 494bf6972005..35f8d1f6878e 100644
--- a/arch/arm/boot/dts/omap2420.dtsi
+++ b/arch/arm/boot/dts/omap2420.dtsi
@@ -192,7 +192,6 @@ mailbox: mailbox@48094000 {
 			compatible = "ti,omap2-mailbox";
 			reg = <0x48094000 0x200>;
 			interrupts = <26>, <34>;
-			interrupt-names = "dsp", "iva";
 			ti,hwmods = "mailbox";
 			#mbox-cells = <1>;
 			ti,mbox-num-users = <4>;
-- 
2.30.1

