Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E82E3641C75
	for <lists+linux-omap@lfdr.de>; Sun,  4 Dec 2022 11:59:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229994AbiLDK7L convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-omap@lfdr.de>); Sun, 4 Dec 2022 05:59:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229983AbiLDK7J (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 4 Dec 2022 05:59:09 -0500
Received: from sender11-of-o51.zoho.eu (sender11-of-o51.zoho.eu [31.186.226.237])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B2E117E3D;
        Sun,  4 Dec 2022 02:59:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670150629; cv=none; 
        d=zohomail.eu; s=zohoarc; 
        b=R3wc7VvQ6r9YL74hp69PHG09VrZwp62uoaTsFzOgkT6orWCPwapq0I9gFgHutFNEZ/oS0o5Gs6dI4eSKOxcdPXRlXHZ7EBull9so/8vd49gU40hrNtqWI6wXwjTBGtSbLoeb18eUDkWZ8ZfztsKFd4NLA3HH6dFXr+BrjsXU56Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
        t=1670150629; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=48DdkCN0OqLMIzrs9lU9kiVd4eTRgSFTqFN8kUfEHC4=; 
        b=eipFoOK39b6NAR+6lLZJUNyo0OOQlniyFlxkGeVoaWNAmuT2ZljjsqgparPYz5vZ5HgeJ+Z9ugT0dY5me/zGBB4ZCi1NHnqvmm+hnJR5kKqgItqy+YCIueCYdOvm3gpIC2qLem/m0gPcjZJrsKAQfs0TImUN7pi18MLUBNQIRg8=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
        spf=pass  smtp.mailfrom=philipp@uvos.xyz;
        dmarc=pass header.from=<philipp@uvos.xyz>
Received: from localhost.localdomain (ip-095-222-026-199.um34.pools.vodafone-ip.de [95.222.26.199]) by mx.zoho.eu
        with SMTPS id 1670150627490311.84120852644367; Sun, 4 Dec 2022 11:43:47 +0100 (CET)
From:   Carl Philipp Klemm <philipp@uvos.xyz>
To:     linux-omap@vger.kernel.org, tony@atomide.com, sre@kernel.org
Cc:     devicetree@vger.kernel.org, Carl Philipp Klemm <philipp@uvos.xyz>
Message-ID: <20221204104313.17478-3-philipp@uvos.xyz>
Subject: [PATCH 3/4] dt-bindings: leds: leds-cpcap
Date:   Sun,  4 Dec 2022 11:43:12 +0100
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221204104313.17478-1-philipp@uvos.xyz>
References: <20221204104313.17478-1-philipp@uvos.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
X-ZohoMailClient: External
Content-Type: text/plain; charset=utf8
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,FROM_SUSPICIOUS_NTLD,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

update bindgins as cpcap-led has been removed from the mdf device

Signed-off-by: Carl Philipp Klemm <philipp@uvos.xyz>
---
 Documentation/devicetree/bindings/leds/leds-cpcap.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-cpcap.txt b/Documentation/devicetree/bindings/leds/leds-cpcap.txt
index ebf7cdc7f70c..b78a26a0acf0 100644
--- a/Documentation/devicetree/bindings/leds/leds-cpcap.txt
+++ b/Documentation/devicetree/bindings/leds/leds-cpcap.txt
@@ -17,13 +17,15 @@ Requires node properties:
    * "motorola,cpcap-led-cp"		(Camera Privacy LED)
 - label: see Documentation/devicetree/bindings/leds/common.txt
 - vdd-supply: A phandle to the regulator powering the LED
+- cpcap-phandle: A phandle to the cpcap mfd device node
 
 Example:
 
-&cpcap {
+/ {
 	cpcap_led_red: red-led {
 		compatible = "motorola,cpcap-led-red";
 		label = "cpcap:red";
 		vdd-supply = <&sw5>;
+		cpcap-phandle = <&cpcap>;
 	};
 };
-- 
2.38.1


