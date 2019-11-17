Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12A2DFF746
	for <lists+linux-omap@lfdr.de>; Sun, 17 Nov 2019 03:41:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726037AbfKQClo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 16 Nov 2019 21:41:44 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:48964 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725901AbfKQClo (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 16 Nov 2019 21:41:44 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id DAFB228BB53
Received: by earth.universe (Postfix, from userid 1000)
        id 86B913C0C78; Sun, 17 Nov 2019 03:41:39 +0100 (CET)
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel@collabora.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [RFCv1 00/42] drm/omap: Convert DSI code to use drm_mipi_dsi and drm_panel    
Date:   Sun, 17 Nov 2019 03:39:46 +0100
Message-Id: <20191117024028.2233-1-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This updates the existing omapdrm DSI code, so that it uses
common drm_mipi_dsi API and drm_panel instead of custom API.
I did not implement support for drm_bridge, since I do not
own any hardware needing this and it does not seem to be a
supported scenario with the old DSS code.

The patchset has been tested with Droid 4 using Linux console,
X.org and Weston. While I found some issues, I could not find
any regressions compared to the current state (*). Combined with
Laurent's effort this will remove all custom panel/connector
drivers from omapdrm and allow more cleanups in the DSS code.

I pushed this patchset into the following branch:

https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-n900.git/log/?h=omapdrm-dsi-drm-panel

(*) When display is used as console for dmesg one can see an
    ugly deadlock on shutdown. I have not yet found the root
    cause for this problem, but that already exists with
    current mainline implementation.

 -- Sebastian

Sebastian Reichel (42):
  omap/drm: drop unused dsi.configure_pins
  drm/omap: dsi: use MIPI_DSI_FMT_* instead of OMAP_DSS_DSI_FMT_*
  drm/omap: constify write buffers
  drm/omap: dsi: add generic transfer function
  drm/omap: panel-dsi-cm: convert to transfer API
  drm/omap: dsi: unexport specific data transfer functions
  drm/omap: dsi: drop virtual channel logic
  drm/omap: dsi: simplify write function
  drm/omap: dsi: simplify read functions
  drm/omap: dsi: switch dsi_vc_send_long/short to mipi_dsi_msg
  ARM: dts: omap: add channel to DSI panels
  drm/omap: dsi: introduce mipi_dsi_host
  drm/omap: panel-dsi-cm: use DSI helpers
  drm/omap: dsi: request VC via mipi_dsi_attach
  drm/omap: panel-dsi-cm: drop hardcoded VC
  drm/omap: panel-dsi-cm: use common MIPI DCS 1.3 defines
  drm/omap: dsi: drop unused memory_read()
  drm/omap: dsi: drop unused get_te()
  drm/omap: dsi: drop unused enable_te()
  drm/omap: dsi: drop useless sync()
  drm/omap: dsi: use pixel-format and mode from attach
  drm/omap: panel-dsi-cm: use bulk regulator API
  drm/omap: dsi: lp/hs switching support for transfer()
  drm/omap: dsi: move TE GPIO handling into core
  drm/omap: dsi: drop custom enable_te() API
  drm/omap: dsi: do bus locking in host driver
  drm/omap: dsi: untangle ulps ops from enable/disable
  drm/dsi: add MIPI_DSI_MODE_ULPS_IDLE
  drm/omap: dsi: do ULPS in host driver
  drm/omap: dsi: move panel refresh function to host
  drm/omap: dsi: Reverse direction of the DSS device enable/disable
    operations
  drm/omap: dsi: convert to drm_panel
  drm/omap: dsi: use atomic helper for dirtyfb
  drm/omap: dsi: implement check timings
  drm/omap: panel-dsi-cm: use DEVICE_ATTR_RO
  drm/omap: panel-dsi-cm: support unbinding
  drm/omap: panel-dsi-cm: fix remove()
  drm/omap: panel-dsi-cm: do not power on/off twice
  drm/omap: dsi: return proper error code from dsi_update_all()
  drm/omap: dsi: support panel un/re-binding
  ARM: dts: omap4-droid4: add panel compatible
  drm/panel: Move OMAP's DSI command mode panel driver

 .../bindings/display/panel/panel-dsi-cm.txt   |    4 +-
 arch/arm/boot/dts/omap3-n950.dts              |    3 +-
 arch/arm/boot/dts/omap3.dtsi                  |    3 +
 arch/arm/boot/dts/omap4-droid4-xt894.dts      |    5 +-
 arch/arm/boot/dts/omap4-sdp.dts               |    6 +-
 arch/arm/boot/dts/omap4.dtsi                  |    6 +
 arch/arm/boot/dts/omap5.dtsi                  |    6 +
 drivers/gpu/drm/omapdrm/displays/Kconfig      |    6 -
 drivers/gpu/drm/omapdrm/displays/Makefile     |    1 -
 .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   | 1387 -----------------
 drivers/gpu/drm/omapdrm/dss/Kconfig           |    1 +
 drivers/gpu/drm/omapdrm/dss/base.c            |    2 +-
 drivers/gpu/drm/omapdrm/dss/dsi.c             | 1019 ++++++++----
 .../gpu/drm/omapdrm/dss/omapdss-boot-init.c   |    1 -
 drivers/gpu/drm/omapdrm/dss/omapdss.h         |   81 +-
 drivers/gpu/drm/omapdrm/omap_crtc.c           |   37 +-
 drivers/gpu/drm/omapdrm/omap_crtc.h           |    1 -
 drivers/gpu/drm/omapdrm/omap_encoder.c        |   20 +-
 drivers/gpu/drm/omapdrm/omap_fb.c             |   21 +-
 drivers/gpu/drm/panel/Kconfig                 |    9 +
 drivers/gpu/drm/panel/Makefile                |    1 +
 drivers/gpu/drm/panel/panel-dsi-cm.c          |  646 ++++++++
 include/drm/drm_mipi_dsi.h                    |    2 +
 23 files changed, 1385 insertions(+), 1883 deletions(-)
 delete mode 100644 drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
 create mode 100644 drivers/gpu/drm/panel/panel-dsi-cm.c


base-commit: 17cc51390c141662748dbbc2fe98f3ed10f2e13e
-- 
2.24.0

