Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8731B34E34
	for <lists+linux-omap@lfdr.de>; Tue,  4 Jun 2019 19:02:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727905AbfFDRCD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 4 Jun 2019 13:02:03 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:52834 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726532AbfFDRCC (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 4 Jun 2019 13:02:02 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x54H1wwT084272;
        Tue, 4 Jun 2019 12:01:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1559667718;
        bh=dl/p6s8i6dqi8lgl0FcgfjjgtFbawMFoVouR4+ILAS8=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=vhu7qZF9moABxdkT+aW9Ao645OiPV0zAnvEGNxabRKevyI4H8l6AwsNK6ICoPPm8/
         cnThrC9STLT+G8rcS7468Lo+F5kjyR8K3ssXdLr3yeyeeJweFk1bUILQuh01Ur1DGi
         Kgvrb8ev2LcBxY8c56sIGp0HNenjyxZgDdMZkH+s=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x54H1w9f010922
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 4 Jun 2019 12:01:58 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 4 Jun
 2019 12:01:56 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 4 Jun 2019 12:01:56 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com [128.247.22.53])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x54H1uDi040970;
        Tue, 4 Jun 2019 12:01:56 -0500
Received: from localhost (irmo.dhcp.ti.com [128.247.58.153])
        by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id x54H1tm17348;
        Tue, 4 Jun 2019 12:01:55 -0500 (CDT)
From:   Suman Anna <s-anna@ti.com>
To:     Jassi Brar <jassisinghbrar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 1/2] dt-bindings: mailbox: omap: Update bindings for TI K3 SoCs
Date:   Tue, 4 Jun 2019 12:01:45 -0500
Message-ID: <20190604170146.12205-2-s-anna@ti.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190604170146.12205-1-s-anna@ti.com>
References: <20190604170146.12205-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The TI K3 AM65x and J721E family of SoCs have a new Mailbox IP that
is based on the existing Mailbox IP present in OMAP architecture based
SoCs. Update the existing OMAP Mailbox bindings for this new IP present
on TI K3 AM65x and J721E SoCs. The same compatible from AM65x SoCs is
reused for J721E SoCs.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 .../bindings/mailbox/omap-mailbox.txt         | 59 ++++++++++++++++---
 1 file changed, 50 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/omap-mailbox.txt b/Documentation/devicetree/bindings/mailbox/omap-mailbox.txt
index 0ef372656a3e..35c3f56b7f7b 100644
--- a/Documentation/devicetree/bindings/mailbox/omap-mailbox.txt
+++ b/Documentation/devicetree/bindings/mailbox/omap-mailbox.txt
@@ -1,4 +1,4 @@
-OMAP2+ Mailbox Driver
+OMAP2+ and K3 Mailbox
 =====================
 
 The OMAP mailbox hardware facilitates communication between different processors
@@ -7,7 +7,7 @@ various processor subsystems and is connected on an interconnect bus. The
 communication is achieved through a set of registers for message storage and
 interrupt configuration registers.
 
-Each mailbox IP block has a certain number of h/w fifo queues and output
+Each mailbox IP block/cluster has a certain number of h/w fifo queues and output
 interrupt lines. An output interrupt line is routed to an interrupt controller
 within a processor subsystem, and there can be more than one line going to a
 specific processor's interrupt controller. The interrupt line connections are
@@ -23,12 +23,16 @@ All the current OMAP SoCs except for the newest DRA7xx SoC has a single IP
 instance. DRA7xx has multiple instances with different number of h/w fifo queues
 and interrupt lines between different instances. The interrupt lines can also be
 routed to different processor sub-systems on DRA7xx as they are routed through
-the Crossbar, a kind of interrupt router/multiplexer.
+the Crossbar, a kind of interrupt router/multiplexer. The K3 AM65x and J721E
+SoCs has each of these instances form a cluster and combine multiple clusters
+into a single IP block present within the Main NavSS. The interrupt lines from
+all these clusters are multiplexed and routed to different processor subsystems
+over a limited number of common interrupt output lines of an Interrupt Router.
 
 Mailbox Device Node:
 ====================
-A Mailbox device node is used to represent a Mailbox IP instance within a SoC.
-The sub-mailboxes are represented as child nodes of this parent node.
+A Mailbox device node is used to represent a Mailbox IP instance/cluster within
+a SoC. The sub-mailboxes are represented as child nodes of this parent node.
 
 Required properties:
 --------------------
@@ -37,12 +41,12 @@ Required properties:
 			    "ti,omap3-mailbox" for OMAP3430, OMAP3630 SoCs
 			    "ti,omap4-mailbox" for OMAP44xx, OMAP54xx, AM33xx,
 						   AM43xx and DRA7xx SoCs
+			    "ti,am654-mailbox" for K3 AM65x and J721E SoCs
 - reg:			Contains the mailbox register address range (base
 			address and length)
 - interrupts:		Contains the interrupt information for the mailbox
 			device. The format is dependent on which interrupt
-			controller the OMAP device uses
-- ti,hwmods:		Name of the hwmod associated with the mailbox
+			controller the Mailbox device uses
 - #mbox-cells:		Common mailbox binding property to identify the number
 			of cells required for the mailbox specifier. Should be
 			1
@@ -50,6 +54,23 @@ Required properties:
 			device can interrupt
 - ti,mbox-num-fifos:	Number of h/w fifo queues within the mailbox IP block
 
+SoC-specific Required properties:
+---------------------------------
+The following are mandatory properties for the OMAP architecture based SoCs
+only:
+- ti,hwmods:		Name of the hwmod associated with the mailbox. This
+			should be defined in the mailbox node only if the node
+			is not defined as a child node of a corresponding sysc
+			interconnect node.
+
+The following are mandatory properties for the K3 AM65x and J721E SoCs only:
+- interrupt-parent:	Should contain a phandle to the TI-SCI interrupt
+			controller node that is used to dynamically program
+			the interrupt routes between the IP and the main GIC
+			controllers. See the following binding for additional
+			details,
+			Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.txt
+
 Child Nodes:
 ============
 A child node is used for representing the actual sub-mailbox device that is
@@ -98,7 +119,7 @@ to be used by the client user.
 Example:
 --------
 
-/* OMAP4 */
+1. /* OMAP4 */
 mailbox: mailbox@4a0f4000 {
 	compatible = "ti,omap4-mailbox";
 	reg = <0x4a0f4000 0x200>;
@@ -123,7 +144,7 @@ dsp {
 	...
 };
 
-/* AM33xx */
+2. /* AM33xx */
 mailbox: mailbox@480c8000 {
 	compatible = "ti,omap4-mailbox";
 	reg = <0x480C8000 0x200>;
@@ -137,3 +158,23 @@ mailbox: mailbox@480c8000 {
 		ti,mbox-rx = <0 0 3>;
 	};
 };
+
+3. /* AM65x */
+&cbass_main {
+	cbass_main_navss: interconnect0 {
+		mailbox0_cluster0: mailbox@31f80000 {
+			compatible = "ti,am654-mailbox";
+			reg = <0x00 0x31f80000 0x00 0x200>;
+			#mbox-cells = <1>;
+			ti,mbox-num-users = <4>;
+			ti,mbox-num-fifos = <16>;
+			interrupt-parent = <&intr_main_navss>;
+			interrupts = <164 0>;
+
+			mbox_mcu_r5fss0_core0: mbox-mcu-r5fss0-core0 {
+				ti,mbox-tx = <1 0 0>;
+				ti,mbox-rx = <0 0 0>;
+			};
+		};
+	};
+};
-- 
2.21.0

