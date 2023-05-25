Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 224477107B9
	for <lists+linux-omap@lfdr.de>; Thu, 25 May 2023 10:38:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236061AbjEYIip (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 25 May 2023 04:38:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235472AbjEYIil (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 25 May 2023 04:38:41 -0400
X-Greylist: delayed 215 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 25 May 2023 01:38:06 PDT
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [85.215.255.23])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3423610C7
        for <linux-omap@vger.kernel.org>; Thu, 25 May 2023 01:38:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685003577; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=my2q+7AzDsrDS8y5iMprr2PjHTBN+QdVfCJ7R8ghY2CD6GyjBBE34UGid6o8/oLst+
    kRjUafXqL4P6zLvp+s4cqpZI6OBUAoNflqwbr8DkwULrh2qadZGZAOXYtv9AogkQai7k
    c1HGPTQlGNns5cfAy2VOuUStRUMyGHG427QTFJUvFeMDrBJf8KVsJDWCaGNF6fGPjHtb
    42t6cig+xIgUdLI0wkjycKLSP/cSravzui85rQwRTSk+kyrz6x5oyGpPn00r+42nXJaH
    17KBbdHXASKUM54XtV8wIoczHlbjAC6XzKNK+fTjqvch1hWw8V9rgzF6U4kFhdCHAisn
    Ayyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1685003577;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=bYw2wTj+60JTkESJwfwPXMslUtoO18yYSoPS4LpEpq8=;
    b=cDIaGdT5NqaeQEEprakzugCT4YfSghlOLlNbxwEVHC6VHVGrco+5JR3guT7ZuDnJOq
    Ox5rWj1A+vYxnb962n0fWmzOZHccb+dk8Sa+HJeKlJuTr+k1w9LH6LwxTLpN/YRifzWz
    wEy7tPO1apJU0UPQkvPKC7B46WFi2/FhsIb2qBxORAoxc6yvyeavTHreOWo+sx0n4yto
    d0BXVrCt8TdCj24xbP5tZa7NDP6E6EivB5GPaPEo5URtPaBs8g1v/45YQZMtcvvgbIIT
    0hGjmoxkTBpuYGJ7OvI5H1ak+eeHheLpTNvut+t5K+wkmuTDBOUcznL21BMGnzPSgHy7
    YaLg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1685003577;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=bYw2wTj+60JTkESJwfwPXMslUtoO18yYSoPS4LpEpq8=;
    b=cdJ+hRXRTIJFcrSynj2mL5qNSvGkBiiXi0nJFjMGnauI+Uzi2bjP68UAP6HJ4HkAsx
    JUzTxs9p13XnX3VsOUB3fbOwctDjc0JQlgW5s4HrKtXkO6U+uG5+R5F2JnBxTXunbKuJ
    pxWNFM1jvZ0SmqW0jJw29ivCUzDg3K39HbU4NI7BFOoG49bV3s4Orf0x4UsRsOus7087
    zadennoVN1gx53AaONyyhgbzPcjcjQy0dZcRrIqfA96cmVehyv47I5shK7SzRAn/Vpit
    aI7ucErm9kIq/vZ/5a3hIhd5ZjVM9EYTYKBDsLHIqt2g5bNUsUj4V3EgdXtOp5yMuz59
    0FuA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1685003577;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=bYw2wTj+60JTkESJwfwPXMslUtoO18yYSoPS4LpEpq8=;
    b=BXhRRDu2MKYzIJ1yQRryLxjPIRq7JqAwhGCr7fkMqzWGFvOtCtXCyphbramzy9XytN
    6w8IH6uE0J9Rm2xF90Ag==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Apz9PSN6LgsXcGZjzY="
Received: from imac.fritz.box
    by smtp.strato.de (RZmta 49.4.0 DYNA|AUTH)
    with ESMTPSA id C9fe35z4P8WvkQ1
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Thu, 25 May 2023 10:32:57 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: OMAP4/5 AESS on v6.4
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20230525045340.GA14287@atomide.com>
Date:   Thu, 25 May 2023 10:32:56 +0200
Cc:     =?utf-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>,
        linux-omap@vger.kernel.org, Letux-kernel@openphoenux.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <85922330-D19F-474A-9F23-F12CCAC68491@goldelico.com>
References: <FFF13275-327A-4E3C-95E5-88B6A376F582@goldelico.com>
 <20230525045340.GA14287@atomide.com>
To:     Tony Lindgren <tony@atomide.com>
X-Mailer: Apple Mail (2.3445.104.21)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

> Am 25.05.2023 um 06:53 schrieb Tony Lindgren <tony@atomide.com>:
>=20
> * H. Nikolaus Schaller <hns@goldelico.com> [230524 07:40]:
>> Hi Tony and Peter,
>> I have upgraded my WIP tree to v6.4-rc3 now.
>>=20
>> It is almost working, firmware can be built, and is loaded, =
subdevices are presented, graph
>> has been verified against the working 3.15 version, legacy sound =
works, amixer settings are
>> fine, etc.
>>=20
>> The last remaining issue (before the next reveals itself) is that the =
AE DSP isn't running.
>> Playing a sound gets stuck in wait_for_avail() in =
sound/core/pcm_lib.c obviously waiting for=20
>> some interrupt or DMA trigger from the DSP.
>>=20
>> Kernel log/user-space symptoms are:
>>=20
>> [   36.957956] omap-abe-twl6040 sound: playback write error (DMA or =
IRQ trouble?)
>> play WARN alsa: Input/output error
>>=20
>> So it may either be a clocking or power issue or something with =
initialization.
>> Very difficult to find. Also symptomatic seems to be that I can =
hex-dump the /sys/kernel/debug
>> files for cmem, dmem, and smem but not pmem.
>>=20
>>=20
>> Therefore I am currently going once again through all questionable =
code where I
>> had noted a FIXME to tell that it is obviously not compatible to =
modern
>> kernels and has not yet been fixed.
>>=20
>>=20
>> One such place is
>>=20
>> =
https://git.goldelico.com/?p=3Dletux-kernel.git;a=3Dblob;f=3Dsound/soc/ti/=
aess/omap-aess-pcm.c;h=3De9c8b9a00f032f336cac8cbb7e441ce8a7476507;hb=3D74d=
b6d179bad60cdad29a8704f9e606f8cffccd3#l673
>>=20
>> where there is a "context-lost mechanism" which was removed in v4.18.
>>=20
>> Any ideas what that "context lost" is or how it can be fixed in =
modern kernels?
>=20
> There does not seem to be a Linux framework directly usable for this, =
maybe
> the reset framework could be used with addition of some kind of reset =
status
> function.

I have not found the reference any more but it appears that there was =
some code
in the omap2 subsystem long time ago. But I may be wrong.

>=20
> Initially for your driver, you could simply always restore the context =
in
> runtime PM resume to start with.

Ok, that should not harm.

> You could also check some driver registers for
> context lost status in the driver as the context lost registers are =
outside
> the driver IO range. And after that, using reset framework for context =
lost
> status could be done, maybe by adding support to =
drivers/soc/ti/omap_prm.c.

Ok. I'll look into that.
Maybe all this is not the reason why the driver doesn't work but who =
knows...

>=20
>> You may also try or review the full tree:
>>=20
>> =
https://git.goldelico.com/?p=3Dletux-kernel.git;a=3Dshortlog;h=3Drefs/head=
s/aess-6.4-rc3
>>=20
>> I haven't tried that as a stand-alone without my other local Letux =
patches for my
>> devices, but I think it can run at least on PandaES and omap5uevm =
after configuring
>> omap2plus_defconfig.
>>=20
>> Building firmware is best done on the device and running a script =
like this one:
>>=20
>> =
https://git.goldelico.com/?p=3Dletux-kernel.git;a=3Dblob;f=3DLetux/root/bu=
ild-aess-fw;h=3D0bfe59559e5395fb1e5ad32bbbac676d7665aa22;hb=3Drefs/heads/l=
etux-current
>>=20
>> This clones the kernel git repo and tries to build the firmware on =
the target device.
>> I have only tested on Debian 9.13. Other releases may reveal subtle =
conflicts in system
>> include files...
>>=20
>>=20
>> Any help (also by readers) to get this beast finally working is =
welcome.
>=20
> Based on a quick glance it looks like pretty much a standard Linux =
driver
> that loads firmware :)

Indeed. Most of the work I have done the past months (years?) was to =
update
the firmware load and build mechanisms to use the modern firmware APIs. =
And
track some significant changes in ALSA data structures.

I have now tested the current code on the omap5uevm using =
omap2plus_defconfig
which showed that I had to fix two issues. With these updates it works =
(update
force-pushed to
=
https://git.goldelico.com/?p=3Dletux-kernel.git;a=3Dshortlog;h=3Drefs/head=
s/aess-6.4-rc3).

One issue was an undefined reference to some aess function if =
CONFIG_SND_SOC_OMAP_AESS
was disabled (the default) and the other was the (not) well known =
limitation of DMA
channels to 32. So I have added a modification for the omap5uevm.dts to =
disable McSPI1 and
McSPI4 since they are not connected to the outside world and the pins =
are used
for something else. This frees enough DMA channels so that McPDM can use =
them.

Now it works either without CONFIG_SND_SOC_OMAP_AESS (default) in pure =
legacy
mode as before or with CONFIG_SND_SOC_OMAP_AESS and firmware. There I =
can
use device 11 for the legacy mode but device 5 reports the same
error coming from wait_for_avail().

To enable, either add CONFIG_SND_SOC_OMAP_AESS=3Dy or =
CONFIG_SND_SOC_OMAP_AESS=3Dm
to the omap2plus_defconfig.

No I wonder if this work can be upstreamed to staging? Including the =
firmware
source code (which makes it much easier to keep them in sync if they are =
part
of the same kernel tree and not a separate project and git repo)?

This could allow more developers to work on it.

But there is no "sound/staging" subdirectory and moving things to =
"drivers/staging/aess"
would interfere with existing "sound/soc/ti" which is also patched =
significantly
in this branch. So a separate staging location would split up code to =
too many locations.

Best regards,
Nikolaus=
