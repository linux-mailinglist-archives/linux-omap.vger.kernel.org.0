Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCB134362A0
	for <lists+linux-omap@lfdr.de>; Thu, 21 Oct 2021 15:19:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230190AbhJUNVU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 21 Oct 2021 09:21:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230285AbhJUNVS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 21 Oct 2021 09:21:18 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6FB5C061220
        for <linux-omap@vger.kernel.org>; Thu, 21 Oct 2021 06:19:00 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:2c41:c2bf:5c8f:53c5])
        by xavier.telenet-ops.be with bizsmtp
        id 8dJv260041Z5S4H01dJvnF; Thu, 21 Oct 2021 15:18:58 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mdXyA-006ZA9-SL; Thu, 21 Oct 2021 15:18:54 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mdXyA-00GQ7o-FK; Thu, 21 Oct 2021 15:18:54 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Russell King <linux@armlinux.org.uk>,
        Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/3] dt-bindings: display: bridge: nxp,tda998x: Json-schema conversion and fixes
Date:   Thu, 21 Oct 2021 15:18:50 +0200
Message-Id: <cover.1634822085.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

	Hi all,

This patch series converts the NXP TDA998x HDMI transmitter Device Tree
binding documentation to json-schema, after a few customary fixes.

Thanks for your comments!

Geert Uytterhoeven (3):
  ARM: dts: am335x: Fix TDA998x ports addressing
  [RFC] arm64: dts: renesas: cat874: Drop bogus clocks property
  [RFC] dt-bindings: display: bridge: nxp,tda998x: Convert to
    json-schema

 .../bindings/display/bridge/nxp,tda998x.yaml  | 108 ++++++++++++++++++
 .../bindings/display/bridge/tda998x.txt       |  54 ---------
 arch/arm/boot/dts/am335x-boneblack-hdmi.dtsi  |   7 +-
 arch/arm/boot/dts/am335x-myirtech-myd.dts     |   7 +-
 .../boot/dts/renesas/r8a774c0-cat874.dts      |   1 -
 5 files changed, 120 insertions(+), 57 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/nxp,tda998x.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/tda998x.txt

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
