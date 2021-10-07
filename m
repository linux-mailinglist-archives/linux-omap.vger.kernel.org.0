Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5552D425364
	for <lists+linux-omap@lfdr.de>; Thu,  7 Oct 2021 14:49:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241496AbhJGMvJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 7 Oct 2021 08:51:09 -0400
Received: from muru.com ([72.249.23.125]:41866 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241492AbhJGMvJ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 7 Oct 2021 08:51:09 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id D8C188206;
        Thu,  7 Oct 2021 12:49:44 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-kernel@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh@kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Suman Anna <s-anna@ti.com>
Subject: [PATCH 2/3] dt-bindings: bus: simple-pm-bus: Add more matches for node name
Date:   Thu,  7 Oct 2021 15:48:57 +0300
Message-Id: <20211007124858.44011-3-tony@atomide.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211007124858.44011-1-tony@atomide.com>
References: <20211007124858.44011-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

At least omaps use simple-pm-bus for interconnects and interconnect
segments. While the interconnects do have configurable registers, there is
currently no need for a dedicated interconnect driver.

Let's update the list of allowed node names to remove the related
dt_binding_check warnings for omaps.

Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh@kernel.org>
Cc: Simon Horman <horms+renesas@verge.net.au>
Cc: Suman Anna <s-anna@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 Documentation/devicetree/bindings/bus/simple-pm-bus.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/bus/simple-pm-bus.yaml b/Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
--- a/Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
+++ b/Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
@@ -23,7 +23,7 @@ description: |
 
 properties:
   $nodename:
-    pattern: "^bus(@[0-9a-f]+)?$"
+    pattern: "^(bus|interconnect|segment)(@[0-9a-f]+)?$"
 
   compatible:
     contains:
-- 
2.33.0
