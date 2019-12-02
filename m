Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA05E10F2B9
	for <lists+linux-omap@lfdr.de>; Mon,  2 Dec 2019 23:15:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725903AbfLBWPb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 2 Dec 2019 17:15:31 -0500
Received: from mail.andi.de1.cc ([85.214.55.253]:51822 "EHLO mail.andi.de1.cc"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725825AbfLBWPb (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 2 Dec 2019 17:15:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=87DJGgaOP4OR26er35jT2d/3xlEOtUkjxl/DEu2Hv4A=; b=hJ2jxg0GQjdVMV90G3GTon9LzP
        71+pbAIhRDz3VxHs5UvWw2oSaW56+b3e9zgmTUTcandElA+kNrbzsnGSsp9BNhIcjj/b9y0gS2U5y
        86W+CopAbhsHmyZresdzs0aZ4nRuxZyZc6L6WiVP30w3R1dqcc6NTv1USIjxt/xdoCN8=;
Received: from p200300ccff066f001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff06:6f00:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1ibtyV-0008V1-Oz; Mon, 02 Dec 2019 23:15:24 +0100
Date:   Mon, 2 Dec 2019 23:15:22 +0100
From:   Andreas Kemnade <andreas@kemnade.info>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        Adam Ford <aford173@gmail.com>,
        =?UTF-8?B?QW5kcsOp?= Roth <neolynx@gmail.com>,
        Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Subject: Re: [PATCH] ARM: OMAP2+: Fix warnings with broken
 omap2_set_init_voltage()
Message-ID: <20191202231522.5e7fe3f8@aktux>
In-Reply-To: <8FFD44DB-73F8-4807-91E1-C97DA8F781BA@goldelico.com>
References: <20190924233222.52757-1-tony@atomide.com>
        <8FFD44DB-73F8-4807-91E1-C97DA8F781BA@goldelico.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Score: -1.0 (-)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, 2 Dec 2019 22:09:26 +0100
"H. Nikolaus Schaller" <hns@goldelico.com> wrote:

> Hi Tony,
>=20
> > Am 25.09.2019 um 01:32 schrieb Tony Lindgren <tony@atomide.com>:
> >=20
> > This code is currently unable to find the dts opp tables as ti-cpufreq
> > needs to set them up first based on speed binning.
> >=20
> > We stopped initializing the opp tables with platform code years ago for
> > device tree based booting with commit 92d51856d740 ("ARM: OMAP3+: do not
> > register non-dt OPP tables for device tree boot"), and all of mach-omap2
> > is now booting using device tree.
> >=20
> > We currently get the following errors on init:
> >=20
> > omap2_set_init_voltage: unable to find boot up OPP for vdd_mpu
> > omap2_set_init_voltage: unable to set vdd_mpu
> > omap2_set_init_voltage: unable to find boot up OPP for vdd_core
> > omap2_set_init_voltage: unable to set vdd_core
> > omap2_set_init_voltage: unable to find boot up OPP for vdd_iva
> > omap2_set_init_voltage: unable to set vdd_iva
> >=20
> > Let's just drop the unused code. Nowadays ti-cpufreq should be used to
> > to initialize things properly.
> >=20
> > Cc: Adam Ford <aford173@gmail.com>
> > Cc: Andr=C3=A9 Roth <neolynx@gmail.com>
> > Cc: "H. Nikolaus Schaller" <hns@goldelico.com>
> > Cc: Nishanth Menon <nm@ti.com>
> > Cc: Tero Kristo <t-kristo@ti.com>
> > Signed-off-by: Tony Lindgren <tony@atomide.com>
> > ---
> >=20
> > Guys, please check and ack if we can really do this to get rid of some
> > pointless dmesg -l3 errors without affecting the ongoing cpufreq and
> > voltage work. =20
>=20
> unfortunately we did not yet test in combination with the 1GHz OPP
> patches for omap3630 (queued for v5.5-rc1) and it appears that this
> patch breaks the 1GHz OPP.
>=20
> The symptom is that it works fine on a dm3730 with 800MHz rating
> but results in spurious kernel panics, stack corruption, virtual memory
> failures, OneNAND DMA timeouts etc. on a dm3730 with 1GHz speed grade.
>=20
I #if 0'ed the 1Ghz opp and found out that the OneNAND DMA timeouts
are independant of 1Ghz. But the result is interesting:
With this patch
xxd /dev/mtd0 shows only ff
without this patch gives content, it is slower.
In both cases I see
[  476.533477] omap2-onenand 4000000.onenand: timeout waiting for DMA

Regards,
Andreas
