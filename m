Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B5EB11F3C1
	for <lists+linux-omap@lfdr.de>; Sat, 14 Dec 2019 21:03:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726792AbfLNUDX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 14 Dec 2019 15:03:23 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.52]:20201 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726541AbfLNUDX (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 14 Dec 2019 15:03:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1576353800;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=DPuTsZ3nF0GQ/mkxy1iKe+y0Pe4EavbpO5IBrMhpzbw=;
        b=o4Z1hIPI6cdkbpLoS9Gye3EGdcSDvu9Gs9+4oQTNJB6XnJbrDjcqD6Os8eH8rEaL5y
        BYaC7/vhmCrrL50ggV/XGeb7anYMYblEy7tTW3xbRNrBa/uSfWKaHaTHDbG/l3QLlV9Y
        CG/h0ESCszTQzyseH8PFUlIX3VAkTCOR8TueyRHul7QvJsrQeo38+dKO++KcPCbyVPCr
        wzS5OoAMD1YsgLtSxmZQYdHACr1tzuKCVwDMgLgDOt4xpickYeZ5byxq/R9FjsAXQg5l
        rHv54DLUBax4mDZ5/QyaCNdrXZLIppPSmM9gAky0fuqgP7ddlmNnYLZnScpi5x06xyi/
        hI3g==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGHPruwDCvIHw="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.0.7 DYNA|AUTH)
        with ESMTPSA id i03ca8vBEK2vCBh
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Sat, 14 Dec 2019 21:02:57 +0100 (CET)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: BUG - was: [GIT PULL 2/3] bcm2835-soc-next-2019-10-15
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <f6f38340-2555-7907-6b89-748c34cd2978@gmx.net>
Date:   Sat, 14 Dec 2019 21:02:56 +0100
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-rpi-kernel@lists.infradead.org,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, Tony Lindgren <tony@atomide.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Russell King <linux@armlinux.org.uk>
Content-Transfer-Encoding: quoted-printable
Message-Id: <A0CE3E97-00E3-401F-AB89-153700B4D93F@goldelico.com>
References: <1571159725-5090-1-git-send-email-wahrenst@gmx.net> <1571159725-5090-2-git-send-email-wahrenst@gmx.net> <12244E4E-A1A0-4EE9-ACD3-EA165D9A2C79@goldelico.com> <f6f38340-2555-7907-6b89-748c34cd2978@gmx.net>
To:     Stefan Wahren <wahrenst@gmx.net>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi all,
I think I have found the issue, it is not ZONE_DMA, see below.

> Am 14.12.2019 um 17:54 schrieb Stefan Wahren <wahrenst@gmx.net>:
>=20
> Hi Nikolaus,
>=20
> [add Nicolas as the new BCM2835 maintainer]
>=20
> Am 14.12.19 um 11:54 schrieb H. Nikolaus Schaller:
>> Hi Stefan,
>>=20
>>> Am 15.10.2019 um 19:15 schrieb Stefan Wahren <wahrenst@gmx.net>:
>>>=20
>>> Hi Florian,
>>>=20
>>> The following changes since commit =
54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:
>>>=20
>>> Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)
>>>=20
>>> are available in the git repository at:
>>>=20
>>> git://github.com/anholt/linux tags/bcm2835-soc-next-2019-10-15
>>>=20
>>> for you to fetch changes up to =
781fa0a954240c8487683ddf837fb2c4ede8e7ca:
>>>=20
>>> ARM: bcm: Add support for BCM2711 SoC (2019-10-10 19:21:03 +0200)
>> this patch has finally arrived in v5.5-rc1 but it seems to break
>> multiplatform build.
>>=20
>> We run a distribution kernel that supports OMAP3/4/5, i.MX6 and RasPi =
3B+
>> but since rebasing to v5.5-rc1 the kernel hangs after "Starting =
Kernel ...".
>> On all ARM devices (incl. RasPi 3B+).
>=20
> i wasn't able to reproduce this issue with the RPi 3B+ so far and i
> don't have any OMAP hardware:
>=20
> Linux 5.3 (bcm2835_defconfig) + FW 2019-02-12 =3D> okay
> Linux 5.3 (bcm2835_defconfig + ZONE_DMA) + FW 2019-02-12 =3D> okay
> Linux 5.5-rc1 (bcm2835_defconfig) + FW 2019-02-12 =3D> okay
> Linux 5.5-rc1 (multi_v7_defconfig) + FW 2019-02-12 =3D> okay
>=20
> So please provide more information about your RPi 3B+ setup:
>=20
> - VC firmware version
> - additional bootloader (U-Boot)
> - boot source (SD card, USB, network)
> - kernel config
>=20
> Did you tested the mainline kernel or the letux kernel?

On the OMAP I did test the mainline kernel with omap2plus_defconfig.
RasPi 3B+ experiment was with Letux kernel and config.


But I was lucky to find the issue by code inspection:

bcm2711_compat[] is missing a NULL sentinel.

Therefore, enabling CONFIG_ARCH_BCM2835 is sufficient to trigger the
problem unless you may have been lucky getting something starting with
a NULL packed after it on your bcm2835_defconfig or multi_v7_defconfig
build.

Patch submitted.

BR,
Nikolaus

