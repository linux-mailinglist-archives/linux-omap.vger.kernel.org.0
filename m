Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6D0A155A1A
	for <lists+linux-omap@lfdr.de>; Fri,  7 Feb 2020 15:53:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726867AbgBGOxL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 7 Feb 2020 09:53:11 -0500
Received: from a80-127-99-228.adsl.xs4all.nl ([80.127.99.228]:32796 "EHLO
        hetgrotebos.org" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726674AbgBGOxL (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 7 Feb 2020 09:53:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wizzup.org;
         s=mail; h=Content-Type:MIME-Version:Date:Message-ID:Subject:From:Cc:To:
        Sender:Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=E1MzXgtOCOEst+gLmKoeEJzsH5ZrzeEaBLMAX8gPCgc=; b=FUsjkFGhkmuqzyHka+V/BNvUyC
        E5JwpXu2M/k1NLDT4GZUA/P+mLWoxnIbq3kssRvdfiYgnRg74hx2mzUg8Fas7xaUNvAv+ya68I0qD
        QgdIfw9979XS/H6zKwYesZMkGbfTFUhVt3V49Dp6rBbAcy9vM8/vsJAorMd/SfjSrl4YCsZSnZUWt
        7B/it2wMObCOvq3Kf9yQN7bpmLgWy8vSIjcBjbZq86GzWFpcfywjA0Y2XajvviK/Qd7FZiL4+I7d6
        ubHFDGsIpp2PD/zGTrC0H8gaOOHnCmg2zprGgpiRn+Vk/SUtpt0a2F6faLm6kWeNusWasxELfs3k8
        njlpVJlQ==;
Received: from deepwater.fritz.box ([192.168.178.25] helo=[0.0.0.0])
        by hetgrotebos.org with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <merlijn@wizzup.org>)
        id 1j050E-0007UP-Ur; Fri, 07 Feb 2020 14:53:07 +0000
To:     linux-omap <linux-omap@vger.kernel.org>
Cc:     Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        "Arthur D." <spinal.by@gmail.com>, Tony Lindgren <tony@atomide.com>
From:   Merlijn Wajer <merlijn@wizzup.org>
Subject: Nokia N900 on 5.4 and 5.5
Autocrypt: addr=merlijn@wizzup.org; prefer-encrypt=mutual; keydata=
 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
 /XslHw==
Message-ID: <79b91017-b52a-8aff-4b9c-913ae655f7bf@wizzup.org>
Date:   Fri, 7 Feb 2020 15:54:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="lBuyN4AWvJL8LwRL2KCIwlOtHXHmt034X"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--lBuyN4AWvJL8LwRL2KCIwlOtHXHmt034X
Content-Type: multipart/mixed; boundary="m8BCXAro0qvsecVFpTRxgrKKj0TRLcljU"

--m8BCXAro0qvsecVFpTRxgrKKj0TRLcljU
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

Hi,

I've tried to build 5.4.18 and 5.5.2 for the Nokia N900, using
omap2plus_defconfig. Using appended DTB, like so:

$ cat arch/arm/boot/zImage arch/arm/boot/dts/omap3-n900.dtb > zImage.dtb
$ mkimage -A arm -O linux -T kernel -C none -a 80008000 -e 80008000 -n
zImage -d zImage.dtb uImage

But they both fail to boot for me - the device resets almost instantly:

> data abort
>=20
>     MAYBE you should read doc/README.arm-unaligned-accesses
>=20
> pc : [<8000c878>]          lr : [<80008160>]
> sp : 803c46c8  ip : 003a1870     fp : 003a1848
> r10: 803ba890  r9 : 00caa42c     r8 : 80000100
> r7 : 000007a3  r6 : 803a9878     r5 : 80000100  r4 : 80008000
> r3 : 00004e6c  r2 : 00019fa8     r1 : 803a9878  r0 : 00000000
> Flags: nZcv  IRQs off  FIQs on  Mode SVC_32
> Resetting CPU ...
>=20
> resetting ...

Full log below. I tried the same with "-Os" instead of "-O2" ; to no avai=
l.

Any clue what could be up?

Cheers,
Merlijn

[1]
> NOLO X-Loader (v1.4.14, Jun  3 2010)
> Secondary image size 109384
> Booting secondary
> [   0.002] Nokia OMAP Loader v1.4.14 (Jun  3 2010) running on Nokia N90=
0 F5 (RX-51)
> [   0.014] I2C v3.12
> [   0.033] System DMA v4.0
> [   0.036] OneNAND device ID 0040, version ID 0121 (256 MiB, 66 MHz)
> [   0.071]   OneNAND blocks unlocked in 28040 us
> [   0.075]   Flash id: ec4021
> [   0.094] Partition table successfully read
> [   0.102] TWL4030 PWR ISR: 40
> [   0.105] Reset reason: por
> [   0.108] McSPI v2.1
> [   0.111] LP5523 found at I2C bus 2, address 0x32
> [   0.122] SMB138C: Not loading driver (version reg. 0x4b)
> [   0.128] BQ24150 (rev. 3) found on I2C bus 1, address 0x6b
> [   0.134] SSI version 1.0
> [   0.148] Battery voltage 3.780 V, BSI: 971
> [   0.164] Initializing LCD panel
> [   0.167]   Detecting LCD panel moscow
> [   0.171]     Panel ID: 108d77
> [   0.174]   Detected LCD panel: acx565akm
> [   0.178] DISPC: version 3.0
> [   0.183]   LCD pixel clock 24000 kHz
> [   0.214]   Logo drawn in 5 ms (11700 kB/s)
> [   0.345]   =EF=BF=BDber-cool backlight fade-in took 9 ms
> [   0.352] Initializing USB
> [   0.360]   No USB host detected
> [   0.363] Loading kernel image info
> Loading kernel (1961 kB)... done in 71 ms (27535 kB/s)
> [   0.443] Loading initfs image info
> [   0.447] Total bootup time 450 ms
> [   0.451] Serial console disabled
>=20
>=20
> U-Boot 2013.04 (Apr 20 2013 - 11:00:56)
>=20
> OMAP3530-HS ES3.1, CPU-OPP2, L3-165MHz, Max CPU Clock 600 MHz
> Nokia RX-51 + LPDDR/OneNAND
> I2C:   ready
> DRAM:  256 MiB
> MMC:   OMAP SD/MMC: 0, OMAP SD/MMC: 1
> Using default environment
>=20
> In:    vga
> Out:   vga
> Err:   vga
> data abort
>=20
>     MAYBE you should read doc/README.arm-unaligned-accesses
>=20
> pc : [<8000c878>]          lr : [<80008160>]
> sp : 803c46c8  ip : 003a1870     fp : 003a1848
> r10: 803ba890  r9 : 00caa42c     r8 : 80000100
> r7 : 000007a3  r6 : 803a9878     r5 : 80000100  r4 : 80008000
> r3 : 00004e6c  r2 : 00019fa8     r1 : 803a9878  r0 : 00000000
> Flags: nZcv  IRQs off  FIQs on  Mode SVC_32
> Resetting CPU ...
>=20
> resetting ...


--m8BCXAro0qvsecVFpTRxgrKKj0TRLcljU--

--lBuyN4AWvJL8LwRL2KCIwlOtHXHmt034X
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYIAB0WIQRM5LT7NbLF9yb6a/UGN09rynK8WgUCXj16FgAKCRAGN09rynK8
WkwCAQD5KnlpBt8UjjsjguGrW5Dk0T0K2u/PjEiyFtjAl19wzwEA3PgR0o98lSYI
U3qyE8YX6rlqOLvYvCJ9K2p1ZMwhyg8=
=IxhY
-----END PGP SIGNATURE-----

--lBuyN4AWvJL8LwRL2KCIwlOtHXHmt034X--
