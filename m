Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F4D9263300
	for <lists+linux-omap@lfdr.de>; Wed,  9 Sep 2020 18:55:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730699AbgIIQzR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 9 Sep 2020 12:55:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726399AbgIIPwc (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 9 Sep 2020 11:52:32 -0400
Received: from mo6-p00-ob.smtp.rzone.de (mo6-p00-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5300::7])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB3B3C061235
        for <linux-omap@vger.kernel.org>; Wed,  9 Sep 2020 07:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1599662337;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:Message-Id:Cc:Date:From:Subject:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=0TWhVQQ6kTjdx3JXPPJ4REw5JTueYxcrmXN64iUCU+A=;
        b=d8nUc8Or+PGmz91haJi6JZsAySaKNr0FXy0dp8nQpSeU/bT0fuEus7F1+ErJAZO3e4
        M97JXBl9NnLfGMlgaGn+e4HGN/QdvbkTBNn1p6GOQAF/r9FFnwhwg7XkvO9NwZFvyMy8
        0W2wLmdXReLMVJB/xZ1GLXF9Ky/VV1S24V0tUEYXTiRJgwDB7dJ55WexCQpYyYanruJb
        gW8bSaqxB82v4ONusmr5LxmUXUKkk4Smvsc1bXE0sPXUI77Ldy261J4+aRQ1FgDeJ5dB
        dZNOAuTPIbryfd0GxJXC0qMdvoKDKA7bgvvu70yvDPhiPyeN7MnY/Qzir7B0GCVFPSO9
        0c+Q==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmAgw4nsUA=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.10.7 DYNA|AUTH)
        with ESMTPSA id n03b0dw89EcnZgI
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Wed, 9 Sep 2020 16:38:49 +0200 (CEST)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: osd3358 and "poweroff"
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
Date:   Wed, 9 Sep 2020 16:38:49 +0200
Cc:     Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <0A81C17C-873C-4C40-8D5C-9A7065C1304D@goldelico.com>
To:     "beagleboard@googlegroups.com" <beagleboard@googlegroups.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,
I have a custom board based on osd3358 and a little trouble getting the
"poweroff" command work as expected.

The device tree is almost the same as am335x-pocketbeagle.dts and I am =
running a v5.9-rc4 kernel.
Therefore,

&rtc {
	system-power-controller;
};

is defined.

The board is powered through USB (haven't tried other options).

"poweroff" results in:

...
[info] Hardware Clock updated to Wed Sep  9 14:31:56 UTC 2020.
[ ok ] Deactivating swap...done.
[  200.324307] EXT4-fs (mmcblk1p2): re-mounted. Opts: (null)
[info] Will now halt.
[  202.548073] reboot: Power down

After that, the gpio-led showing cpu activity trigger goes off for a =
moment
but after that it is flickering as if there is still CPU activity with =
some
1 second modulation.

Pressing the reset button immediately reboots.

So this means that "poweroff" does not shut down the PMIC and the =
processor
is still idling.

Pressing the power button for 10 seconds does a forced shutdown and the
reset button is without significance.

And hints how to make "poweroff" work are welcome.

BR and thanks,
Nikolaus Schaller



