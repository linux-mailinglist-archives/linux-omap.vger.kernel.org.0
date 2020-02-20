Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A3CC1667C7
	for <lists+linux-omap@lfdr.de>; Thu, 20 Feb 2020 20:59:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728958AbgBTT7s (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 20 Feb 2020 14:59:48 -0500
Received: from muru.com ([72.249.23.125]:56524 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728770AbgBTT7r (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 20 Feb 2020 14:59:47 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id CC9438080;
        Thu, 20 Feb 2020 20:00:30 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Lee Jones <lee.jones@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Alan Cox <gnomes@lxorguk.ukuu.org.uk>, Jiri Slaby <jslaby@suse.cz>,
        Johan Hovold <johan@kernel.org>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>,
        Peter Hurley <peter@hurleysoftware.com>,
        Rob Herring <robh@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCHv4 0/4] n_gsm serdev support and mfd driver for droid4 modem
Date:   Thu, 20 Feb 2020 11:59:39 -0800
Message-Id: <20200220195943.15314-1-tony@atomide.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi all,

Here's v4 set of n_gsm serdev support patches, and the related MFD
driver for the modem found on Motorola Mapphone phones and tablets
like droid4.

This series only adds basic character device support for the MFD
driver. Other serdev consumer drivers for specific devices will be
posted separately.

The patches are against v5.6-rc1.

Regards,

Tony

Changes since v3:
- Update list of folks in Cc, looks like I sent v3 only to Lee and lkml
- Init privdata before motmdm_register_dlci calls gsm_serdev_register_dlci
- Update binding based on Rob's comments for license and "allOf"

Changes since v2:
- Drop useless send_command indirection, use static motmdm_send_command

Changes since v1:

- Simplified usage and got rid of few pointless inline functions
- Added consumer MFD driver, devicetree binding, and dts changes


Tony Lindgren (4):
  tty: n_gsm: Add support for serdev drivers
  mfd: motmdm: Add Motorola TS 27.010 serdev modem driver for droid4
  dt-bindings: mfd: motmdm: Add binding for motorola-mdm
  ARM: dts: omap4-droid4: Enable basic modem support

 .../mfd/motorola,mapphone-mdm6600.yaml        |   34 +
 .../boot/dts/motorola-mapphone-common.dtsi    |    6 +
 drivers/mfd/Kconfig                           |    9 +
 drivers/mfd/Makefile                          |    1 +
 drivers/mfd/motorola-mdm.c                    | 1200 +++++++++++++++++
 drivers/tty/n_gsm.c                           |  372 +++++
 include/linux/serdev-gsm.h                    |  168 +++
 7 files changed, 1790 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/motorola,mapphone-mdm6600.yaml
 create mode 100644 drivers/mfd/motorola-mdm.c
 create mode 100644 include/linux/serdev-gsm.h

-- 
2.25.1
