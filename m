Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FF2A69649D
	for <lists+linux-omap@lfdr.de>; Tue, 14 Feb 2023 14:23:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232711AbjBNNXo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 14 Feb 2023 08:23:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232671AbjBNNXl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 14 Feb 2023 08:23:41 -0500
Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A3295FED
        for <linux-omap@vger.kernel.org>; Tue, 14 Feb 2023 05:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1676381002; x=1678973002;
        h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=3UH2KjisQLJ7vrusBUoVcp7yffdoSC2xp8sAkP/P0Jc=;
        b=O2rKPUF5pwKb+e8FykpsWmhDEylujVOWaWxPJ9NOi3AqWrqFi5DNQBiDHamTm6JL
        3ptV4xTaNrvZHCTqpA8V8HFuqHoN80UZvr2ha7uBsomUdnEt6Hren0Jy+dp4Y28x
        zkXz7InqNYKMhR3FmkMYHxCK0aBllwv6GN3bqO9LBRE=;
X-AuditID: ac14000a-923ff70000007ecb-f0-63eb8b4a0d1d
Received: from florix.phytec.de (Unknown_Domain [172.25.0.13])
        (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client did not present a certificate)
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id F1.D9.32459.A4B8BE36; Tue, 14 Feb 2023 14:23:22 +0100 (CET)
Received: from llp-Hemer.phytec.de (172.25.0.11) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 14 Feb
 2023 14:23:22 +0100
From:   Steffen Hemer <s.hemer@phytec.de>
To:     <linux-omap@vger.kernel.org>
CC:     <upstream@lists.phytec.de>, <krzysztof.kozlowski+dt@linaro.org>,
        <robh+dt@kernel.org>, <tony@atomide.com>, <bcousson@baylibre.com>
Subject: [PATCH 7/8] ARM: dts: am335x-pcm-953: Remove superseded/invalid LED trigger.
Date:   Tue, 14 Feb 2023 14:23:01 +0100
Message-ID: <20230214132302.39087-7-s.hemer@phytec.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230214132302.39087-1-s.hemer@phytec.de>
References: <20230214132302.39087-1-s.hemer@phytec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.0.11]
X-ClientProxiedBy: Berlix.phytec.de (172.25.0.12) To Florix.phytec.de
 (172.25.0.13)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrALMWRmVeSWpSXmKPExsWyRpKBV9er+3WywanJUhZ35v9lteh78ZDZ
        YvaSfhaL1r1H2C32X/Gy6H6n7sDm8e3rJBaP9zda2T02repk87hzbQ+bR393C6vH501yAWxR
        XDYpqTmZZalF+nYJXBn9238wFsxlq7jbf4a5gbGZtYuRg0NCwETi9xWBLkYuDiGBxUwSx/+8
        ZOti5ARyHjNKbLwuCmKzCahLzN/7nR3EFhFQkDhypIkVpIFZoINRonlmN1hCWCBUYs3u5Uwg
        NouAqkTvhBtgcV4BM4mJM18xg9gSAvIS+w+eBbM5Bcwllk94A7XMTKL98B0WiHpBiZMzn4DZ
        zED1zVtnM0PYEhIHX7xghqiXk5hz6iPczGnnXkPZoRKdf+6zTGAUmoVk1Cwko2YhGbWAkXkV
        o1BuZnJ2alFmtl5BRmVJarJeSuomRlAsiDBw7WDsm+NxiJGJg/EQowQHs5IIr/DTF8lCvCmJ
        lVWpRfnxRaU5qcWHGKU5WJTEee/3MCUKCaQnlqRmp6YWpBbBZJk4OKUaGHM2tBn3uXkKa9xw
        Wv1zkXra3pTug8FeS4QTgrbxrZ+3/PzKonlvSvzu90w99ilP+SP3saeZGYWbz28KPTvXa+nq
        1p4q1p4dxR6u2Us+bVv34MEzGdbD/1kObpDMdCo0z/kmWmr+c9Z/gY/n/734d3fh41/LVrFK
        NiQayD0w2Xji/NWa8LL1G1uUWIozEg21mIuKEwGgjpq6cwIAAA==
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

According to docu and dtschema check, 'linux,default-trigger = gpio' is
no longer valid, so remove it.

Signed-off-by: Steffen Hemer <s.hemer@phytec.de>
---
 arch/arm/boot/dts/am335x-pcm-953.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/am335x-pcm-953.dtsi b/arch/arm/boot/dts/am335x-pcm-953.dtsi
index 92f2a283fe92..67c7fcc52ce6 100644
--- a/arch/arm/boot/dts/am335x-pcm-953.dtsi
+++ b/arch/arm/boot/dts/am335x-pcm-953.dtsi
@@ -36,13 +36,11 @@ user_leds: user-leds {
 
 		user-led0 {
 			gpios = <&gpio1 30 GPIO_ACTIVE_HIGH>;
-			linux,default-trigger = "gpio";
 			default-state = "on";
 		};
 
 		user-led1 {
 			gpios = <&gpio1 31 GPIO_ACTIVE_LOW>;
-			linux,default-trigger = "gpio";
 			default-state = "on";
 		};
 	};
-- 
2.34.1

