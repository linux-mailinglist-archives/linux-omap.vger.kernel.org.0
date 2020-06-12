Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8CBC1F7823
	for <lists+linux-omap@lfdr.de>; Fri, 12 Jun 2020 14:53:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726329AbgFLMx2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 12 Jun 2020 08:53:28 -0400
Received: from a80-127-99-228.adsl.xs4all.nl ([80.127.99.228]:52326 "EHLO
        hetgrotebos.org" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726085AbgFLMx1 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 12 Jun 2020 08:53:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wizzup.org;
         s=mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:
        To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=P/4m8oH4r9vKUxudC6qh4bZsAwsr4DkQ56baJece2HA=; b=OAznpocwDW+mYL9vTj11Ykec3Q
        hzBvmkfJqwUPtSdQU6hEhc6s5KIcEwaNh5e8w/Or1fD6/qFXGBzv28eW02cL3lnC/wMF2/u+cJZAY
        Yzf3dvc1EeCdI7rbX4l9YQKAAi7hSg5ZkcG6bEUDuJdnFEgzLjMicZzo/uGqcqsZ2Wg5OeUGLN8BE
        s4CISuoDb5N9QP1kulwAlaTnuMReVOnHH6hQ1AxdwfHVfc7TkzamPvnQEGxrd3Ucxx7hb+WpWjBD+
        FKQPDAeKEjI44Bg6D3ZBa2x+AmspubAOEFEox5jUO0rItJQl7F/tSjaLeQ0d1Pwsm1p7QPVYL/y/I
        3q2vySjQ==;
Received: from kgpe-d16.fritz.box ([192.168.178.62])
        by hetgrotebos.org with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <merlijn@wizzup.org>)
        id 1jjjBC-0007uZ-7h; Fri, 12 Jun 2020 12:53:06 +0000
From:   Merlijn Wajer <merlijn@wizzup.org>
Cc:     pavel@ucw.cz, Merlijn Wajer <merlijn@wizzup.org>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Borislav Petkov <bp@suse.de>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Mattias Jacobsson <2pi@mok.nu>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Mark Gross <mgross@linux.intel.com>,
        linux-omap@vger.kernel.org (open list:OMAP DEVICE TREE SUPPORT),
        devicetree@vger.kernel.org (open list:OMAP DEVICE TREE SUPPORT),
        linux-kernel@vger.kernel.org (open list),
        linux-input@vger.kernel.org (open list:INPUT (KEYBOARD, MOUSE, JOYSTICK
        , TOUCHSCREEN)...)
Subject: [PATCH 0/2] Add SW_MACHINE_COVER key
Date:   Fri, 12 Jun 2020 14:53:57 +0200
Message-Id: <20200612125402.18393-1-merlijn@wizzup.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

this series adds the sw_machine_cover key, and changes the nokia n900 dts to
expose the key via gpio-keys.

before, this gpio was used as card detect gpio, causing the card not to show up
if the phone was booted without cover, see this thread on linux-omap:

    n900: remove mmc1 "safety feature"? (was: re: mmc0 on nokia n900 on linux 5.4.18)

since there is no realistic use for using this gpio as card detect, instead
expose it to userspace via gpio-keys. there are no event type for machine covers
yet, so add that first.

the key should be 1 when the cover is closed, and 0 when the cover is open.

starting the nokia n900 with the cover removed, putting the cover in place:

    event: time 1581684523.415296, type 5 (ev_sw), code 16 (?), value 1

removing the cover again, exposing mmc1 and the battery:

    event: time 1581684529.413706, type 5 (ev_sw), code 16 (?), value 0

Merlijn Wajer (2):
  Input: add `SW_MACHINE_COVER`
  ARM: dts: n900: remove mmc1 card detect gpio

 arch/arm/boot/dts/omap3-n900.dts       | 12 ++++++++----
 include/linux/mod_devicetable.h        |  2 +-
 include/uapi/linux/input-event-codes.h |  3 ++-
 3 files changed, 11 insertions(+), 6 deletions(-)

-- 
2.24.1

