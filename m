Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DCD82BE79
	for <lists+linux-omap@lfdr.de>; Tue, 28 May 2019 07:04:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726657AbfE1FEL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 28 May 2019 01:04:11 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.24]:13577 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725927AbfE1FEL (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 28 May 2019 01:04:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1559019849;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=9WkeJIWpDgnu/Qz4CisdQbmN4fg73bYivCn+uApvxPE=;
        b=Sn10ohc5sWbPmZcT1rIiPBdB/owS5EU6vwe3FATeM0atc2lFIDRH5afCp8t2AHFODu
        HkjhAuoXi40wbJwet5az/GMopSS4XBzTqc7KhnTjZCoOmLXq0ak+WfYsGTQy95Z1vN6i
        A8GI212532pKaSn1jtrdTuJH4OjrZTff3Qx6FbcE7PAPFDUk2XmT0ii6GPgK3MwYJRbs
        SFV/eLrwRCxN7aVWQZvNf2MzXMdWoV56OfjUEL6yK/M/RRNRAP9BC0Fso0hVbZeWc7S4
        vm1MAq49XcNkCiW58yWCxEtOreYLjABeD1Dhj1TJ/EzDpU+QeluFpkIHjJ0w4crAbXBA
        H0iw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/zvwDCv+Ds="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 44.18 DYNA|AUTH)
        with ESMTPSA id j04dc1v4S53bn3g
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Tue, 28 May 2019 07:03:37 +0200 (CEST)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: omap2plus_defconfig broken on ARMv6
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20190527204135.GA24195@darkstar.musicnaut.iki.fi>
Date:   Tue, 28 May 2019 07:03:36 +0200
Cc:     Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Russell King <linux@armlinux.org.uk>
Content-Transfer-Encoding: quoted-printable
Message-Id: <56990EA4-E280-4C78-9536-E8AE1964725E@goldelico.com>
References: <20190524220731.GB4597@t60.musicnaut.iki.fi> <20190527055746.GH5447@atomide.com> <20190527204135.GA24195@darkstar.musicnaut.iki.fi>
To:     Aaro Koskinen <aaro.koskinen@iki.fi>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


> Am 27.05.2019 um 22:41 schrieb Aaro Koskinen <aaro.koskinen@iki.fi>:
>=20
> Hi,
>=20
> On Sun, May 26, 2019 at 10:57:46PM -0700, Tony Lindgren wrote:
>> * Aaro Koskinen <aaro.koskinen@iki.fi> [190524 22:07]:
>>> Noticed today that booting omap2plus_defconfig on N8x0 crashes
>>> early. Disabling CONFIG_SMP makes it work.
>>=20
>> OK. It sure used to work when I last tested but that's been quite
>> a while now. Any ideas which commit caused the ldrexd regression?
>=20
> No idea, I tried even 3.16 and even that seems to have the same issue
> if multi v6/v7 and SMP is selected.

Could it be an unknown compiler issue?

I just had the effect that v5.2-rc1 started to try to build gcc-plugins
(something I had never heard of before) because some Kconfig defaults
were changed. And my cross-compiler setup is not capable of doing that.

I have grepped a little into the code and the offending assembler =
statements
seem to come from __cmpxchg64() which is indeed very old [1]. But the =
question
may be why this 64 bit code is compiled for a 32 bit ARMv6.

Other code seems to be guarded by #ifndef CONFIG_CPU_V6	/* min ARCH >=3D =
ARMv6K */

[1]: =
https://elixir.bootlin.com/linux/v5.2-rc2/source/arch/arm/include/asm/cmpx=
chg.h#L244
     =
https://elixir.bootlin.com/linux/v3.16.68/source/arch/arm/include/asm/cmpx=
chg.h#L230=
