Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96E402AD803
	for <lists+linux-omap@lfdr.de>; Tue, 10 Nov 2020 14:49:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730044AbgKJNtq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Nov 2020 08:49:46 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.164]:12177 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729898AbgKJNtq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 10 Nov 2020 08:49:46 -0500
X-Greylist: delayed 101949 seconds by postgrey-1.27 at vger.kernel.org; Tue, 10 Nov 2020 08:49:45 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1605016184;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=h/cvCoRx6ABjRnuNnggq6iBygV6wWKaNDHvZMbMP6NU=;
        b=o/lWQGJFOHmHvmDWKM2n7lmJ/qjKpmEOpIfGesMs5uBNCjc+ZYOVFGCk05H/2cM4Vu
        LcS8tuitf/je3COb42esg8Rh+DqdGPFlJ17Nj9NwpmzANDh/oZ+EYiBb0FwCNT1WL46N
        OKVFv0hFfacMO/CpAt/C8yGppcdY05LQ3EMvZF0UOVqi8ZfGULOLOcN/4zgI7Mph2yCj
        kIJFodYvGdYeNTSEO2ldeFd0a7vw7MYiM6m1s9LQM8idlZIuEMXBPl4VM+pUWQ73p3sb
        cYT3uHXC2VSh0sB9ds7Rl/6nhYwuwUwjazAWL6NOvbuoJAvc0lGC+lebwgkeM37/tMHy
        OvMw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDVCUXAYLEg=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 47.3.4 DYNA|AUTH)
        with ESMTPSA id N02faawAADnQ15y
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Tue, 10 Nov 2020 14:49:26 +0100 (CET)
Subject: Re: [PATCH v3 00/56] Convert DSI code to use drm_mipi_dsi and drm_panel
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <7f820fd2-820b-bfdd-a43b-174ad6b09868@ti.com>
Date:   Tue, 10 Nov 2020 14:49:25 +0100
Cc:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <0AF59BFD-89F2-46D3-9EB6-F47FBB52B183@goldelico.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com> <61C04176-4654-4D2D-A55B-31FBB6D2E5AA@goldelico.com> <fcbc8488-5861-8e51-0f86-1ed6498083f7@ti.com> <579243AA-014A-411B-9014-F5846C9B8137@goldelico.com> <ab33baff-dd8c-2ee0-6f89-35aa4df7b9cf@ti.com> <837EA533-9946-43B3-B058-69060EC43981@goldelico.com> <08589e51-f5e6-2743-57ec-8ac509f97ff0@ti.com> <1f1afce4-c822-0fbf-1ce3-dda0064b65c6@ti.com> <67786545-23D2-444F-85B8-7A030070B317@goldelico.com> <a20f2b88-bfe6-0ab4-a19b-ba5316db6c4f@ti.com> <17F5238B-1CC3-4764-B744-C57D9CE4EB42@goldelico.com> <db0b9694-4d04-18ba-fdf0-093b5914bbf0@ti.com> <6A9407FC-69F7-4E30-B4A3-FFB2E91CAE3B@goldelico.com> <1cf563e5-2dc0-1802-86e3-3e24150f0651@ti.com> <BBC7824A-A689-4144-969C-32608A202A75@goldelico.com> <7f820fd2-820b-bfdd-a43b-174ad6b09868@ti.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
X-Mailer: Apple Mail (2.3124)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tomi,

> Am 09.11.2020 um 12:33 schrieb Tomi Valkeinen <tomi.valkeinen@ti.com>:
>=20
> On 09/11/2020 13:09, H. Nikolaus Schaller wrote:
>=20
>>>> I see.
>>>> Anyways there is missing some simple thing which makes the driver =
not prepared/enabled.
>>>> Or is this related to VC?
>>>=20
>>> No, that's not related to the VC.
>>=20
>> Ok, then it is worth searching for that independently. Any idea/hint =
what could be missing?
>=20
> Well, if I had to guess, I would go for either 1) some registration or =
such is missing from the
> panel driver, or 2) some config value is invalid, which makes the DRM =
framework or the DSI driver
> fail before calling prepare or enable.

I did now some tests based on v5.10-rc3 by adding mre and more printk() =
and dump_stack().
And I did blacklist the panel driver so that I could boot and after =
modprobing it manually
I could trigger a re-probe by inserting some USB memory stick.

With this procedure I could trace the problem down to this call =
sequence:

	dsi_probe()
          ...
	  w677l_probe()
            drm_panel_add()   -- after this, of_drm_find_panel() is =
successful
          ...
	  component_add()
	    try_to_bring_up_master()
 	      master->ops->bind(master->dev)

This call to bind() does not return and likely the probing thread is =
then blocked and
holds some locks which manifests itself in that the system isn't running =
stable any
more (e.g. heartbeat LEDs are sometimes stuck although console still =
works).

dbg_info() in try_to_bring_up_master() prints:

[  102.199362] omapdss_dss 58000000.dss: trying to bring up master

So I am not sure if this is a panel driver issue at all or the DSI patch =
set is not
running stable on OMAP5.

Is a good next step to trace dss_bind() in =
drivers/gpu/drm/omapdrm//dss/dss.c?

BR,
Nikolaus

