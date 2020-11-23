Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5815B2C1617
	for <lists+linux-omap@lfdr.de>; Mon, 23 Nov 2020 21:29:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732517AbgKWULG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 23 Nov 2020 15:11:06 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.166]:30610 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729368AbgKWULE (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 23 Nov 2020 15:11:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1606162262;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=cx2yIDTyrXo1mrqkqXfre/m7K3ewqY1HrgngL9gXu+g=;
        b=pQaUb7QkqJuBFv7rR8TIHXu0eoXKh/nMea+VE+iieBdwgshabqORpr7LkG4DuekKGg
        AWRLGMKJVmrARa/fPu0fwHhsLopzgn9IvD0EprTnjdXxjVYDMppgfAW9dL4B+r99yK0d
        p88Bll/n/lN4PdubQhPk+pUuhpdpyxy8ZfHRJSLGR7fVj8ahYi2KdOREts9ClGGo48vT
        747rHJrwG5w/ZwBy4hMxxdt7h7BGaFvKu8gfq5YzFgJ9rT0Czb0BeZbqMiTOgnnAEJSQ
        g9/mM0/FvHlAIvj1BLrGif0i4KR9cwfNoNGdWHRP8JpmVyptCV2tVluCmzkwPc/NFwlp
        RMYA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDVCVXA4Ejh4="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 47.3.4 DYNA|AUTH)
        with ESMTPSA id N02faawANKAayZE
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Mon, 23 Nov 2020 21:10:36 +0100 (CET)
Subject: Re: Understanding OMAP5 DPLL_ABE and CM_CLKSEL_WKUPAON
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200728084257.GF2811@atomide.com>
Date:   Mon, 23 Nov 2020 21:10:35 +0100
Cc:     David Shah <dave@ds0.me>, Linux-OMAP <linux-omap@vger.kernel.org>,
        Tero Kristo <t-kristo@ti.com>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com,
        Andreas Kemnade <andreas@kemnade.info>
Content-Transfer-Encoding: quoted-printable
Message-Id: <B66CD988-7339-44C2-B750-9FA2088D86FA@goldelico.com>
References: <c077ece056713ad120b3d2fd59916aab1248cd1c.camel@ds0.me> <20200727082833.GB2811@atomide.com> <ac19052a552660c86838709f071cffe0f3e65932.camel@ds0.me> <20200728084257.GF2811@atomide.com>
To:     Tony Lindgren <tony@atomide.com>
X-Mailer: Apple Mail (2.3124)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi David and Tony,

> Am 28.07.2020 um 10:42 schrieb Tony Lindgren <tony@atomide.com>:
>=20
> * David Shah <dave@ds0.me> [200727 08:58]:
>> On Mon, 2020-07-27 at 01:28 -0700, Tony Lindgren wrote:
>>> If it only needs to be configured to 1 for reboot, sounds like it
>>> should
>>> be set in omap44xx_restart(). And we should also set it to 1 for
>>> omap4
>>> too.
>>=20
>> omap44xx_restart doesn't seem like the right place to me, as the bug
>> also affects hard resets (i.e. NRESWARM assertion) and it would be =
nice
>> to have these working, too.
>=20
> Ah right, the device reboots fine, but the rebooted kernel
> won't initialize properly.
>=20
>> Would a better solution be to set it early during startup (the first
>> part of clock init), and then clear it when the DPLLs are set up and
>> locked?
>=20
> Yes sounds like then the place to configure this is in the
> drivers/clk/ti/clk-54xx.c omap5xxx_dt_clk_init(). Maybe add
> a comment to the patch description that a similar patch may
> be also needed for omap4 on some devices.

It seems as if the conclusion was that the patch is at the right
location omap5xxx_dt_clk_init(). Has it been merged somewhere?

It seems as if we still need it in our 5.10-rc series:

=
https://git.goldelico.com/?p=3Dletux-kernel.git;a=3Dcommit;h=3Daa8eda144e8=
faa185e154710ca0eef12adb2d29d

BR and thanks,
Nikolaus

