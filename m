Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54C0E425360
	for <lists+linux-omap@lfdr.de>; Thu,  7 Oct 2021 14:49:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241377AbhJGMvE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 7 Oct 2021 08:51:04 -0400
Received: from muru.com ([72.249.23.125]:41860 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233158AbhJGMvE (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 7 Oct 2021 08:51:04 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 77FB58131;
        Thu,  7 Oct 2021 12:49:39 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-kernel@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh@kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Suman Anna <s-anna@ti.com>
Subject: [PATCH 1/3] dt-bindings: bus: simple-pm-bus: Make clocks and power-domains optional
Date:   Thu,  7 Oct 2021 15:48:56 +0300
Message-Id: <20211007124858.44011-2-tony@atomide.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211007124858.44011-1-tony@atomide.com>
References: <20211007124858.44011-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Clocks and power domains are not required by the simple-pm-bus driver.
There are buses with read-only registers for clocks and power domains
that are always on.

Even without clocks and power domains configured, simple-pm-bus is still
different from simple-bus as simple-pm-bus enables runtime PM for the bus
driver.

Let's update the binding accordingly as this remove the related warnings
for dt_binding_check for omaps.

Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh@kernel.org>
Cc: Simon Horman <horms+renesas@verge.net.au>
Cc: Suman Anna <s-anna@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 .../devicetree/bindings/bus/simple-pm-bus.yaml  | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/bus/simple-pm-bus.yaml b/Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
--- a/Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
+++ b/Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
@@ -13,10 +13,9 @@ description: |
   A Simple Power-Managed Bus is a transparent bus that doesn't need a real
   driver, as it's typically initialized by the boot loader.
 
-  However, its bus controller is part of a PM domain, or under the control
-  of a functional clock.  Hence, the bus controller's PM domain and/or
-  clock must be enabled for child devices connected to the bus (either
-  on-SoC or externally) to function.
+  However, its bus controller is typically part of a PM domain, or under
+  the control of a functional clock.  Without PM domain or functional clock,
+  it still enables runtime PM for the bus driver unlike "simple-bus".
 
   While "simple-pm-bus" follows the "simple-bus" set of properties, as
   specified in the Devicetree Specification, it is not an extension of
@@ -43,10 +42,10 @@ properties:
 
   clocks: true
     # Functional clocks
-    # Required if power-domains is absent, optional otherwise
+    # Typically used if power-domains is absent
 
   power-domains:
-    # Required if clocks is absent, optional otherwise
+    # Typically used if clocks is absent
     minItems: 1
 
 required:
@@ -55,12 +54,6 @@ required:
   - '#size-cells'
   - ranges
 
-anyOf:
-  - required:
-      - clocks
-  - required:
-      - power-domains
-
 additionalProperties: true
 
 examples:
-- 
2.33.0
