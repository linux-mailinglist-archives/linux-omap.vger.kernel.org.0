Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E91412FC90
	for <lists+linux-omap@lfdr.de>; Fri,  3 Jan 2020 19:29:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728286AbgACS3N (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 3 Jan 2020 13:29:13 -0500
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.20]:13056 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728251AbgACS3N (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 3 Jan 2020 13:29:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1578076150;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=fIiUAFaJKRCZDkohT1aGQDBd6CWmC0Y22jxPKakOrTo=;
        b=E//tiWU5XeJpUC6pUZtEaBXmaEMrMUTMjnTFhiyaH7nHHt4QkC2yxTVSvODxc+8Pvb
        fEtxtp3u7GEDFM3nWdY9lYYB/qyAEWmqd5dbtAwL8p16Py7KuDXWslJmUHO1gXKGt2Z0
        o/RDi3/Euc3mBEEYYZbUaKqg5MPJPAX2DObSlD6iqL51m0it4B3nXQoZDTFEaV3A9/Pp
        rGkGqUg8jX9xYlDsuWt0CQYYGOaP05SI+EwhbGAUvPpGz3C18eQgPMg0ey2qkq/TbQ08
        +7WeDa1HQzggHJ//tKXNI/1ElE/zS75TY1N9/N0gzQ8pv8O4qCUMdigPANBVi1a0Lu4q
        /RfA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmMkw43qEhA="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.1.3 DYNA|AUTH)
        with ESMTPSA id a09dafw03IT3O7y
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Fri, 3 Jan 2020 19:29:03 +0100 (CET)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [BISECTED, REGRESSION] OMAP3 onenand/DMA broken
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200103172326.GF15023@darkstar.musicnaut.iki.fi>
Date:   Fri, 3 Jan 2020 19:29:03 +0100
Cc:     Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <521CC383-1118-480F-BC3B-B0E12F9F4CFC@goldelico.com>
References: <20200103081726.GD15023@darkstar.musicnaut.iki.fi> <6D46CA13-2E50-4144-86F1-CE4988BD654D@goldelico.com> <20200103172326.GF15023@darkstar.musicnaut.iki.fi>
To:     Aaro Koskinen <aaro.koskinen@iki.fi>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Aaro,

> Am 03.01.2020 um 18:23 schrieb Aaro Koskinen <aaro.koskinen@iki.fi>:
>=20
> Hi,
>=20
> On Fri, Jan 03, 2020 at 09:46:58AM +0100, H. Nikolaus Schaller wrote:
>>> Am 03.01.2020 um 09:17 schrieb Aaro Koskinen <aaro.koskinen@iki.fi>:
>>> When booting v5.4 (or v5.5-rc4) on N900, the console gets flooded =
with:
>>>=20
>>> [    8.335754] omap2-onenand 1000000.onenand: timeout waiting for =
DMA
>>> [    8.365753] omap2-onenand 1000000.onenand: timeout waiting for =
DMA
>>> [    8.395751] omap2-onenand 1000000.onenand: timeout waiting for =
DMA
>>> [    8.425750] omap2-onenand 1000000.onenand: timeout waiting for =
DMA
>>> [    8.455749] omap2-onenand 1000000.onenand: timeout waiting for =
DMA
>>> [    8.485748] omap2-onenand 1000000.onenand: timeout waiting for =
DMA
>>> [    8.515777] omap2-onenand 1000000.onenand: timeout waiting for =
DMA
>>> [    8.545776] omap2-onenand 1000000.onenand: timeout waiting for =
DMA
>>> [    8.575775] omap2-onenand 1000000.onenand: timeout waiting for =
DMA
>>>=20
>>> making the system unusable.
>>=20
>> I can confirm that this issue exists but so far we failed to bisect
>> and make a proper report.
>>=20
>> Sometimes the system boots fine and sometimes it fails.

Well, we boot from =C2=B5SD and the number of the timeouts changes. So =
it may
be a race or depend on driver load sequence if we come to a login: or =
not.
But this is not the real bug.

>>=20
>> It happens on omap3-gta04a5one.dts only, but not with =
omap3-gta04a4.dts
>> (both dm3730 but different NAND).
>=20
> I tried three different boards (N810, N900 and N950) and it always
> fails reliably.

The big question is why the patch is harmful.

I tried to understand what the patch is doing (without any knowledge
about the DMA hard- or software architecture).

Basically it reorders error handling and some corner cases.
Maybe it handles one differently that happens only for OneNAND.

What did jump to my mind is that before the patch there is an
unconditional call to omap_dma_chan_read(c, CCR) if (!c->paused && =
c->running)=20

And then DMA_COMPLETE is returned or ret if txstate =3D=3D 0

With the new code the check for DMA_COMPLETE comes first and
directly leads to a return. Independently of txstate.

So if we have (!c->paused && c->running) and dma_cookie_status()
returns DMA_COMPLETE, there is no longer a call to omap_dma_chan_read()

Since I do not understand what omap_dma_chan_read() is doing,
and if (!c->paused && c->running) is relevant here,
I can not conclude if that is harmful.

But I can imagine that reading a register may have a side-effect of
resetting some bit like interrupt status registers.

I hope that Peter or Tony can respond soon.

BR and thanks,
Nikolaus



