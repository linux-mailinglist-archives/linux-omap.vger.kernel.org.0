Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF1F4A40F0
	for <lists+linux-omap@lfdr.de>; Sat, 31 Aug 2019 01:21:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728208AbfH3XVE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 30 Aug 2019 19:21:04 -0400
Received: from muru.com ([72.249.23.125]:59226 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728122AbfH3XVD (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 30 Aug 2019 19:21:03 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id D297880D4;
        Fri, 30 Aug 2019 23:21:31 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Bin Liu <b-liu@ti.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-omap@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>,
        Marcel Partap <mpartap@gmx.net>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Michael Scott <hashcode0f@gmail.com>,
        NeKit <nekit1000@gmail.com>, Pavel Machek <pavel@ucw.cz>,
        Sebastian Reichel <sre@kernel.org>
Subject: [PATCH 0/4] musb host improvments mostly for omap2430 glue
Date:   Fri, 30 Aug 2019 16:20:54 -0700
Message-Id: <20190830232058.53414-1-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi all,

So I ended up cleaning up omap2430 glue layer a bit for host mode with the
various reproducable errors I was seeing docking droid4 to a lapdock. There
are a few fixes, and then we end up removing all the devctl register tinkering
for omap2430 glue layer.

Regards,

Tony


Tony Lindgren (4):
  usb: musb: omap2430: Wait on enable to avoid babble
  usb: musb: omap2430: Handle multiple ID ground interrupts
  usb: musb: Add musb_set_host and peripheral and use them for omap2430
  usb: musb: omap2430: Clean up enable and remove devctl tinkering

 drivers/usb/musb/musb_core.c | 103 ++++++++++++++++++++++++++++++
 drivers/usb/musb/musb_core.h |   3 +
 drivers/usb/musb/omap2430.c  | 118 +++++++++++++----------------------
 3 files changed, 149 insertions(+), 75 deletions(-)

-- 
2.23.0
