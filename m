Return-Path: <linux-omap+bounces-5426-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E396ED13DE2
	for <lists+linux-omap@lfdr.de>; Mon, 12 Jan 2026 17:03:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 92C803032707
	for <lists+linux-omap@lfdr.de>; Mon, 12 Jan 2026 16:02:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8799364046;
	Mon, 12 Jan 2026 16:02:46 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D293612E8;
	Mon, 12 Jan 2026 16:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768233766; cv=none; b=e7bOy82jgU0skFi4h4hlfX/xXPtPsYJEt6HEnQHCrrvxetvindb47bBIhe06EiI0iphydJr5nrDHOiGGAvBTtoLArH/BZ5H+d+pzjNbqmQ8vyyR2FJu45bS+glPJvnFajweeH2JtRxdmfMXXG5w0owH6mWfU/HkYn1BjSOt/O0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768233766; c=relaxed/simple;
	bh=9P8LssV6p2iWWZSIv/jXldkASAAgElurt6r9n/2FuT0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hxhjlxMd2Q5UALBemtEeB3kDZJjncGd7EvN75hSV/x5TCNyfAdz9A9iQGhr7YkNGxj7ixq8UE04TmKIFyL7O9srQo0CljBF7sewDp5L9SVEpXzqHL2A5J2kJi09emzfmi3NMQCYq0N5H/npOvkgfoDIhqQrcLNxIzE+q75rLH0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DFD4C116D0;
	Mon, 12 Jan 2026 16:02:43 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-omap@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: display: bridge: nxp,tda998x: Add missing clocks
Date: Mon, 12 Jan 2026 17:02:40 +0100
Message-ID: <2b66577296583a6787f770f0eb13c42a6b50768b.1768233569.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some TDA998x variants (e.g. TDA19988) have an OSC_IN pin, to connect
an external oscillator circuit or clock source.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This fixes "make dtbs_check":

    arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dtb: tda19988@70 (nxp,tda998x): Unevaluated properties are not allowed ('clocks' was unexpected)
	    from schema $id: http://devicetree.org/schemas/display/bridge/nxp,tda998x.yaml
    arch/arm64/boot/dts/renesas/r8a774c0-cat874.dtb: tda19988@70 (nxp,tda998x): Unevaluated properties are not allowed ('clocks' was unexpected)
	    from schema $id: http://devicetree.org/schemas/display/bridge/nxp,tda998x.yaml
    arch/arm64/boot/dts/renesas/r8a774c0-ek874.dtb: tda19988@70 (nxp,tda998x): Unevaluated properties are not allowed ('clocks' was unexpected)
	    from schema $id: http://devicetree.org/schemas/display/bridge/nxp,tda998x.yaml
    arch/arm64/boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dtb: tda19988@70 (nxp,tda998x): Unevaluated properties are not allowed ('clocks' was unexpected)
	    from schema $id: http://devicetree.org/schemas/display/bridge/nxp,tda998x.yaml

This patch can be considered v3 of "[PATCH v2 2/3] [RFC] arm64: dts:
renesas: cat874: Drop bogus clocks property"[1], as the pin is actually
connected to a clock source on that board.  On BeagleBone Black, it is
also connected to a clock source, but not described in DT.

The linux driver does not use this clock directly, but I suspect[2] the
use of this pin is controlled through the AP_ENA register value, as
specified in the second cell of the the audio-ports property.

[1] https://lore.kernel.org/97b949cddd7e30e9c05873800330dccd3483b12b.1663165552.git.geert+renesas@glider.be
[2] I do not have access to the programming manual.
---
 .../devicetree/bindings/display/bridge/nxp,tda998x.yaml        | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/nxp,tda998x.yaml b/Documentation/devicetree/bindings/display/bridge/nxp,tda998x.yaml
index 3fce9e698ea1d2dd..1205c8e9de329bbc 100644
--- a/Documentation/devicetree/bindings/display/bridge/nxp,tda998x.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/nxp,tda998x.yaml
@@ -19,6 +19,9 @@ properties:
   interrupts:
     maxItems: 1
 
+  clocks:
+    maxItems: 1
+
   video-ports:
     $ref: /schemas/types.yaml#/definitions/uint32
     default: 0x230145
-- 
2.43.0


