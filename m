Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 695703BBD85
	for <lists+linux-omap@lfdr.de>; Mon,  5 Jul 2021 15:33:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230333AbhGENfm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 5 Jul 2021 09:35:42 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.220]:25837 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230188AbhGENfl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 5 Jul 2021 09:35:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625491974;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=fRak6ASlaZRgXZ5yHDMa2KL0jh26L0XGJ2WV3FPhyfo=;
    b=tzOTAYLx/SMn4ocdNEcqqSRTkGO78vSh+bdS/60yhHTYmH1BbSVbe5IniHEOOHHvSP
    /Wh8RH9wdzJ5JuEQkUCR+s2J9fP9eSJmMX3h7Eu+nWzkXS8kzoOF4+V19Excfa/4EUGP
    h6IZnHev0kGqBjy2ztDZLaLp17xms1A/pEcj/H6nmrpFavc93NmpZobtt6v8RioaYQ6/
    7ae3mPGOuj+UJuaNDoGeEH9MJ1caswnc85Wj/3fXfzCS9L6iNtLeRGEpTLU85dt/PIgm
    de/BimLfCjG5CX8DmJJAmum4vDo4IIrY93DVUjgjC9JvR9KH/X60GiCHKsSgJXNe4fhW
    tUeg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmAgw4/qsw=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
    by smtp.strato.de (RZmta 47.28.1 DYNA|AUTH)
    with ESMTPSA id h06665x65DWsJos
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Mon, 5 Jul 2021 15:32:54 +0200 (CEST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH 0/5] ASoC: ti: davinci-mcasp: Fix the DIT mode and OMAP4
 support
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20210704150450.20106-1-peter.ujfalusi@gmail.com>
Date:   Mon, 5 Jul 2021 15:32:53 +0200
Cc:     Mark Brown <broonie@kernel.org>, tony@atomide.com,
        alsa-devel@alsa-project.org, lgirdwood@gmail.com,
        linux-omap@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <E1C17C0D-1363-4109-89B3-A652A2B47703@goldelico.com>
References: <20210704150450.20106-1-peter.ujfalusi@gmail.com>
To:     Peter Ujfalusi <peter.ujfalusi@gmail.com>
X-Mailer: Apple Mail (2.3445.104.21)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi P=C3=A9ter,

> Am 04.07.2021 um 17:04 schrieb Peter Ujfalusi =
<peter.ujfalusi@gmail.com>:
>=20
> Hi,
>=20
> it has been on my todo list for several years to support McASP on =
OMAP4 devices.
> For Galaxy Nexus we had an omap-mcasp driver (which was mostly a =
stripped down
> davinci-mcasp driver) to support what was needed on that specific =
phone + it's
> dock for S/PDIF (48KHz, 16bit, stereo).
>=20
> Not many (if any) device available to test the DIT mode of McASP.
> I have used BeagleBone White (McASP1 AXR3 can be routed to a pin) to =
get the
> S/PDIF mode working then PandaES for OMAP4 support (on PandaES the =
gpio_121 is
> not used and the signal is routed to expansion J6 pin14)
>=20
> In theory the McASP in OMAP5 should be working after this series, but =
the OMAP5
> TRM is not public and I do not have one to check the addresses and see =
if there
> is a way to test it on omap5-uevm.
>=20
> Mark, Tony:
> The ASoC and dts patches can go via separate tree I felt that it is =
better if
> they are together, at least initially.
>=20
> Nikolaus: fyi, this might be useful for Pyra?

Yes, definitively.

I just wonder how compatible it is with the "old" omap-mcasp driver we =
carry
along for the Pyra:

=
https://git.goldelico.com/?p=3Dletux-kernel.git;a=3Dblob;f=3Dsound/soc/ti/=
omap-mcasp.c;h=3D24d839a24f34ec02456176744d3690016592b5a3;hb=3D7789ab635e5=
6a2fd9fe04ca2e9ccfeaccb8e0f52

Does it now have additional functionality or robustness?
And does it need changes of the OMAP5 device tree?

And also important seems to be the ABE/AESS integration where we so far =
failed
to make it work again on more recent kernels. Our most recent patch set =
is here:

=
https://git.goldelico.com/?p=3Dletux-kernel.git;a=3Dshortlog;h=3Drefs/head=
s/letux/aess-v5

Anyways I am happy to see a little progress on the omap4/5 audio =
subsystem.

BR and thanks,
Nikolaus



>=20
> Regards,
> P=C3=A9ter
> ---
> Peter Ujfalusi (5):
>  ASoC: ti: davinci-mcasp: Fix DIT mode support
>  ASoC: dt-bindings: davinci-mcasp: Add compatible string for OMAP4
>  ASoC: ti: davinci-mcasp: Add support for the OMAP4 version of McASP
>  ARM: dts: omap4-l4-abe: Correct sidle modes for McASP
>  ARM: dts: omap4-l4-abe: Add McASP configuration
>=20
> .../bindings/sound/davinci-mcasp-audio.txt    |   1 +
> arch/arm/boot/dts/omap4-l4-abe.dtsi           |  39 ++--
> include/linux/platform_data/davinci_asp.h     |   1 +
> sound/soc/ti/Kconfig                          |   1 +
> sound/soc/ti/davinci-mcasp.c                  | 168 +++++++++++++++---
> 5 files changed, 168 insertions(+), 42 deletions(-)
>=20
> --=20
> 2.32.0
>=20

