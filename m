Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AC4029F29F
	for <lists+linux-omap@lfdr.de>; Thu, 29 Oct 2020 18:09:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725972AbgJ2RJt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 29 Oct 2020 13:09:49 -0400
Received: from sender11-of-o52.zoho.eu ([31.186.226.238]:21355 "EHLO
        sender11-of-o52.zoho.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725957AbgJ2RJs (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 29 Oct 2020 13:09:48 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1603991362; cv=none; 
        d=zohomail.eu; s=zohoarc; 
        b=B8Z0XYdSYl9TWLWxFpqfxqD7JRDj+4iQ+8sqZgwZrRar+6pjIce817o7sYgDq9kv4heTQbb9HLe+h6cECRyyZj+MJ+AUZupcVw5rCZwDetV/Mly2JjdoGarbJqQ7XDPZIMkr0K73dia0CO72E9ormwVFwaBGlg+Q4JgVLVDISDc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
        t=1603991362; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
        bh=9Tr2P9DR36UFNpHv3c8ZcdoeNbs4qYkslgkrMEyGCwU=; 
        b=FtoVUAVoau79YXgLLDK/ZvHMx0DDlp81eqdNojW/Atr5tYT2AXWuZU4JZOZLFkcd/FpOQupEyewBdjeb3YTMuoeSLr7o1hRODDtryj4ZgGulgbI+mKpWqA/agO4J+EIy3gM3YnXuKeMjqHgP4woua51YjFCHdmPUL+yRGGEvudE=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
        spf=pass  smtp.mailfrom=philipp@uvos.xyz;
        dmarc=pass header.from=<philipp@uvos.xyz> header.from=<philipp@uvos.xyz>
Received: from localhost.localdomain (ip-95-222-213-32.hsi15.unitymediagroup.de [95.222.213.32]) by mx.zoho.eu
        with SMTPS id 1603991359354993.3246506194793; Thu, 29 Oct 2020 18:09:19 +0100 (CET)
Date:   Thu, 29 Oct 2020 18:09:18 +0100
From:   Carl Philipp Klemm <philipp@uvos.xyz>
To:     tony@atomide.com
Cc:     linux-omap@vger.kernel.org, linux-input@vger.kernel.org
Subject: [PATCH] documentation: dts documentation for touchscreen-buttons
Message-Id: <20201029180918.4f0d8a256ce4fc2890def5ac@uvos.xyz>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Dts documentation for touchscreen-buttons

Signed-off-by: Carl Philipp Klemm <carl@uvos.xyz>

---

diff --git a/Documentation/devicetree/bindings/input/misc/touchscreen-buttons.txt b/Documentation/devicetree/bindings/input/misc/touchscreen-buttons.txt
new file mode 100644
index 000000000000..5ca2fdb73ebc
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/misc/touchscreen-buttons.txt
@@ -0,0 +1,50 @@
+Phyiscal buttons on touchscreen surfaces
+
+This module provides a driver for buttons with phyiscal labels on touchscreen surfaces.
+
+Required properties:
+- compatible: should be one of the following
+   - "touchscreen-buttons"
+- touchscreen_phandle: a handle to the touschreen device where the buttons are located
+- an arbitrary number of child_nodes containing:
+   - x-position: position of the button on the x-axis in touchscreen coordinates
+   - y-position: position of the button on the y-axis in touchscreen coordinates
+   - x-size: size of the button in x-axis direction in touchscreen coordinates
+   - y-size: size of the button in y-axis direction in touchscreen coordinates
+   - keycode: the keycode to be activated when the button is pressed
+
+
+Example:
+
+mapphone_touchscreen {
+		compatible = "touchscreen-buttons";
+		touchscreen_phandle = <&touchscreen>;
+		menu {
+			x-position = <0>;
+			y-position = <959>;
+			x-size = <256>;
+			y-size = <65>;
+			keycode = <KEY_F9>;
+		};
+		home {
+			x-position = <256>;
+			y-position = <959>;
+			x-size = <256>;
+			y-size = <65>;
+			keycode = <KEY_F10>;
+		};
+		back {
+			x-position = <512>;
+			y-position = <959>;
+			x-size = <256>;
+			y-size = <65>;
+			keycode = <KEY_F11>;
+		};
+		search {
+			x-position = <768>;
+			y-position = <959>;
+			x-size = <256>;
+			y-size = <65>;
+			keycode = <KEY_SEARCH>;
+		};
+};


-- 
Carl Philipp Klemm <philipp@uvos.xyz> <carl@uvos.xyz>
