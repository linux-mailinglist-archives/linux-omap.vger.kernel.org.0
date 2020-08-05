Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6642023D0FA
	for <lists+linux-omap@lfdr.de>; Wed,  5 Aug 2020 21:55:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729588AbgHETyx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 5 Aug 2020 15:54:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728072AbgHEQsi (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 5 Aug 2020 12:48:38 -0400
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5302::5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65B1DC03460E
        for <linux-omap@vger.kernel.org>; Wed,  5 Aug 2020 05:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1596628862;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=HKIqLRmSQ+p9mZrCWiA9BeJJodIRQ8eG+wM7N37ouac=;
        b=Pz4A6hK4U28Bz2ClklvfZEblinoUxy2QwcQPqJjeLTICZYsJFry5ZJVsgnZEHG4ETJ
        teu7sTgDNjjeb7XtrgTJxH/LpnZhbDo1cfzW41s5qhnAZwkkn79u4wE0aB7HXEc8giiI
        ebQypm7gky7yBWWbTvePE7zQLBJeVcrrSIGLW79MXAOoiWw2tdwPcy7U9SR6vrLI24Nm
        zCHv2NGLM8/cciTgN52Vlh4XKQYwPDN51mvysMSIM5HLgvqndQ9aZhAEEL5D98BzE2q4
        aSRBToz2KjGlfZfDE/UE0W74IxTPxHLe6sJEaniHKtM4stI6hWzm6diqMtfFUPo0IfJK
        Dw/w==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBp5hRy/t23tTZSrJjFjnMxHeR4GcVReHGtOgKna+z0IjvQ4fmvWQ=="
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2003:d5:8700:1900:25a9:5bd5:20ae:409a]
        by smtp.strato.de (RZmta 46.10.5 AUTH)
        with ESMTPSA id V07054w75C0lbku
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Wed, 5 Aug 2020 14:00:47 +0200 (CEST)
Subject: Re: module_mipi_dsi_driver panel with omapdrm?
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <E1k3Hyu-0000Ac-BU@ds0.me>
Date:   Wed, 5 Aug 2020 14:00:46 +0200
Cc:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tony Lindgren <tony@atomide.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Jyri Sarha <jsarha@ti.com>, kernel@pyra-handheld.com,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <7634E586-CCCC-4DF6-9F43-F3FD11B707BA@goldelico.com>
References: <E1k3Hyu-0000Ac-BU@ds0.me>
To:     David Shah <dave@ds0.me>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi David,
good to know! Would mean that the combination of HDMI and DSI may make =
trouble.

Maybe we should simply wait ca. 14 days until I have access to my own =
test setup and can run such tests easily and within minutes myself.
Since it is already broken since v5.7-rc1 it should be possible to wait =
that time :)

Best regards,
Nikolaus


> Am 05.08.2020 um 13:53 schrieb David Shah <dave@ds0.me>:
>=20
> If it helps, I can confirm that HDMI was working fine on the uEVM the =
last time I test 5.7 (I think it was the final rc before release).
>=20
> David
>=20
> -------- Original message --------
> From: "H. Nikolaus Schaller" <hns@goldelico.com>
> Date: 05/08/2020 12:49 (GMT+00:00)
> To: Sebastian Reichel <sebastian.reichel@collabora.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Tony =
Lindgren <tony@atomide.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, =
Linux-OMAP <linux-omap@vger.kernel.org>, Jyri Sarha <jsarha@ti.com>, =
kernel@pyra-handheld.com, Discussions about the Letux Kernel =
<letux-kernel@openphoenux.org>, David Shah <dave@ds0.me>
> Subject: Re: module_mipi_dsi_driver panel with omapdrm?
>=20
> Hi,
>=20
> > Am 05.08.2020 um 13:28 schrieb Sebastian Reichel =
<sebastian.reichel@collabora.com>:
> >=20
> > Hi,
> >=20
> > On Wed, Aug 05, 2020 at 11:19:20AM +0200, H. Nikolaus Schaller =
wrote:
> >> What I do not yet understand is how Laurent's patch should be able
> >> to break it.
> >=20
> > omapdrm will not probe successfully if any DT enabled component
> > does not probe correctly. Since the patch you identified touched
> > HDMI and VENC and you are probably using HDMI, I suggest looking
> > there first.
>=20
> Yes, that is a very good explanation.
>=20
> Maybe there is a subtle change in how the HDMI connector has to be =
defined
> which is missing in our (private) DTB. Maybe the OMAP5-uEVM DTS gives =
a hint.
>=20
> A quick check shows last hdmi specific change for omap5-board-common =
or uevm
> was in 2017 but I may have missed something.
>=20
> There are 715a5a978733f0 and 671ab615bd507f which arrived in v5.7-rc1 =
as well
> and are related to hdmi clocks. So this may be (or not) and =
influencing factor.
>=20
> BR and thanks,
> Nikolaus
>=20

