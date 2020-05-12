Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 487B61D011A
	for <lists+linux-omap@lfdr.de>; Tue, 12 May 2020 23:47:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731251AbgELVrY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 May 2020 17:47:24 -0400
Received: from muru.com ([72.249.23.125]:54218 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728362AbgELVrY (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 12 May 2020 17:47:24 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 0C4148047;
        Tue, 12 May 2020 21:48:09 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>, Rob Herring <robh@kernel.org>
Cc:     Alan Cox <gnomes@lxorguk.ukuu.org.uk>,
        Lee Jones <lee.jones@linaro.org>, Jiri Slaby <jslaby@suse.cz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>,
        Peter Hurley <peter@hurleysoftware.com>,
        Sebastian Reichel <sre@kernel.org>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: [PATCHv8 0/6] n_gsm serdev support and GNSS driver for droid4
Date:   Tue, 12 May 2020 14:47:07 -0700
Message-Id: <20200512214713.40501-1-tony@atomide.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi all,

Here's the updated set of these patches fixed up for Johan's and
Pavel's earlier comments.

This series does the following:

1. Adds functions to n_gsm.c for serdev-ngsm.c driver to use

2. Adds a generic serdev-ngsm.c driver that brings up the TS 27.010
   TTY ports configured in devicetree with help of n_gsm.c

3. Allows the use of standard Linux device drivers for dedicated
   TS 27.010 channels for devices like GNSS and ALSA found on some
   modems for example

4. Adds a gnss-motmdm consumer driver for the GNSS device found on
   the Motorola Mapphone MDM6600 modem on devices like droid4

I've placed the serdev-ngsm.c under drivers/tty/serdev as it still
seems to make most sense with no better places available. It's no
longer an MFD driver as it really does not need to care what channel
specific consumer drivers might be configured for the generic driver.
Now serdev-ngsm just uses of_platform_populate() to probe whatever
child nodes it might find.

I'm not attached having the driver in drivers/tty/serdev. I just
don't have any better locations in mind. So using Johan's earlier
i2c example, the drivers/tty/serdev/serdev-ngsm.c driver is now a
generic protocol and bus driver, so it's getting closer to the
the drivers/i2c/busses analogy maybe :) Please do suggest better
locations other than MFD and misc if you have better ideas.

Now without the chardev support, the /dev/gsmtty* using apps need
to use "U1234AT+CFUN?" format for the packets. The advantage is
less kernel code, and we keep the existing /dev/gsmtty* interface.

If we still really need the custom chardev support, that can now
be added as needed with the channel specific consumer driver(s),
but looks like this won't be needed based on Pavel's ofono work.

Regards,

Tony


Changes since v7 (was accidentally posted as v6 again):
- Updated gsm_serdev_register_tty_port() and gsd_dlci_data() to use
  receive_buf() to have the dlci handling follow the same path as
  for gsm_serdev_register_dlci()

- Updated for Pavel's comments and acks, did not keep the ack for
  n_gsm.c as that has changed

- Moved the GNSS driver binding to serdev-ngsm.yaml as suggested
  by Rob

- Folded in a a fix from kbuild test robot <lkp@intel.com>
  to make motmdm_gnss_send_command() static

Changes since v6:
- Based on comments from Johan, moved back to using the existing
  TS 27.010 TTYs created by n_gsm.c instaed of adding custom chardev
  support to deal with the Motorola custom protocol

- Based on comments from Johan, made the serdev-ngsm driver generic
  with just minimal quirk handling for the Motorola modem

- Dropped the Motorola custom protocol on top of TS 27.010 handling
  from serdev-ngsm.c as this can now be easily handled by the channel
  specific drivers as needed

- Added few more helpers to n_gsm.c for serdev-ngsm.c to use

- Added the channel specific GNSS driver for the Motorola modem

Changes since v5:
- Cosmetic fixes for issues noted by Pavel

Changes since v4:
- Use drivers/tty/serdev/protocol directory for the driver instead of
  drivers/mfd as discussed on the lists for v3 set of patches
- Fix remove to call kfree only after removing device from the list

Changes since v3:
- Update list of folks in Cc, looks like I sent v3 only to Lee and lkml
- Init privdata before motmdm_register_dlci calls gsm_serdev_register_dlci
- Update binding based on Rob's comments for license and "allOf"

Changes since v2:
- Drop useless send_command indirection, use static motmdm_send_command

Changes since v1:

- Simplified usage and got rid of few pointless inline functions
- Added consumer MFD driver, devicetree binding, and dts changes


Tony Lindgren (6):
  tty: n_gsm: Add support for serdev drivers
  dt-bindings: serdev: ngsm: Add binding for serdev-ngsm
  dt-bindings: serdev: ngsm: Add binding for GNSS child node
  serdev: ngsm: Add generic serdev-ngsm driver
  gnss: motmdm: Add support for Motorola Mapphone MDM6600 modem
  ARM: dts: omap4-droid4: Configure modem for serdev-ngsm

 .../bindings/serdev/serdev-ngsm.yaml          |  73 +++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 .../boot/dts/motorola-mapphone-common.dtsi    |  14 +
 drivers/gnss/Kconfig                          |   8 +
 drivers/gnss/Makefile                         |   3 +
 drivers/gnss/motmdm.c                         | 419 ++++++++++++++++
 drivers/tty/n_gsm.c                           | 435 +++++++++++++++++
 drivers/tty/serdev/Kconfig                    |  10 +
 drivers/tty/serdev/Makefile                   |   1 +
 drivers/tty/serdev/serdev-ngsm.c              | 449 ++++++++++++++++++
 include/linux/serdev-gsm.h                    | 165 +++++++
 11 files changed, 1579 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/serdev/serdev-ngsm.yaml
 create mode 100644 drivers/gnss/motmdm.c
 create mode 100644 drivers/tty/serdev/serdev-ngsm.c
 create mode 100644 include/linux/serdev-gsm.h

-- 
2.26.2
