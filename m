Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6740A1E9A1E
	for <lists+linux-omap@lfdr.de>; Sun, 31 May 2020 21:40:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726008AbgEaTkI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 31 May 2020 15:40:08 -0400
Received: from muru.com ([72.249.23.125]:56370 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725991AbgEaTkI (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 31 May 2020 15:40:08 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id B2143810A;
        Sun, 31 May 2020 19:40:55 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     "Andrew F . Davis" <afd@ti.com>, Dave Gerlach <d-gerlach@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        dri-devel@lists.freedesktop.org
Subject: [PATCH 0/5] Suspend and resume fixes for omapdrm pdata removal
Date:   Sun, 31 May 2020 12:39:36 -0700
Message-Id: <20200531193941.13179-1-tony@atomide.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi all,

Recent omapdrm related changes to drop legacy platform data caused
a suspend and resume regression. I must have only tested suspend
and resume only with the changes preparing to drop the platform data,
but looks like I forgot to test suspend after dropping the platform
data.

There seem to be other longer term DSS regressions remaining too.
Looks like at least panel-simple currently does not probe. It fails
with "panel-simple display: Reject override mode: panel has a fixed
mode". I think the solution there is to drop the board specific
panel-timing related dts lines, but that still seems to be pending.
Anyways, no luck getting the LCD enabled on am437x-sk-evm with v5.6
or v5.7-rc kernels.

Regards,

Tony


Tony Lindgren (5):
  drm/omap: Fix suspend resume regression after platform data removal
  bus: ti-sysc: Use optional clocks on for enable and wait for softreset
    bit
  bus: ti-sysc: Ignore clockactivity unless specified as a quirk
  bus: ti-sysc: Fix uninitialized framedonetv_irq
  ARM: OMAP2+: Fix legacy mode dss_reset

 arch/arm/mach-omap2/omap_hwmod.c         |  2 +-
 drivers/bus/ti-sysc.c                    | 93 ++++++++++++++++++------
 drivers/gpu/drm/omapdrm/dss/dispc.c      |  6 +-
 drivers/gpu/drm/omapdrm/dss/dsi.c        |  6 +-
 drivers/gpu/drm/omapdrm/dss/dss.c        |  6 +-
 drivers/gpu/drm/omapdrm/dss/venc.c       |  6 +-
 drivers/gpu/drm/omapdrm/omap_dmm_tiler.c |  4 +-
 7 files changed, 79 insertions(+), 44 deletions(-)

-- 
2.26.2
