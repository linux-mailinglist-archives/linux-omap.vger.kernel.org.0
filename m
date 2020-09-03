Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E69625C8EA
	for <lists+linux-omap@lfdr.de>; Thu,  3 Sep 2020 20:42:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728419AbgICSma (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 3 Sep 2020 14:42:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729206AbgICSmG (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 3 Sep 2020 14:42:06 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B02BC061245
        for <linux-omap@vger.kernel.org>; Thu,  3 Sep 2020 11:42:06 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id q8so2477593lfb.6
        for <linux-omap@vger.kernel.org>; Thu, 03 Sep 2020 11:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=la3rayP+shNhCjAj+vlh2ZfEe6vHZcwR5ouMWRq/FdU=;
        b=q786MTMUmpFS5XzxSh74G7fb0nr6/VnChNjVh2MAP/CZsWEtlLlCy3Q3GfZL8gzqtI
         66CiHBZGAjmzzwfXm6MaTdLYP/ZHXkNwLhqPFX/ILH/hqzxyZCEY5oU6JnqtLUFjQeJz
         Lpwaz3dkXMk9V7YWM/ILguAgDIafvUEN6F/PRmIyiBptf2MofCMjiwM0wxOtOh7UDHm2
         z1fcteIbp9YIUijTtFco8UT+Jolg+QMoZoog5zzDyU+0k00fyr/wMDQH6LooMPm7HNlV
         Wljycwo3jzqCaaP3NtwEzYtL4+LqMBRg5XdCCDOFqhV1hww8sjxe29QAsvzsHz3A+uKF
         kmNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=la3rayP+shNhCjAj+vlh2ZfEe6vHZcwR5ouMWRq/FdU=;
        b=rv/6yfXyLJ5Gsz+fSv2BW7+vo7IG6+rpZk/aS4yw0OAvcKM3sOwTkIu3hvmrUaPyX4
         VkKPmUvoPHRvrHBhO3W7MEmLaeYdNn0GbV4XZ57ypWbAeHtbgVpgeXNYoNiP47ICEuUo
         hy7HeW+jzhwzZ1za9o2w4Zyai3i3GaxlMKNQqceFjx3k8cfVpHngMyGgeHn+twADnrin
         8OR1zBCoEYRtteuGaqSitZOoDEYJRIAqf6g7eyMeV0DxD3U/RJyLdaSykMFhhBYb3vE7
         l+LbUBORdorqTMGI5rf91hhwcOdDjzTTQze3HE2v/yZpjvmh7eIVzKKpS2Q4BLBMQxBF
         D7CA==
X-Gm-Message-State: AOAM531dEvUylYM5gWSEZjhkuzd+gvNAjbPyeV6QePJ9sevcmsUCxIqS
        zds1LDaSJC0skP2wzulDYGL7ww==
X-Google-Smtp-Source: ABdhPJzfpGLRSVtpy4C/LTQxtvrRsUow4ysn5M0vYtXK9dFwIXA3VEswJRHTVIvDcm9a8ams6Nmb3Q==
X-Received: by 2002:a19:834a:: with SMTP id f71mr2000398lfd.59.1599158523970;
        Thu, 03 Sep 2020 11:42:03 -0700 (PDT)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id r8sm754854lfm.42.2020.09.03.11.42.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Sep 2020 11:42:03 -0700 (PDT)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     ssantosh@kernel.org, s-anna@ti.com
Cc:     grzegorz.jaszczyk@linaro.org, santosh.shilimkar@oracle.com,
        robh+dt@kernel.org, lee.jones@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        praneeth@ti.com, tony@atomide.com
Subject: [PATCH 1/2] dt-bindings: soc: ti: Update TI PRUSS bindings regarding clock-muxes
Date:   Thu,  3 Sep 2020 20:41:40 +0200
Message-Id: <1599158501-8302-2-git-send-email-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599158501-8302-1-git-send-email-grzegorz.jaszczyk@linaro.org>
References: <1599158501-8302-1-git-send-email-grzegorz.jaszczyk@linaro.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

ICSS/ICSSG modules have an IEP clock mux that allow selection of
internal IEP clock from 2 clock sources.

ICSSG module has a CORE clock mux that allows selection of internal CORE
clock from 2 clock sources.

Add binding information for these 2 clock muxes.

Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
---
 .../devicetree/bindings/soc/ti/ti,pruss.yaml       | 121 ++++++++++++++++++++-
 1 file changed, 120 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml b/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
index a13e4df..037c51b 100644
--- a/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
+++ b/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
@@ -132,10 +132,99 @@ patternProperties:
           - const: ti,pruss-cfg
           - const: syscon
 
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 1
+
       reg:
         maxItems: 1
 
-    additionalProperties: false
+      ranges:
+        maxItems: 1
+
+      clocks:
+        type: object
+
+        properties:
+          "#address-cells":
+            const: 1
+
+          "#size-cells":
+            const: 0
+
+        patternProperties:
+          coreclk-mux@[a-f0-9]+$:
+            description: |
+              This is applicable only for ICSSG (K3 SoCs). The ICSSG modules
+              core clock can be set to one of the 2 sources: ICSSG_CORE_CLK or
+              ICSSG_ICLK.  This node models this clock mux and should have the
+              name "coreclk-mux".
+
+            type: object
+
+            properties:
+              '#clock-cells':
+                const: 0
+
+              clocks:
+                items:
+                  - description: ICSSG_CORE Clock
+                  - description: ICSSG_ICLK Clock
+
+              assigned-clocks:
+                maxItems: 1
+
+              assigned-clock-parents:
+                maxItems: 1
+                description: |
+                  Standard assigned-clocks-parents definition used for selecting
+                  mux parent (one of the mux input).
+
+              reg:
+                maxItems: 1
+
+            required:
+              - clocks
+
+            additionalProperties: false
+
+          iepclk-mux@[a-f0-9]+$:
+            description: |
+              The IEP module can get its clock from 2 sources: ICSSG_IEP_CLK or
+              CORE_CLK (OCP_CLK in older SoCs). This node models this clock
+              mux and should have the name "iepclk-mux".
+
+            type: object
+
+            properties:
+              '#clock-cells':
+                const: 0
+
+              clocks:
+                items:
+                  - description: ICSSG_IEP Clock
+                  - description: Core Clock (OCP Clock in older SoCs)
+
+              assigned-clocks:
+                maxItems: 1
+
+              assigned-clock-parents:
+                maxItems: 1
+                description: |
+                  Standard assigned-clocks-parents definition used for selecting
+                  mux parent (one of the mux input).
+
+              reg:
+                maxItems: 1
+
+            required:
+              - clocks
+
+            additionalProperties: false
+
+        additionalProperties: false
 
   iep@[a-f0-9]+$:
     description: |
@@ -259,7 +348,22 @@ examples:
 
         pruss_cfg: cfg@26000 {
             compatible = "ti,pruss-cfg", "syscon";
+            #address-cells = <1>;
+            #size-cells = <1>;
             reg = <0x26000 0x2000>;
+            ranges = <0x00 0x26000 0x2000>;
+
+            clocks {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                pruss_iepclk_mux: iepclk-mux@30 {
+                    reg = <0x30>;
+                    #clock-cells = <0>;
+                    clocks = <&l3_gclk>,        /* icss_iep */
+                             <&pruss_ocp_gclk>; /* icss_ocp */
+                };
+            };
         };
 
         pruss_mii_rt: mii-rt@32000 {
@@ -298,7 +402,22 @@ examples:
 
         pruss1_cfg: cfg@26000 {
             compatible = "ti,pruss-cfg", "syscon";
+            #address-cells = <1>;
+            #size-cells = <1>;
             reg = <0x26000 0x2000>;
+            ranges = <0x00 0x26000 0x2000>;
+
+            clocks {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                pruss1_iepclk_mux: iepclk-mux@30 {
+                    reg = <0x30>;
+                    #clock-cells = <0>;
+                    clocks = <&sysclk_div>,     /* icss_iep */
+                             <&pruss_ocp_gclk>; /* icss_ocp */
+                };
+            };
         };
 
         pruss1_mii_rt: mii-rt@32000 {
-- 
2.7.4

