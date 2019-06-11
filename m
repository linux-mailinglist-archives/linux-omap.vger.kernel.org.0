Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD5083C737
	for <lists+linux-omap@lfdr.de>; Tue, 11 Jun 2019 11:30:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404395AbfFKJa4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 11 Jun 2019 05:30:56 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:45149 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727642AbfFKJa4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 11 Jun 2019 05:30:56 -0400
Received: by mail-ed1-f65.google.com with SMTP id a14so17156333edv.12;
        Tue, 11 Jun 2019 02:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=8flzYEJcuEkyJ1AH0OXfB04E7XpbRTYOxRAsuUYCYrc=;
        b=ptUAF4qZ0rEElNWbGs61q1jTEremdphbh0Nx4KtLGD8bae4CqeZY+P5dbk4OH0s0tq
         /eYly5UbsUQumNuD9Xk7XseyOg+JBKXRORRVDn3lRgYEveIdicPTQDhV0MBaDnvObVxG
         D5x2tcvXgyp8BE34r8z1538j2GIJqoPkmx1R4uqpcinRDK8f8LxE+tD1SDL6SuquaFJE
         csDAe7W1YRX6TDP5LM0a30JXGc8NzbFI3FWEGAPz2Cfh+Sp3HKjQU7X6gYpiilRQYkE9
         2WQIIujkHyqw+vKre/pr+6XEEvIxXUc9Kn9Z2EKZ67iAsOfnIo0d5/KJJs+fXwiatk8r
         76Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=8flzYEJcuEkyJ1AH0OXfB04E7XpbRTYOxRAsuUYCYrc=;
        b=CHh6RZiklcLe9XMWdyt3liWMFvHg98i5JcQM+z2moWYb/I283NnSY41MZ+wQWhwGjw
         yioAAQo70+gZOa8RP7tHNgcIoszPtGlz8lrAEnkYEqvTTG87xuswAl4Se2d+gDdxOs5R
         zNUGPs1Zmc1qGQ/OmCc4yZjvJqRdH7jw5QWPIRUkmz39LtSn1pXZav4c7TEzPpCaSHNk
         eoGDLg8V1FYs0qonc+DcjUO459d4e59NsNhIJctygRALqhH1yJnSBPDPWjn28+JpCB+x
         MHo4Y2XYQq4q8t4V2FVH33WXTatPPvWHZcWHCgr+MQNRagBY2hGL6DtOJaeLM9Bwzfvn
         aW/A==
X-Gm-Message-State: APjAAAWegcu7obcghkXfa0CB+fX7loNpK3F64JHiUEYl1kifHUmN+L0I
        H5LlKvFalMvpWItFgU3G46KFEk57
X-Google-Smtp-Source: APXvYqyrbbQNFmcA4UDfTW5MCnvxlp2KccM8qJhuSQ/hMlRthhbaKxgWlE+FzpSwpEFD3LPu+p+LOA==
X-Received: by 2002:a50:e707:: with SMTP id a7mr80066691edn.68.1560245454427;
        Tue, 11 Jun 2019 02:30:54 -0700 (PDT)
Received: from development1.visionsystems.de (mail.visionsystems.de. [213.209.99.202])
        by smtp.gmail.com with ESMTPSA id l38sm200874eda.1.2019.06.11.02.30.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jun 2019 02:30:53 -0700 (PDT)
From:   yegorslists@googlemail.com
To:     linux-omap@vger.kernel.org
Cc:     tony@atomide.com, robh+dt@kernel.org, devicetree@vger.kernel.org,
        Yegor Yefremov <yegorslists@googlemail.com>
Subject: [PATCH] ARM: dts: am335x-baltos: Fix PHY mode for ethernet
Date:   Tue, 11 Jun 2019 11:30:45 +0200
Message-Id: <20190611093045.4810-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.17.0
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Yegor Yefremov <yegorslists@googlemail.com>

The PHY must add both tx and rx delay and not only on the tx clock.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 arch/arm/boot/dts/am335x-baltos-ir2110.dts | 2 +-
 arch/arm/boot/dts/am335x-baltos-ir3220.dts | 2 +-
 arch/arm/boot/dts/am335x-baltos-ir5221.dts | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/am335x-baltos-ir2110.dts b/arch/arm/boot/dts/am335x-baltos-ir2110.dts
index 2f650a736b44..f127af2afd00 100644
--- a/arch/arm/boot/dts/am335x-baltos-ir2110.dts
+++ b/arch/arm/boot/dts/am335x-baltos-ir2110.dts
@@ -68,7 +68,7 @@
 };
 
 &cpsw_emac1 {
-	phy-mode = "rgmii-txid";
+	phy-mode = "rgmii-id";
 	dual_emac_res_vlan = <2>;
 	phy-handle = <&phy1>;
 };
diff --git a/arch/arm/boot/dts/am335x-baltos-ir3220.dts b/arch/arm/boot/dts/am335x-baltos-ir3220.dts
index 1ba66d5e21e8..058d9eb96cff 100644
--- a/arch/arm/boot/dts/am335x-baltos-ir3220.dts
+++ b/arch/arm/boot/dts/am335x-baltos-ir3220.dts
@@ -110,7 +110,7 @@
 };
 
 &cpsw_emac1 {
-	phy-mode = "rgmii-txid";
+	phy-mode = "rgmii-id";
 	dual_emac_res_vlan = <2>;
 	phy-handle = <&phy1>;
 };
diff --git a/arch/arm/boot/dts/am335x-baltos-ir5221.dts b/arch/arm/boot/dts/am335x-baltos-ir5221.dts
index eed65fc0e8e6..7b99c8ed3c3a 100644
--- a/arch/arm/boot/dts/am335x-baltos-ir5221.dts
+++ b/arch/arm/boot/dts/am335x-baltos-ir5221.dts
@@ -128,7 +128,7 @@
 };
 
 &cpsw_emac1 {
-	phy-mode = "rgmii-txid";
+	phy-mode = "rgmii-id";
 	dual_emac_res_vlan = <2>;
 	phy-handle = <&phy1>;
 };
-- 
2.17.0

