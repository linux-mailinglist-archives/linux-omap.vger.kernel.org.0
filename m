Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33BBFCEA1E
	for <lists+linux-omap@lfdr.de>; Mon,  7 Oct 2019 19:08:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728487AbfJGRIM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 7 Oct 2019 13:08:12 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:39340 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728083AbfJGRIM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 7 Oct 2019 13:08:12 -0400
Received: from pendragon.ideasonboard.com (modemcable118.64-20-96.mc.videotron.ca [96.20.64.118])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BCFCFB2D;
        Mon,  7 Oct 2019 19:08:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1570468089;
        bh=4Gj4RhYZzKijpIuYmGJ34VXZSQIXNE9yD6ONdNHnMOk=;
        h=From:To:Cc:Subject:Date:From;
        b=Ax+Ja6FIQglE9Hsggbihu9uQmQTlGzRfdtO/sNVBUPQiBaBU9pW0ADfERjgBSytVM
         IKE4ILLfKW3FLfxeR5Qnq3phuLbzpX706EqVHDQZqabYlgvMS39i5nxoWlX+NN/n73
         +TaHpfANYIKtdSFhxmAfOfUb/3qZ6oi+ut7gAG3M=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        thierry.reding@gmail.com, sam@ravnborg.org,
        letux-kernel@openphoenux.org, Tony Lindgren <tony@atomide.com>,
        Jyri Sarha <jsarha@ti.com>, linux-omap@vger.kernel.org
Subject: [PATCH 0/5] Fix SPI module alias for panels used by omapdrm
Date:   Mon,  7 Oct 2019 20:07:56 +0300
Message-Id: <20191007170801.27647-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hello,

This patch series fixes a module alias issue with the five recently
added panel drivers used by omapdrm.

Before those panel drivers, omapdrm had custom drivers for the panels,
and prefixed the OF compatible strings with an "omapdss," prefix. The
SPI device IDs are constructed by stripping the OF compatible string
from the prefix, resulting in the "omapdss," prefix being removed, but
the subsequence OF vendor prefix being kept. The SPI drivers thus had
modules aliases that contained the vendor prefix.

Now that the panels are supported by standard drivers and the "omapdss,"
prefix is removed, the SPI device IDs are stripped from the OF vendor
prefix. As the new panel drivers copied the module aliases from the
omapdrm-specific drivers, they contain the vendor prefix in their SPI
module aliases, and are thus not loaded automatically.

Fix this by removing the vendor prefix from the SPI modules aliases in
the drivers. For consistency reason, the manual module aliases are also
moved to use an SPI module table.

These patches are based on the drm-misc-fixes branch as they fix v5.4
regressions.

Laurent Pinchart (5):
  drm/panel: lg-lb035q02: Fix SPI alias
  drm/panel: nec-nl8048hl11: Fix SPI alias
  drm/panel: sony-acx565akm: Fix SPI alias
  drm/panel: tpo-td028ttec1: Fix SPI alias
  drm/panel: tpo-td043mtea1: Fix SPI alias

 drivers/gpu/drm/panel/panel-lg-lb035q02.c    | 9 ++++++++-
 drivers/gpu/drm/panel/panel-nec-nl8048hl11.c | 9 ++++++++-
 drivers/gpu/drm/panel/panel-sony-acx565akm.c | 9 ++++++++-
 drivers/gpu/drm/panel/panel-tpo-td028ttec1.c | 3 +--
 drivers/gpu/drm/panel/panel-tpo-td043mtea1.c | 9 ++++++++-
 5 files changed, 33 insertions(+), 6 deletions(-)

-- 
Regards,

Laurent Pinchart

