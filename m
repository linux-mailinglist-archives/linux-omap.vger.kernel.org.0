Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2158A203CF5
	for <lists+linux-omap@lfdr.de>; Mon, 22 Jun 2020 18:47:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729832AbgFVQrD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 22 Jun 2020 12:47:03 -0400
Received: from muru.com ([72.249.23.125]:58664 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729821AbgFVQrC (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 22 Jun 2020 12:47:02 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 4606E817C;
        Mon, 22 Jun 2020 16:47:54 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     "Andrew F . Davis" <afd@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Suman Anna <s-anna@ti.com>, Tero Kristo <t-kristo@ti.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH 1/6] dt-bindings: omap: Update PRM binding for genpd
Date:   Mon, 22 Jun 2020 09:46:47 -0700
Message-Id: <20200622164652.12054-2-tony@atomide.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200622164652.12054-1-tony@atomide.com>
References: <20200622164652.12054-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The PRM (Power and Reset Module) has a register to enable and disable
the related power domain, so let's update the binding for that.

Cc: devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 Documentation/devicetree/bindings/arm/omap/prm-inst.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/omap/prm-inst.txt b/Documentation/devicetree/bindings/arm/omap/prm-inst.txt
--- a/Documentation/devicetree/bindings/arm/omap/prm-inst.txt
+++ b/Documentation/devicetree/bindings/arm/omap/prm-inst.txt
@@ -18,6 +18,7 @@ Required properties:
 		(base address and length)
 
 Optional properties:
+- #power-domain-cells:	Should be 0 if the instance is a power domain provider.
 - #reset-cells:	Should be 1 if the PRM instance in question supports resets.
 
 Example:
@@ -25,5 +26,6 @@ Example:
 prm_dsp2: prm@1b00 {
 	compatible = "ti,dra7-prm-inst", "ti,omap-prm-inst";
 	reg = <0x1b00 0x40>;
+	#power-domain-cells = <0>;
 	#reset-cells = <1>;
 };
-- 
2.27.0
