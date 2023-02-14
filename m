Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 552CF696491
	for <lists+linux-omap@lfdr.de>; Tue, 14 Feb 2023 14:23:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231572AbjBNNXi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 14 Feb 2023 08:23:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231905AbjBNNXh (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 14 Feb 2023 08:23:37 -0500
Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0796F26BF
        for <linux-omap@vger.kernel.org>; Tue, 14 Feb 2023 05:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1676381001; x=1678973001;
        h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=lSAGC0befrtEsAJoKdXnmrUDVAszhEwwrhqOg28896s=;
        b=VC+NS1pHTdHIreQ8vQ/1hjtYsgCkRox6NF86QTrNCJzSAPp2k/sh7K116xwxJcnO
        /mJUPIS+bGc1EB7W0EKH5ACG6fSznK8U0nFgvWQgza4290CBePGMM+5Q1JEZrDd5
        q1dkPc9j078cJBgHJtbTczF0jEOQwfnx7NufVpCNOMs=;
X-AuditID: ac14000a-917fe70000007ecb-ea-63eb8b49316a
Received: from florix.phytec.de (Unknown_Domain [172.25.0.13])
        (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client did not present a certificate)
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 5F.C9.32459.94B8BE36; Tue, 14 Feb 2023 14:23:21 +0100 (CET)
Received: from llp-Hemer.phytec.de (172.25.0.11) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 14 Feb
 2023 14:23:21 +0100
From:   Steffen Hemer <s.hemer@phytec.de>
To:     <linux-omap@vger.kernel.org>
CC:     <upstream@lists.phytec.de>, <krzysztof.kozlowski+dt@linaro.org>,
        <robh+dt@kernel.org>, <tony@atomide.com>, <bcousson@baylibre.com>
Subject: [PATCH 1/8] ARM: dts: am335x-phycore-som: Add alias for TPS65910 RTC
Date:   Tue, 14 Feb 2023 14:22:55 +0100
Message-ID: <20230214132302.39087-1-s.hemer@phytec.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.0.11]
X-ClientProxiedBy: Berlix.phytec.de (172.25.0.12) To Florix.phytec.de
 (172.25.0.13)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOLMWRmVeSWpSXmKPExsWyRpKBV9ez+3WywdcdehZ35v9lteh78ZDZ
        YvaSfhaL1r1H2C32X/Gy6H6n7sDm8e3rJBaP9zda2T02repk87hzbQ+bR393C6vH501yAWxR
        XDYpqTmZZalF+nYJXBlv/+9jLvjIUrG6266B8T9zFyMHh4SAicSNQ2pdjFwcQgKLmSTOLNrM
        COE8ZpR4PO8HUxcjJwebgLrE/L3f2UFsEQEFiSNHmlhBipgFOhglmmd2gyWEBXwl+hecYgSx
        WQRUJZ7O7WAB2cArYCbx/BozSFhCQF5i/8GzYDavgKDEyZlPWEBsZqB489bZzBC2hMTBFy/A
        bCEBOYk5pz7C9U479xrKDpXo/HOfZQKjwCwko2YhGTULyagFjMyrGIVyM5OzU4sys/UKMipL
        UpP1UlI3MYICW4SBawdj3xyPQ4xMHIyHGCU4mJVEeIWfvkgW4k1JrKxKLcqPLyrNSS0+xCjN
        waIkznu/hylRSCA9sSQ1OzW1ILUIJsvEwSnVwDi59IezU+rJHq5JD8+G7c+SWH2hKPtEEvOP
        19EBxiYfVJs1N2k5/+AQ122bWTDH4tsD9beB6lOFHRexrrZe/ahk1/nS2ukMjIc3PjnI52dx
        0mTpxeqqmPXTlN2v/W3IXcBb4lXo8cq8a3qlkdBL7hbzN1oab2RvPBTeefJV8xPD99POVKWr
        uiixFGckGmoxFxUnAgB9LOnSWgIAAA==
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Without an alias for the TPS65910 RTC, it snatches the rtc0 device in
advance to the I2C RTC assigned to that alias.

Signed-off-by: Steffen Hemer <s.hemer@phytec.de>
---
 arch/arm/boot/dts/am335x-phycore-som.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/am335x-phycore-som.dtsi b/arch/arm/boot/dts/am335x-phycore-som.dtsi
index e2cec1ffaa4c..6819cec588a7 100644
--- a/arch/arm/boot/dts/am335x-phycore-som.dtsi
+++ b/arch/arm/boot/dts/am335x-phycore-som.dtsi
@@ -14,6 +14,7 @@ / {
 	aliases {
 		rtc0 = &i2c_rtc;
 		rtc1 = &rtc;
+		rtc2 = &tps;
 	};
 
 	cpus {
-- 
2.34.1

