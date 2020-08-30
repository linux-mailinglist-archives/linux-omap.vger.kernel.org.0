Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1928F256F85
	for <lists+linux-omap@lfdr.de>; Sun, 30 Aug 2020 19:34:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725934AbgH3ReT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 30 Aug 2020 13:34:19 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:44776 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbgH3ReS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 30 Aug 2020 13:34:18 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07UHYDMn100948;
        Sun, 30 Aug 2020 12:34:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1598808853;
        bh=MoOFmYEOA8VyE/6RF9dj7w1Zgs0iRQPtNiGfTNAjTus=;
        h=From:To:CC:Subject:Date;
        b=vQrXe4xwYsJoPbPY+2RvWr8BxCCfXtCksTj5YPfxNlgCMBVxkvxnJq7mqwZQdmS+X
         kFRl+/tguysr/G3StDzebQwR3R7qATRP/KooU7DXMTSCNftJPkegTsdFDBXKBhdK5n
         2VfMNXZ0+p4iFwLsp4lgmHdJKW43BRqljhmoiwlw=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07UHYD3Z024020
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sun, 30 Aug 2020 12:34:13 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Sun, 30
 Aug 2020 12:34:10 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Sun, 30 Aug 2020 12:34:10 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07UHY9NO109025;
        Sun, 30 Aug 2020 12:34:10 -0500
From:   Grygorii Strashko <grygorii.strashko@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH] ARM: omap2plus_defconfig: enable generic net options
Date:   Sun, 30 Aug 2020 20:34:01 +0300
Message-ID: <20200830173401.14825-1-grygorii.strashko@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Enable set of generic, widely used, networking  options:
- basic QoS, filter and actions
- VLAN support
- Bridge support
Use "M" build option where possible.

Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 arch/arm/configs/omap2plus_defconfig | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
index c05e041751f7..74aa66e8f1ab 100644
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -95,7 +95,18 @@ CONFIG_IP_PNP_DHCP=y
 CONFIG_IP_PNP_BOOTP=y
 CONFIG_IP_PNP_RARP=y
 CONFIG_NETFILTER=y
+CONFIG_BRIDGE=m
+CONFIG_BRIDGE_VLAN_FILTERING=y
+CONFIG_VLAN_8021Q=m
 CONFIG_PHONET=m
+CONFIG_NET_SCHED=y
+CONFIG_NET_SCH_INGRESS=m
+CONFIG_NET_CLS_U32=m
+CONFIG_NET_CLS_FLOWER=m
+CONFIG_NET_CLS_MATCHALL=m
+CONFIG_NET_CLS_ACT=y
+CONFIG_NET_ACT_POLICE=m
+CONFIG_NET_ACT_GACT=m
 CONFIG_NET_SWITCHDEV=y
 CONFIG_CAN=m
 CONFIG_CAN_C_CAN=m
-- 
2.17.1

