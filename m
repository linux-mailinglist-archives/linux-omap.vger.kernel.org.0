Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AF30222323
	for <lists+linux-omap@lfdr.de>; Thu, 16 Jul 2020 14:57:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728900AbgGPM5m (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 16 Jul 2020 08:57:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728892AbgGPM5m (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 16 Jul 2020 08:57:42 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7813C08C5C0;
        Thu, 16 Jul 2020 05:57:41 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 32D9D2A56F1
Received: by jupiter.universe (Postfix, from userid 1000)
        id B956A4800FF; Thu, 16 Jul 2020 14:57:37 +0200 (CEST)
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Tony Lindgren <tony@atomide.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Merlijn Wajer <merlijn@wizzup.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Rob Herring <robh+dt@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org, kernel@collabora.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCHv2 0/4] Subject: panel-dsi-cm: update bindings
Date:   Thu, 16 Jul 2020 14:57:29 +0200
Message-Id: <20200716125733.83654-1-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The cleanup series for omapdrm's DSI code got too big. Reviewing
this is not fun and the same goes for keeping track of the change
requests. Let's do the cleanup in smaller steps instead. This is
the first batch, which updates the binding (txt -> yaml) and
modifies the DT slightly.

Changes since PATCHv1 [0]:

PATCHv1..PATCHv2:
 * Update binding as suggested by Sam
  * Remove 'port' from required list
  * Drop 'lanes' and 'port' from example ('lanes' is a port property
    used by OMAP's DSI controller)
  * Drop the label from example
  * Add '...' at end of file
 * Fix , in patch description from patch 2
 * Apply Reviewed-by tags

[0] https://lore.kernel.org/dri-devel/20200629223315.118256-1-sebastian.reichel@collabora.com/

-- Sebastian

Sebastian Reichel (4):
  dt-bindings: display: panel-dsi-cm: convert to YAML
  ARM: dts: omap: add channel to DSI panels
  ARM: dts: omap4-droid4: add panel compatible
  ARM: dts: omap4-droid4: add panel orientation

 .../bindings/display/panel/panel-dsi-cm.txt   | 29 -------
 .../bindings/display/panel/panel-dsi-cm.yaml  | 86 +++++++++++++++++++
 .../boot/dts/motorola-mapphone-common.dtsi    |  6 +-
 arch/arm/boot/dts/omap3-n950.dts              |  3 +-
 arch/arm/boot/dts/omap3.dtsi                  |  3 +
 arch/arm/boot/dts/omap4-sdp.dts               |  6 +-
 arch/arm/boot/dts/omap4.dtsi                  |  6 ++
 arch/arm/boot/dts/omap5.dtsi                  |  6 ++
 8 files changed, 111 insertions(+), 34 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/panel-dsi-cm.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/panel-dsi-cm.yaml

-- 
2.27.0

