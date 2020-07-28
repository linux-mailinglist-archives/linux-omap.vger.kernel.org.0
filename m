Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87B3A23082C
	for <lists+linux-omap@lfdr.de>; Tue, 28 Jul 2020 12:54:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728876AbgG1Kyu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 28 Jul 2020 06:54:50 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.50]:34175 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728784AbgG1Kyt (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 28 Jul 2020 06:54:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1595933684;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:Message-Id:Cc:Date:From:Subject:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=nrgJQ6ZENefiwXSqi0/qBGfd7KcWeXLw3l68EYLtFRA=;
        b=pQHfuM1Ng/9+6w36XJf6eBWb5rkJd+Pdr9sUzbvFwGzSVJ+viS5qF54ua5Z9+3loRt
        HDbX3jyn21fUKwTXJDk5I4U2aa5pwBEqBia2vLYN4pMY2b1dyBnBlZoMB75Cu94MN578
        +SQzn+KWa25lc6kHzNRrkA1CLcADI8qtt7F+r3ZnqMp8tQjZiB5JqBN9D4a6ArCc93BP
        k2X+DH5OIzs1y3xb2q7lcFjJ4eZvtSJc6PFZ7eq3cLf0l67m8XkOsdkUU/XWvuy5swa6
        SpSQnlaIbyMsAwSyEADve6raYrLIxRmcUSDuGjSaSJj0NqOSvKO+6P4zJ7kSXJpZ3Z/a
        AZ2g==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/vqwDrG"
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.10.5 DYNA|AUTH)
        with ESMTPSA id V07054w6SAsXC6k
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Tue, 28 Jul 2020 12:54:33 +0200 (CEST)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: omap-abe-twl6040 and aess
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
Date:   Tue, 28 Jul 2020 12:54:32 +0200
Cc:     Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
        kernel@pyra-handheld.com, Linux-OMAP <linux-omap@vger.kernel.org>,
        Andrey Utkin <andrey_utkin@fastmail.com>,
        Belisko Marek <marek.belisko@gmail.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <39175614-8484-493C-B580-8DAF5B53F80B@goldelico.com>
To:     David Shah <dave@ds0.me>, Tony Lindgren <tony@atomide.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,
long time ago the LetuxOS kernel project had started to forward-port the =
abe/aess
extensions from the TI kernel and carried them along, but it got more =
and more
broken...

At some point we were not even able to play "normal" sound on the =
twl6040 of the Pyra.

Finally I have invested some time to reintegrate and fix most of the =
fragments on top of
v5.8-rc so that it:

* adds DTS nodes for ranges and reg mapping
* compiles the code
* still supports non-aess sound like upstream omap-abe-twl6040.c
* loads the aess driver as a separate and independent module
* tries to download aess firmware
* gracefully falls back to upstream omap-abe-twl6040.c functionality if =
aess firmware load fails

The following extensions of the TI code are for further study:
* DMIC 0/1/2 support
* SPDIF
* AESS
* connections between McBSP1,2,3 for FM, Bluetooth, Modem

The tree based on v5.8-rc7 is here:

	=
https://git.goldelico.com/?p=3Dletux-kernel.git;a=3Dshortlog;h=3Drefs/head=
s/letux/aess-v5

Some of these patches are cosmetics for omap-abe-twl6040.c and can =
probably already be
upstreamed now.

Note that this series contains the earlier attempt and does a REVERT to =
upstream omap-abe-twl6040.c
on which the new code is based on. The earlier and reverted patches are =
only for reference because
they contain code that has not yet been ported.

A full kernel which can run on the Pyra (tested with letux_defconfig) is =
here:

	=
https://git.goldelico.com/?p=3Dletux-kernel.git;a=3Dshortlog;h=3Drefs/head=
s/work-aess-new

Comments, patches, suggestions, help, support, critics are welcome.

Maybe we can eventually get this beast working with upstream kernels...

BR,
Nikolaus

root@letux:~# dmesg|fgrep aess
[   17.049578] omap-abe-twl6040 sound: loading =
/lib/firmware/omap_aess-adfw.bin failed with error -22
[   17.071299] omap-abe-twl6040 sound: Direct firmware load for =
omap_aess-adfw.bin failed with error -22
[   17.131717] omap-abe-twl6040 sound: Failed to load firmware =
omap_aess-adfw.bin: -22
root@letux:~#=20=
