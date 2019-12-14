Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4846711F2E0
	for <lists+linux-omap@lfdr.de>; Sat, 14 Dec 2019 17:54:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726636AbfLNQyy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 14 Dec 2019 11:54:54 -0500
Received: from mout.gmx.net ([212.227.17.21]:34757 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726333AbfLNQyy (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sat, 14 Dec 2019 11:54:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1576342475;
        bh=+BbVCIHuNmxom49QgIOa+rVhYJNXL05jIfaUgchsleA=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=VmgSSuFHso6sSPe4dL2Mrpy3+5pVvrn50Sn4palz5AuuOf2wv6/ITivaMBffJ4kap
         jMBIEwsB3TlD/tbecm54YNYHsbGLAvlGbxhxj/hsL1AZrpEtgicjGVYu0CSsqapeoc
         DfMgcOWquAXtxcoVSkc0k0fb5L3oMCBRbVNcISXM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.1.176] ([37.4.249.154]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MEm27-1iVTBh3EPD-00GMNY; Sat, 14
 Dec 2019 17:54:34 +0100
Subject: Re: BUG - was: [GIT PULL 2/3] bcm2835-soc-next-2019-10-15
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-rpi-kernel@lists.infradead.org,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, Tony Lindgren <tony@atomide.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
References: <1571159725-5090-1-git-send-email-wahrenst@gmx.net>
 <1571159725-5090-2-git-send-email-wahrenst@gmx.net>
 <12244E4E-A1A0-4EE9-ACD3-EA165D9A2C79@goldelico.com>
From:   Stefan Wahren <wahrenst@gmx.net>
Message-ID: <f6f38340-2555-7907-6b89-748c34cd2978@gmx.net>
Date:   Sat, 14 Dec 2019 17:54:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <12244E4E-A1A0-4EE9-ACD3-EA165D9A2C79@goldelico.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Provags-ID: V03:K1:ELFNI87v57TSREqtXP96vdgImKzkkUHbI3qOsvnsOa/ruWSt74b
 i3rbtP0n/I1A1A6c5KebrDoY5ezip6rimI8jNOnmroTBHPhM1nprkvAIBeFGIhJsLeAGm1X
 S/geNjiXjtNFyhU0kFK+43LQ/jrPxKdXtOUfuv2lKmK87n0TcmYzqe9ekafdHaZerwFDKur
 Omzf9vF/uSNesLYbkpAcA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:UNbQGgv5KWo=:paK+qqmVLcAsfK4nh6VZO0
 8Suk8svgYYGTWkrUvzlY67n3dtDx/blwhgLOK1dsUBRMsjV9Odbj88HMkfXfSEuv4c7DTC6Cv
 QJdSmkzM6zGDDYEJeA9vc6ociK8vnobicFTHxYfLJHZYnEAZBXp/t2jwmSUljDQ0M4pWk3PR5
 09onjuoPEvS89CqontZNOiLb42lRJzYM7M1xAwyygIqePbv/HY/QteCZ6jnO0mh/OMIPmj/uq
 YAMYwYsLDuv8iqVM8UY6vJsFaloQOF9LztiOnAcrhAORf7ukE0w5A/QHiIWHfFV4VT30nr+S1
 sNDfqsNziqIu8ng3WcUodW5j+L5HyUMtXZqfc0ElpC3ltiMNMrrDMcmhT9swK2tnU8doa/qQA
 /Kbafv/Bhe5/FSvQNEabGw3Fo2GWp6y1YUiQOlDVHyScwXOHCp7pPO8BrT1+YSovQ4i3msNTC
 dmEgbMe0DPdaYEadIRrhdYGTcDtd1sBYcc2UUY8FFmRr4uv8keqF0u58Rk2DX7eTYD2ElP4nb
 t3BQc/7rzK9DuPx+A9Ys4r/FQ2f5Iy9Vy5WsHCyTbTZ5vn/S6pX7iUQoxfbL8KHGQwcI6q47E
 zkDZyncaf5dTunui5SNjutSSdbmfMs5UIJjyokftX23qr7GJAADpPGOIz7lqbJplN6SvkvTFb
 tl0pvwVOKsHQU1BB8XGrkia6iL5PUz6fPACUfs2p7gkNUWHPDd78a6+IcPfuRVsrtGWKLknEq
 tIH4hwpGX5mAsPciQ0Np4KGrYfgE+/CY7vGpZb8OKmxwivCsjXp7K6w7HzHHG7fOkgoS4e7ye
 8lhUN4bJ6X0AknBZbiTst2Kb/TMaiYd8LGy9ZCSli/EDCnHTRC2/UFUikGjGcfScqxLwYLvup
 79VOcypVfo9q3FvvbhRBIfJdoFvXA3hvKLsbPfl4A8XO8xLKMLqTYDDIbCzRvsH4FSWxBjagm
 TtSkNSyPH2yEJMhMil+cBFUM1GQwbYdf2KHlIoRoc2IZazN0l6LzpI9V9cDOzsgNZ+Ep8oACr
 1O4K4SeKqAmzq1ykgAJMU4mkz7/jJIGnDDitNqfc3iwjxmatONfnPexO/AaILszW4GHsYuEDx
 3Ch02WHDRbWq2yOtxc/rI9EDBucPmATx2nKARHdzt1Mtk1BfNnE4cMkMolRiJ15mjl/X6t5p2
 EOp6U4068ajxNAHirzqBtpaKRnrg6QQV9+lRt0yNxlVBkgQv/WEeeIB3Qg8Nv2fytg0R3pd+7
 v2cdmaRPI09hGYnPalXy4KvlWb/GPVvN6fgH5Uq5Ds2bt52DbXJOL0ddrJeU=
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Nikolaus,

[add Nicolas as the new BCM2835 maintainer]

Am 14.12.19 um 11:54 schrieb H. Nikolaus Schaller:
> Hi Stefan,
>
>> Am 15.10.2019 um 19:15 schrieb Stefan Wahren <wahrenst@gmx.net>:
>>
>> Hi Florian,
>>
>> The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:
>>
>>  Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)
>>
>> are available in the git repository at:
>>
>>  git://github.com/anholt/linux tags/bcm2835-soc-next-2019-10-15
>>
>> for you to fetch changes up to 781fa0a954240c8487683ddf837fb2c4ede8e7ca:
>>
>>  ARM: bcm: Add support for BCM2711 SoC (2019-10-10 19:21:03 +0200)
> this patch has finally arrived in v5.5-rc1 but it seems to break
> multiplatform build.
>
> We run a distribution kernel that supports OMAP3/4/5, i.MX6 and RasPi 3B+
> but since rebasing to v5.5-rc1 the kernel hangs after "Starting Kernel ...".
> On all ARM devices (incl. RasPi 3B+).

i wasn't able to reproduce this issue with the RPi 3B+ so far and i
don't have any OMAP hardware:

Linux 5.3 (bcm2835_defconfig) + FW 2019-02-12 => okay
Linux 5.3 (bcm2835_defconfig + ZONE_DMA) + FW 2019-02-12 => okay
Linux 5.5-rc1 (bcm2835_defconfig) + FW 2019-02-12 => okay
Linux 5.5-rc1 (multi_v7_defconfig) + FW 2019-02-12 => okay

So please provide more information about your RPi 3B+ setup:

- VC firmware version
- additional bootloader (U-Boot)
- boot source (SD card, USB, network)
- kernel config

Did you tested the mainline kernel or the letux kernel?

Best regards
Stefan
