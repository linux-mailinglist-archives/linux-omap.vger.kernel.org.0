Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 836D215D7E1
	for <lists+linux-omap@lfdr.de>; Fri, 14 Feb 2020 14:01:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729080AbgBNNBG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 14 Feb 2020 08:01:06 -0500
Received: from a80-127-99-228.adsl.xs4all.nl ([80.127.99.228]:59454 "EHLO
        hetgrotebos.org" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727970AbgBNNBD (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 14 Feb 2020 08:01:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wizzup.org;
         s=mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:
        To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=Q9PRBzzMe+a3dzAzMxrx0xT2y1fZevZ8aQZ/OjHoBN8=; b=J+8f2YqS5b9SXJ+ctf75ziQntm
        IDqPGFfoH6VLBLfEb78RBz7itd9w+j6Doe5sUOpKFvlB/Ir38fY7Y125Nrrk8maCGT1xGRphJXyOT
        Ka6W94g+va9bmC0V9S+PajK41qIUQjnVm08bAsXDlA/AfuJTlN5a4zCPhbaWGmW4W+VcTRgOsQm7j
        JLo7t4JTOVZhLpHe16q+E6O6M6fwYsEc2CJtLbWqsXWI2SgZhqVTaYTzTjHJRVCRuolNLpcNbpRjq
        KaGBvOF7t6dbOgAZmkZsFeM9kQOXOOze0iTpOD+fs28Tin+gMPGNfwRM2i/PdRf9UNaGcyo9VTKcM
        oA9d1m7Q==;
Received: from kgpe-d16.fritz.box ([192.168.178.22])
        by hetgrotebos.org with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <merlijn@wizzup.org>)
        id 1j2aaS-0002df-Ny; Fri, 14 Feb 2020 13:00:52 +0000
From:   Merlijn Wajer <merlijn@wizzup.org>
To:     merlijn@wizzup.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mattias Jacobsson <2pi@mok.nu>,
        "Darren Hart (VMware)" <dvhart@infradead.org>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [RFC PATCH 0/2] Add SW_MACHINE_COVER key
Date:   Fri, 14 Feb 2020 14:02:46 +0100
Message-Id: <20200214130249.6845-1-merlijn@wizzup.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This series adds the SW_MACHINE_COVER key, and changes the Nokia N900 dts to
expose the key via gpio-keys.

Before, this gpio was used as card detect GPIO, causing the card not to show up
if the phone was booted without cover, see this thread on linux-omap:

    N900: Remove mmc1 "safety feature"? (was: Re: mmc0 on Nokia N900 on Linux 5.4.18)

Since there is no realistic use for using this gpio as card detect, instead
expose it to userspace via gpio-keys. There are no event type for machine covers
yet, so add that first.

The key should be 1 when the cover is closed, and 0 when the cover is open.

Starting the Nokia N900 with the cover removed, putting the cover in place:

    Event: time 1581684523.415296, type 5 (EV_SW), code 16 (?), value 1

Removing the cover again, exposing mmc1 and the battery:

    Event: time 1581684529.413706, type 5 (EV_SW), code 16 (?), value 0

Merlijn Wajer (2):
  Input: add `SW_MACHINE_COVER`
  ARM: dts: n900: remove mmc1 card detect gpio

 arch/arm/boot/dts/omap3-n900.dts       | 12 ++++++++----
 include/linux/mod_devicetable.h        |  2 +-
 include/uapi/linux/input-event-codes.h |  3 ++-
 3 files changed, 11 insertions(+), 6 deletions(-)

-- 
2.23.0

