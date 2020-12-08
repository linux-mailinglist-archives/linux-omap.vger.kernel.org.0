Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02F3D2D2AF9
	for <lists+linux-omap@lfdr.de>; Tue,  8 Dec 2020 13:32:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728842AbgLHMbl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Dec 2020 07:31:41 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:33212 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727998AbgLHMbl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 8 Dec 2020 07:31:41 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B8CTfoQ063994;
        Tue, 8 Dec 2020 06:29:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1607430581;
        bh=7i5LU6l9rW7Z5+cOxWIafF0t3zpOrqoJf4PzQkxFsKI=;
        h=From:To:CC:Subject:Date;
        b=JFCxjZNub72Hj89/m8Xp5J8Ffss85hFOaaXhj4MdnXg4kUtWST5YxeCXhAcF3Oii4
         o2sejcAKBKpQeDMVS0j8eQUJ4jHZAS8yM+Wzn66Wi1S1dwEAgJKLiusNUpm2vPELYk
         eMwjgdS8nfEVA/bA5kUh1z6zTTMjOSozdOYp6JYQ=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B8CTfDK103231
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 8 Dec 2020 06:29:41 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 8 Dec
 2020 06:29:41 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 8 Dec 2020 06:29:41 -0600
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B8CTcjE095068;
        Tue, 8 Dec 2020 06:29:39 -0600
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        <dri-devel@lists.freedesktop.org>
CC:     <linux-omap@vger.kernel.org>, Sekhar Nori <nsekhar@ti.com>,
        Tony Lindgren <tony@atomide.com>, <hns@goldelico.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v5 00/29] Convert DSI code to use drm_mipi_dsi and drm_panel (second half)
Date:   Tue, 8 Dec 2020 14:28:26 +0200
Message-ID: <20201208122855.254819-1-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

This is version 5 of the series OMAP DSI conversion series. Previous
version can be found from:

https://www.spinics.net/lists/linux-omap/msg157480.html

To lessen the patch spam, I'm sending only patches starting from patch
56/80. There has been no changes to the patches before 56/80.

Diff between v4 and v5 is not much. There are no functional changes at
the end of the series (diff between v4 and v5 shows only cosmetic
changes, except fixing one missing r = 0 initialization).

The biggest change is splitting "drm/omap: dsi: cleanup channel usages"
into three parts. Also, the last patch is new in this version, although
I did send it for v4 as 81/80.

Other changes include minor clarifications and cleanups in the
descriptions, and moving a few changes from one commit to another in
case the change logically belongs to the other commit.

 Tomi

Tomi Valkeinen (29):
  drm/panel: panel-dsi-cm: cleanup tear enable
  ARM: dts: omap5: add address-cells & size-cells to dsi
  drm/omap: pll: fix iteration loop check
  drm/omap: dsi: set trans_mode according to client mode_flags
  drm/panel: panel-dsi-cm: set column & page at setup
  drm/omap: dsi: send nop instead of page & column
  drm/omap: dsi: simplify VC handling
  drm/omap: dsi: drop useless channel checks
  drm/omap: dsi: cleanup dispc channel usage
  drm/omap: dsi: rename 'channel' to 'vc'
  drm/omap: dsi: pass vc to various functions
  drm/omap: dsi: untangle vc & channel
  drm/omap: dsi: skip dsi_vc_enable_hs when already in correct mode
  drm/omap: dsi: enable HS before sending the frame
  drm/omap: dsi: use separate VCs for cmd and video
  drm/panel: panel-dsi-cm: remove extra 'if'
  drm/panel: panel-dsi-cm: add panel database to driver
  drm/panel: panel-dsi-cm: drop unneeded includes
  drm/omap: dsi: move structs & defines to dsi.h
  drm/omap: dsi: move enable/disable to bridge enable/disable
  drm/omap: dsi: display_enable cleanup
  drm/omap: dsi: display_disable cleanup
  drm/omap: dsi: rename dsi_display_* functions
  drm/omap: dsi: cleanup initial vc setup
  drm/omap: dsi: split video mode enable/disable into separate func
  drm/omap: dsi: fix and cleanup ddr_clk_always_on
  drm/omap: dsi: remove ulps support
  drm/omap: dsi: fix DCS_CMD_ENABLE
  drm/omap: dsi: allow DSI commands to be sent early

 arch/arm/boot/dts/omap5.dtsi          |    6 +
 drivers/gpu/drm/omapdrm/dss/dsi.c     | 1375 ++++++-------------------
 drivers/gpu/drm/omapdrm/dss/dsi.h     |  456 ++++++++
 drivers/gpu/drm/omapdrm/dss/omapdss.h |   64 --
 drivers/gpu/drm/omapdrm/dss/pll.c     |    6 +
 drivers/gpu/drm/panel/panel-dsi-cm.c  |  161 +--
 6 files changed, 899 insertions(+), 1169 deletions(-)
 create mode 100644 drivers/gpu/drm/omapdrm/dss/dsi.h

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

