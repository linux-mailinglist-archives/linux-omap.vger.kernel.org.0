Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0876ED1AC7
	for <lists+linux-omap@lfdr.de>; Wed,  9 Oct 2019 23:21:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731166AbfJIVV5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 9 Oct 2019 17:21:57 -0400
Received: from muru.com ([72.249.23.125]:36544 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731155AbfJIVV5 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 9 Oct 2019 17:21:57 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 103968140;
        Wed,  9 Oct 2019 21:22:29 +0000 (UTC)
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
Subject: [PATCHv2 0/7] musb host improvments mostly for omap2430 glue
Date:   Wed,  9 Oct 2019 14:21:37 -0700
Message-Id: <20191009212145.28495-1-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

Here's v2 set of musb clean-up mostly for the 2430 glue layer.

Regards,

Tony


Changes since v1:

- Get rid of set_vbus stuff


Tony Lindgren (7):
  usb: musb: omap2430: Get rid of musb .set_vbus for omap2430 glue
  usb: musb: omap2430: Wait on enable to avoid babble
  usb: musb: omap2430: Handle multiple ID ground interrupts
  usb: musb: Add musb_set_host and peripheral and use them for omap2430
  usb: musb: omap2430: Clean up enable and remove devctl tinkering
  usb: musb: omap2430: Idle musb on init
  usb: musb: Get rid of omap2430_musb_set_vbus()

 drivers/usb/musb/musb_core.c | 103 ++++++++++++++++++++++
 drivers/usb/musb/musb_core.h |   3 +
 drivers/usb/musb/omap2430.c  | 164 ++++++++++-------------------------
 3 files changed, 152 insertions(+), 118 deletions(-)

-- 
2.23.0
