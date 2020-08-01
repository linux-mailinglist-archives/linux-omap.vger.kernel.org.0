Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25D182352A4
	for <lists+linux-omap@lfdr.de>; Sat,  1 Aug 2020 15:43:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726471AbgHANnw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 1 Aug 2020 09:43:52 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.50]:23847 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726461AbgHANnv (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 1 Aug 2020 09:43:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1596289426;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=o66ZXt1AVCnGWEQUreyCFYQcL90P51gN5MmSObFliqY=;
        b=Maq8uWyjpRgHVaZPaosynbOjV0mzWxkNSc17HG3ThPyCH23/xtly8W9Nw6lzT0L9Iy
        dXz4rybVPl+cXCP0oEJ4XNnfoJR1rE4ekTMqdT8yyHtKhs458H8pLHft0S4B9lWwVqMx
        sXD6pAQHz22weutqyFwlWbPHkHamc88ef0K9B3bQW9vDe0wJygCnB1+CHOoZSVtEOLah
        dSJoJkGtkdIEOrSY8Ez++PQnRToUKj8HznPwwWm0+NwB79/5V4QUJ24W9n64bAgrO9BT
        aZZk5c+YyRibEmuZX+shBBF5RjMdc8W2Kns3ME1VwBFUmixZM8S0CtTapkRYnGKrsOsQ
        +dNQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGHPrvwDOjrA4="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.10.5 DYNA|AUTH)
        with ESMTPSA id V07054w71DhNPcb
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Sat, 1 Aug 2020 15:43:23 +0200 (CEST)
Subject: Re: module_mipi_dsi_driver panel with omapdrm?
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200724012411.GJ21353@pendragon.ideasonboard.com>
Date:   Sat, 1 Aug 2020 15:43:22 +0200
Cc:     Tony Lindgren <tony@atomide.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Jyri Sarha <jsarha@ti.com>, kernel@pyra-handheld.com,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, David Shah <dave@ds0.me>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <7023EB05-DC29-4D42-84C8-F0D14B50467D@goldelico.com>
References: <5F4C23B0-A82B-4F94-BD74-D04F6D798FC0@goldelico.com> <20200705142653.GQ37466@atomide.com> <20200705143614.GR37466@atomide.com> <E200E98D-A4F8-4270-B192-33733F4C7235@goldelico.com> <20200706143613.GS37466@atomide.com> <E4616E3C-2519-4421-BC75-87A5CA2BB9EF@goldelico.com> <20200707180115.GB5849@atomide.com> <ECE29C41-DFE5-4A50-9206-6FB3183824C3@goldelico.com> <6E0A9415-9AB5-48D9-9E61-12D20655D04D@goldelico.com> <EE54FB82-C18E-4B81-AB38-E9453A32406B@goldelico.com> <20200724012411.GJ21353@pendragon.ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Laurent,

> Am 24.07.2020 um 03:24 schrieb Laurent Pinchart =
<laurent.pinchart@ideasonboard.com>:
>=20
> Hi Nikolaus,
>=20
> On Thu, Jul 23, 2020 at 09:03:49AM +0200, H. Nikolaus Schaller wrote:
>>> Am 08.07.2020 um 09:52 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>>>> Am 07.07.2020 um 21:04 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>>>>=20
>>>> And what I would need to know before I start to write new code is
>>>> if is possible to operate a video mipi dsi panel with driver from
>>>> gpu/drm/panel together with omapdrm (v5.7 and later).
>>>=20
>>> I did a quick test on a 5.7.6 kernel with the sysc fixes as
>>> suggested by Tony.
>>>=20
>>> Then I overwrote the compatible entry of our display to be
>>> orisetech,otm8009a and configured to build the otm8009a panel =
driver.
>>>=20
>>> The panel driver is loaded, but not probed (no call to =
otm8009a_probe).
>>> It is shown in /sys/bus/mipi-dsi/drivers (and lsmod) but not =
/sys/bus/mipi-dsi/devices.
>>>=20
>>> So what should I try next?
>>=20
>> Any suggestions if and how it is possible to use a gpu/drm/panel MIPI =
DSI
>> video mode panel with omapdrm (on OMAP5)?
>=20
> For the DSI panel to probe, the display driver needs to register a DSI
> host with mipi_dsi_host_register(). omapdrm doesn't do so yet, we need
> to integrate Sebastian's "[PATCHv2 00/56] drm/omap: Convert DSI code =
to
> use drm_mipi_dsi and drm_panel" series first. I'll try to review it in
> the near future.
>=20
>> The problem is that our old omapdrm/display driver is broken since =
v5.7 and

Fortunately David did fix the broken "reboot" for OMAP5 (when using =
timer8).
Now I could run an unattended bisect session for the MIPI DSI panel =
driver
to find as the first bad commit:

commit e7e67d9a2f1dd2f938adcc219b3769f5cc3f0df7
Author: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date:   Wed Feb 26 13:24:59 2020 +0200

   drm/omap: Switch the HDMI and VENC outputs to drm_bridge

This was merged through v5.7-rc1. The problem persists since then up
to v5.8-rc7 and likely also to v5.9.

What I guess from the change hunks is that this is the critical one:

diff --git a/drivers/gpu/drm/omapdrm/dss/output.c =
b/drivers/gpu/drm/omapdrm/dss/output.c
index 9ba7cc8539a1..ce21c798cca6 100644
--- a/drivers/gpu/drm/omapdrm/dss/output.c
+++ b/drivers/gpu/drm/omapdrm/dss/output.c
@@ -60,6 +60,11 @@ int omapdss_device_init_output(struct omap_dss_device =
*out,
 	}
=20
 	if (local_bridge) {
+		if (!out->bridge) {
+			ret =3D -EPROBE_DEFER;
+			goto error;
+		}
+
 		out->next_bridge =3D out->bridge;
 		out->bridge =3D local_bridge;
 	}

Since I have not seen a reference to an omap DSI bridge driver in =
upstream kernels
I would assume that out->bridge is NULL and therefore probing is =
deferred forever
and the old MIPI DSI driver (which is still there) is no longer =
operational.

This is consistent with that our (old omapdrm) panel driver is no longer =
probed.

>> an experimental gpu/drm/panel driver does not probe. And I assume =
that
>> omapdrm/display will disappear completely soon.
>=20
> Not before Sebastian's series gets integrated.

Is there a simple patch (either from Sebastian's series or other source)
that fixes this regression until Sebastian's series is fully merged and =
we
can move to a module_mipi_dsi_driver based driver?

BR and thanks,
Nikolaus

