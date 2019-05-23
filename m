Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FA5C28B43
	for <lists+linux-omap@lfdr.de>; Thu, 23 May 2019 22:08:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387538AbfEWUIH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 23 May 2019 16:08:07 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:38612 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387504AbfEWUIH (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 23 May 2019 16:08:07 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 4926626117E
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Tony Lindgren <tony@atomide.com>, Pavel Machek <pavel@ucw.cz>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCHv6 0/4] omapdrm: DSI command mode panel support
Date:   Thu, 23 May 2019 22:07:52 +0200
Message-Id: <20190523200756.25314-1-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

Here is another round of the DSI command mode panel patchset
integrating the feedback from PATCHv5. The patches are based
on v5.2-rc1 tag. It does not contain the patches required for
OMAP3 support (it needs a workaround for a hardware bug) and
for automatic display rotation. They should get their own series,
once after everything has been moved to DRM panel API. I think
DRM panel conversion should happen _after_ this series, since
otherwise there is a high risk of bricking DSI support completely.
I already started a WIP branch for converting DSI to the DRM panel
API on top of this patchset.

Tested on Droid 4:
 * Display blanking
  - automatic backlight blanking is missing (not handled by DSI)
 * Framebuffer Console, updated at 1Hz due to blinking cursor
 * Xorg 1.19 with modesetting driver
 * Weston 5.0 with DRM backend
 * kmstest (static image)
 * No updates send when nothing needs to be sent

Known issues:
 * OMAP3 is untested and most likely broken due to missing
   workaround(s) for hardware bugs.
 * Weston 5.0 with fbdev backend does not work, since it
   uses neither page flip nor dirty ioctl. You need to use
   the drm backend.

Changes since PATCHv5:
 * Rebased to v5.2-rc1
 * Simplified omap_framebuffer_dirty() by using
   drm_for_each_crtc()

Changes since PATCHv4:
 * Apply Acked-/Tested-by received from Tony and Pavel
 * Fix spelling/optimize commit messages
 * Use proper multi-line comments
 * Restructure patch 4: move the whole HDMI block into a
   static subfunction, that is only called when output
   type is HDMI. Also drop the incorrect check for DVI.

Changes since PATCHv3:
 * Drop all Tested/Acked-by tags
 * Drop the rotation patches for now
 * Rebase to 4.20-rc1 + fixes from Laurent and Tony
 * Add fixes for DSI regressions introduced in 4.20-rc1
 * Store info update manual update mode in omap_crtc_state
 * Lock modesetting in omap_framebuffer_dirty
 * Directly loop through CRTCs instead of connectors in dirty function
 * Properly refresh display during page flips and get Weston working
 * Add more comments about implementation details

Changes since PATCHv2:
 * Drop omap3 quirk patch (OMAP3 should get its own mini-series)
 * Rebase to current linux-next
 * Use existing 'rotation' DT property to set DRM orientation hint
 * Add Tested-by from Tony

Changes since PATCHv1:
 * Drop patches, that were queued by Tomi
 * Rebase to current master
 * Rework the omap3 workaround patch to only affect omap3
 * Add orientation DRM property support

-- Sebastian

Sebastian Reichel (4):
  drm/omap: use DRM_DEBUG_DRIVER instead of CORE
  drm/omap: don't check dispc timings for DSI
  drm/omap: add framedone interrupt support
  drm/omap: add support for manually updated displays

 drivers/gpu/drm/omapdrm/omap_crtc.c | 182 ++++++++++++++++++++++++++--
 drivers/gpu/drm/omapdrm/omap_crtc.h |   2 +
 drivers/gpu/drm/omapdrm/omap_drv.h  |   4 +-
 drivers/gpu/drm/omapdrm/omap_fb.c   |  19 +++
 drivers/gpu/drm/omapdrm/omap_irq.c  |  25 ++++
 drivers/gpu/drm/omapdrm/omap_irq.h  |   1 +
 6 files changed, 222 insertions(+), 11 deletions(-)

-- 
2.20.1

