Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB42415FF5F
	for <lists+linux-omap@lfdr.de>; Sat, 15 Feb 2020 18:01:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726338AbgBORAe (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 15 Feb 2020 12:00:34 -0500
Received: from a80-127-99-228.adsl.xs4all.nl ([80.127.99.228]:45182 "EHLO
        hetgrotebos.org" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726211AbgBORAe (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 15 Feb 2020 12:00:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wizzup.org;
         s=mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:
        To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=/bYhlTgZjq7g++rSKDUPsBEdeWE9dMvdESyFshU2+TM=; b=TvJ04IHTnQv9XjQOpFH0kBkboF
        UK6G36vzXOufs78oN4e2AUFWWvy3+DX6O+1aqxvlgl/J4+Ycs8FDPvpScOy31PUeeAXfmrDrHrLey
        jKR+Sa9EGaL933GOTkmzdj2T6RL+BsLFjY/FB/J/Fhfz9cJA54bqUy98nRNWcwne+5IQ52BcsGF73
        x4VT31q1uYMebxjQyzDmxWLApF9ABxS41rUIeX3unU7KrbNRuBbylThqT79yM0QJFMWqeI+uNO4Ot
        8l5qYFlueJfy4Tx0PjBNHM14WlJFN3HKLyjSTsVRcO6B5R//O5OBWc6OZTVOkWXps+ohDkDuu8JA2
        3rKPY4GA==;
Received: from kgpe-d16.fritz.box ([192.168.178.22])
        by hetgrotebos.org with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <merlijn@wizzup.org>)
        id 1j30nh-00037p-DQ; Sat, 15 Feb 2020 17:00:17 +0000
From:   Merlijn Wajer <merlijn@wizzup.org>
Cc:     Merlijn Wajer <merlijn@wizzup.org>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "Darren Hart (VMware)" <dvhart@infradead.org>,
        Mattias Jacobsson <2pi@mok.nu>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [PATCH 0/2] Add SW_MACHINE_COVER key
Date:   Sat, 15 Feb 2020 18:02:13 +0100
Message-Id: <20200215170216.14397-1-merlijn@wizzup.org>
X-Mailer: git-send-email 2.23.0
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
2.23.0

