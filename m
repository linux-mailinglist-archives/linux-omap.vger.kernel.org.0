Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78EFA23C912
	for <lists+linux-omap@lfdr.de>; Wed,  5 Aug 2020 11:23:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727787AbgHEJV6 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 5 Aug 2020 05:21:58 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.54]:23675 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728475AbgHEJTt (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 5 Aug 2020 05:19:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1596619179;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=a5Fvst2OgUlWR+a21czPheZM9gfjyinUckvlazO7ylM=;
        b=siLqWllxP/tgSNUz02IWZHFutqaGt6AqbnIQTAGgXtFHOSneZdXWKVHKHA83fqk+x9
        mU3cpnoyuWwA1obXEcWUwwAlJHFOe94FMRrrMvua8sStmm9hfxsqTptOXO115JMMXNmu
        omGApdjrWD2mp0uBFWqdFSgAymoDwiZETRXeJWL3HNe93KvrUX7UhbKO0NqGdrDC4ntO
        x245IsZqj9ygfd4Gi2g2gdJI1JkUepGjm2GDplETvcwC9nHtwYRZGI4i+mkmFdr7oNsa
        hQg14eWKKP/JIc4BLTnUjjJkbS3CnMv8gf+O+TlO/PWa+jtDXqg+VDVvMS4RKaAZMkxk
        3zXw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBp5hRy/t23tTZSrJjFjnMxHeRySJfbYvHg2rwqFtykqL30hQI+"
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2003:d5:8700:1900:8d31:b97b:b6e:6baa]
        by smtp.strato.de (RZmta 46.10.5 AUTH)
        with ESMTPSA id V07054w759JLamZ
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Wed, 5 Aug 2020 11:19:21 +0200 (CEST)
Subject: Re: module_mipi_dsi_driver panel with omapdrm?
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200801232259.hitcfosiq6f2i57y@earth.universe>
Date:   Wed, 5 Aug 2020 11:19:20 +0200
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tony Lindgren <tony@atomide.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Jyri Sarha <jsarha@ti.com>, kernel@pyra-handheld.com,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, David Shah <dave@ds0.me>
Content-Transfer-Encoding: quoted-printable
Message-Id: <4F1BD997-B791-4570-92B9-552C9BFF1350@goldelico.com>
References: <20200705143614.GR37466@atomide.com> <E200E98D-A4F8-4270-B192-33733F4C7235@goldelico.com> <20200706143613.GS37466@atomide.com> <E4616E3C-2519-4421-BC75-87A5CA2BB9EF@goldelico.com> <20200707180115.GB5849@atomide.com> <ECE29C41-DFE5-4A50-9206-6FB3183824C3@goldelico.com> <6E0A9415-9AB5-48D9-9E61-12D20655D04D@goldelico.com> <EE54FB82-C18E-4B81-AB38-E9453A32406B@goldelico.com> <20200724012411.GJ21353@pendragon.ideasonboard.com> <7023EB05-DC29-4D42-84C8-F0D14B50467D@goldelico.com> <20200801232259.hitcfosiq6f2i57y@earth.universe>
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Sebastian,

> Am 02.08.2020 um 01:22 schrieb Sebastian Reichel =
<sebastian.reichel@collabora.com>:
>=20
>>=20
>> Fortunately David did fix the broken "reboot" for OMAP5 (when using =
timer8).
>> Now I could run an unattended bisect session for the MIPI DSI panel =
driver
>> to find as the first bad commit:
>>=20
>> commit e7e67d9a2f1dd2f938adcc219b3769f5cc3f0df7
>> Author: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Date:   Wed Feb 26 13:24:59 2020 +0200
>>=20
>>   drm/omap: Switch the HDMI and VENC outputs to drm_bridge
>>=20
>> This was merged through v5.7-rc1. The problem persists since then up
>> to v5.8-rc7 and likely also to v5.9.
>>=20
>> What I guess from the change hunks is that this is the critical one:
>>=20
>> diff --git a/drivers/gpu/drm/omapdrm/dss/output.c =
b/drivers/gpu/drm/omapdrm/dss/output.c
>> index 9ba7cc8539a1..ce21c798cca6 100644
>> --- a/drivers/gpu/drm/omapdrm/dss/output.c
>> +++ b/drivers/gpu/drm/omapdrm/dss/output.c
>> @@ -60,6 +60,11 @@ int omapdss_device_init_output(struct =
omap_dss_device *out,
>> 	}
>>=20
>> 	if (local_bridge) {
>> +		if (!out->bridge) {
>> +			ret =3D -EPROBE_DEFER;
>> +			goto error;
>> +		}
>> +
>=20
> The DSI code calls omapdss_device_init_output with
> local_bridge=3DNULL, so this is no called.

Ok. That is very likely.

Unfortuantely I currently can't do printk tests on real hardware.

>>=20
>> This is consistent with that our (old omapdrm) panel driver is no =
longer probed.
>>=20
>>>> an experimental gpu/drm/panel driver does not probe. And I assume =
that
>>>> omapdrm/display will disappear completely soon.
>>>=20
>>> Not before Sebastian's series gets integrated.
>>=20
>> Is there a simple patch (either from Sebastian's series or other =
source)
>> that fixes this regression until Sebastian's series is fully merged =
and we
>> can move to a module_mipi_dsi_driver based driver?
>=20
> The purpose of the whole patchset is to move to drm_panel instead of
> the omapdrm specific panel code.

Indeed. But it should not break the omapdrm/dss/dsi.c driver which is =
not moved.

> Some of the review feedback, that I
> received implies that my patchset breaks your usecase (video model
> DSI panel). The plan is to send it in smaller parts, which makes the
> review process a bit simpler and also the rebasing work of the
> series itself. The *.txt -> *.yaml binding patch has been queued
> for 5.9 and the DT patches are currently waiting to be queued by
> Tony. Next step is preparing for mipi_dsi. I will do this in two
> steps:
>=20
> 1. patches up to the point creating problems for video mode

The problem is that our dsi video mode panel is already broken since
v5.7-rc1. Before any of your patches is merged.

What I do not yet understand is how Laurent's patch should be able to =
break it.

> 2. all the way to mipi_dsi (but not yet drm_panel)

Yes, that will be the next step. Before I can help there with testing
we need to fix dsi with v5.7ff

BR and thanks,
Nikolaus

