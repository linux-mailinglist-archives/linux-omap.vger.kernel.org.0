Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB424471E6B
	for <lists+linux-omap@lfdr.de>; Sun, 12 Dec 2021 23:59:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230085AbhLLW7g (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 12 Dec 2021 17:59:36 -0500
Received: from mail.wizzup.org ([95.217.97.174]:43994 "EHLO wizzup.org"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229979AbhLLW7g (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 12 Dec 2021 17:59:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wizzup.org;
        s=mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:
        To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=axi+agaglWymblx9vuzyxgGH3HyhORutd0j5nwg1W6Q=; b=EAPftnidlmCRuSRTd1S3S253QY
        7wXQq8f6B27bGds+6x+k7VMWDaI1ZPHoY1dkhV4O/m69EZonUVYn2pvZaMzNYTQExZF1ViSjWA+2F
        8vX53sPW7j0BDORS0c9bIQJd5IcZbDnuRPJZ6UIj8wLzChrMCJY/C87RWj/hJP0ffNoPGTgfx/rmT
        17XqyydcUeu4wZYa5r/K/SW0krwCfUodi3BoFfv6bgnjHnF6ksSxOXvT2zl6CjhB+WVWi54ftvAac
        eVAO7e/zrcNuz+tKTp8uvzLoGzdPJYXaDF/rTBCQU+H0Sug3DQYPQQUVcRArkwNGG+MiqVGfzzAAn
        OnV3cmJw==;
Received: from [45.83.235.159] (helo=gentoo-x13.fritz.box)
        by wizzup.org with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <merlijn@wizzup.org>)
        id 1mwXoS-0001el-It; Sun, 12 Dec 2021 22:59:24 +0000
From:   Merlijn Wajer <merlijn@wizzup.org>
To:     merlijn@wizzup.org
Cc:     Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Dev Null <devnull@uvos.xyz>, Tony Lindgren <tony@atomide.com>,
        Sebastian Reichel <sre@kernel.org>, linux-omap@vger.kernel.org,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>
Subject: [RFC PATCH 0/2] Add support for Motorola Droid 3 (XT862)
Date:   Mon, 13 Dec 2021 00:04:57 +0100
Message-Id: <20211212230459.13579-1-merlijn@wizzup.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

This series adds support for the Motorola Droid 3 (XT862). It's still work in
progress and builds on the great work done to support the Motorola Droid 4 and
Motorola Bionic - comments and reviews are quite welcome.

In particular, I think the motorola-mapphone-common.dtsi could use some changes,
because:

* It is unclear if the Droid 3 has support for ramoops/pstore, so currently
  omap4-droid3-xt862.dts deletes ramoops node in motorola-mapphone-common.dtsi
* Same as above, except that the Droid 3 has less ram than the Droid Bionic and
  the Motorola Droid 4 (which are currently the only users of
  motorola-mapphone-common.dtsi)

Note that the following does not yet work and help is appreciated in making that
work:

1. Changing the display backlight (it's always on, quite bright)
2. The keyboard backlights do not work yet
3. The modem is seem on usb, but something is still misconfigured, and a
   (patched) ofono doesn't pick it up currently.
4. Reading the battery capacity properly

I hope to fix at least 1-3 before I plan to submit this for inclusion.

What works:

* Serial
* Display
* Keyboard
* Touchscreen
* gpio keys (slider, power button, volume buttons)
* Wireless
* Power/idle/sleep modes - easily lasts over a day
* Light sensor
* Accelerometer
* 3D (with out of tree SGX patches and closer userspace)

Any feedback is much appreciated!

Regards,
Merlijn

Merlijn Wajer (2):
  pmic-cpcap: add motorola,droid3 compatible
  Droid3: add initial DTS

 arch/arm/boot/dts/Makefile                    |   1 +
 .../boot/dts/motorola-mapphone-common.dtsi    |   4 +-
 arch/arm/boot/dts/omap4-droid3-xt862.dts      | 166 ++++++++++++++++++
 arch/arm/mach-omap2/pmic-cpcap.c              |   3 +-
 4 files changed, 171 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm/boot/dts/omap4-droid3-xt862.dts

-- 
2.32.0

