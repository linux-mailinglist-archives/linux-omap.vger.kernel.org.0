Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9125F2A85D8
	for <lists+linux-omap@lfdr.de>; Thu,  5 Nov 2020 19:14:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731780AbgKESOl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 5 Nov 2020 13:14:41 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.54]:23997 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732073AbgKESO3 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 5 Nov 2020 13:14:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1604600067;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=L9xvSRO4jZG01PGBZOFAM7iZqNe/T5oryMn7TOV1cNM=;
        b=O8Y2/lepzH6ps/S5HuFjxXVjI2G3FMOmbCxeqjuVGsQIB/WSXb4ehBv8xz1OZLynI5
        iHkLDr3bzTUoSAHtx5calrxoS1VkpDn51UGOX/j+h0BuLMUFz3LqfUa+jl0Kl/jvGYpF
        bMWnkFj626AZ8FGU2fZi0Ia61xzcu32rwhhSAS4nbXVBUegz6TAB8Ad5y+3Xk5R581oT
        L8cEMSKfQefZuXBYFd81OcodjsaXWUIrOB7IzbF52L6lO172wJ7eSN+neGeDBO4x5DA+
        QwF9M13s1HEmkhcU07kqvhI6FqMnUgqwvt4o4o074uCI1L1Zpa+NTB7hjXKHjNol6aBA
        4A9w==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDlSfXA0MwM0="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 47.3.2 DYNA|AUTH)
        with ESMTPSA id L07f74wA5IEG0hD
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Thu, 5 Nov 2020 19:14:16 +0100 (CET)
Subject: Re: [PATCH v3 00/56] Convert DSI code to use drm_mipi_dsi and drm_panel
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <fcbc8488-5861-8e51-0f86-1ed6498083f7@ti.com>
Date:   Thu, 5 Nov 2020 19:14:15 +0100
Cc:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <579243AA-014A-411B-9014-F5846C9B8137@goldelico.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com> <61C04176-4654-4D2D-A55B-31FBB6D2E5AA@goldelico.com> <fcbc8488-5861-8e51-0f86-1ed6498083f7@ti.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
X-Mailer: Apple Mail (2.3124)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


> Am 05.11.2020 um 18:36 schrieb Tomi Valkeinen <tomi.valkeinen@ti.com>:
>=20
> Hi,
>=20
> On 05/11/2020 19:15, H. Nikolaus Schaller wrote:
>=20
>> Next, I migrated my long waiting mipi_dsi/drm_panel driver conversion =
for
>> the panel of the Pyra handheld (omap 5 based) to compile on 5.10-rc2. =
And
>> I followed the latest existing panel-orisetech-otm8009a.c which uses =
a
>> similar video mode controller and mipi-dsi.
>>=20
>> That one seems to be used by arch/arm/boot/dts/stm32f469-disco.dts.
>>=20
>> Unfortunately my panel driver is not even loaded by drm/omap so I =
can't
>> debug. Does this set of drm/omap drivers need a modification of the =
device
>> tree? If yes, which one?
>=20
> omapdrm doesn't load the panel drivers. If not even your panel's probe =
is called, then it hints at
> DT and/or driver's compatible string issue. The panel's probe should =
get called even if omapdrm is
> not loaded at all.

Well, I use the same device tree that loads the old driver...

>=20
> Can you push your branch somewhere, so I can have a quick look?

Yes, that would be nice!
Here:

=
https://git.goldelico.com/?p=3Dletux-kernel.git;a=3Dshortlog;h=3Drefs/head=
s/letux-pyra-dsi-5.10-rc2

or:

https://github.com/goldelico/letux-kernel/tree/letux-pyra-dsi-5.10-rc2

(full config is not included).

BR and thanks,
Nikolaus

