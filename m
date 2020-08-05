Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B178D23C923
	for <lists+linux-omap@lfdr.de>; Wed,  5 Aug 2020 11:28:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725809AbgHEJ1v (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 5 Aug 2020 05:27:51 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.164]:24722 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728345AbgHEJ1D (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 5 Aug 2020 05:27:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1596619572;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=H11ATyUbB+dixBH7jH9OpSYqJP3Fh4mCeOq0qgY9BH4=;
        b=fhar/VIDf6Yhjvh+/W8fcriGXWFfSDFv0dK/SUgyg8f7r70KAddAxrr6Ng7RM/EECR
        lKkLIU18+YKzDIxVLrLNT0hqjY16C155tPMAKImWfX7MUwOAf3FPpwn0uh9zOEazHe5m
        z7Wxzla3nk+06t/MDkku2NwydBWiNZKmN6aadYtprkejCMHbahBSpTgI0z3wJnhhazvi
        YMFL1SFPzbUEu5jshBYRelluP+0sXCmYmvrjpvOcXsHkbaCe2KpFKrSBr083jURT161K
        XkW5PINgwI/Pl0yBR7qizy5OfbtuzEVXjfsdf/BYbSFSyUnRTni9i8lErkE+c+TLFgk9
        2f4g==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBp5hRy/t23tTZSrJjFjnMxHeRySJfbYvHg2rwqFtykqL30hQI+"
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2003:d5:8700:1900:8d31:b97b:b6e:6baa]
        by smtp.strato.de (RZmta 46.10.5 AUTH)
        with ESMTPSA id V07054w759Pxaoh
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Wed, 5 Aug 2020 11:25:59 +0200 (CEST)
Subject: Re: module_mipi_dsi_driver panel with omapdrm?
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <e4caecb9-59d9-942c-0996-5906617d2604@ti.com>
Date:   Wed, 5 Aug 2020 11:25:58 +0200
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Jyri Sarha <jsarha@ti.com>, kernel@pyra-handheld.com,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, David Shah <dave@ds0.me>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <3326D023-8D7D-4B97-90B3-E05392A187DC@goldelico.com>
References: <5F4C23B0-A82B-4F94-BD74-D04F6D798FC0@goldelico.com> <20200705142653.GQ37466@atomide.com> <20200705143614.GR37466@atomide.com> <E200E98D-A4F8-4270-B192-33733F4C7235@goldelico.com> <20200706143613.GS37466@atomide.com> <E4616E3C-2519-4421-BC75-87A5CA2BB9EF@goldelico.com> <20200707180115.GB5849@atomide.com> <ECE29C41-DFE5-4A50-9206-6FB3183824C3@goldelico.com> <6E0A9415-9AB5-48D9-9E61-12D20655D04D@goldelico.com> <EE54FB82-C18E-4B81-AB38-E9453A32406B@goldelico.com> <20200724012411.GJ21353@pendragon.ideasonboard.com> <7023EB05-DC29-4D42-84C8-F0D14B50467D@goldelico.com> <e4caecb9-59d9-942c-0996-5906617d2604@ti.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tomi,

> Am 04.08.2020 um 14:43 schrieb Tomi Valkeinen <tomi.valkeinen@ti.com>:
>=20
> On 01/08/2020 16:43, H. Nikolaus Schaller wrote:
>=20
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
>> 		out->next_bridge =3D out->bridge;
>> 		out->bridge =3D local_bridge;
>> 	}
>>=20
>> Since I have not seen a reference to an omap DSI bridge driver in =
upstream kernels
>> I would assume that out->bridge is NULL and therefore probing is =
deferred forever
>> and the old MIPI DSI driver (which is still there) is no longer =
operational.
>>=20
>> This is consistent with that our (old omapdrm) panel driver is no =
longer probed.
>=20
> What happens? Do you get any displays? Or no displays at all? Do you =
get an error print?
>=20
> As Sebastian said, this shouldn't prevent DSI from probing. I don't =
see anything in the commit that
> might affect DSI.

Yes, that is indeed strange. The only potential direct reason I could =
imagine is the
additional test for out-bridge, but with Sebastian's explanation it is =
not
even called for DSI.

Maybe it is a false report by git bisect because this patch enables a =
change somewhere
else for the first time, which affects the DSI setup indirectly.

I have seen that there now is a similar, but not identical report for =
the N900 panel.

>=20
> Does the board have other display outputs? HDMI? If yes, could you try =
with HDMI disabled, e.g. set
> its status to "disabled" in the .dts.

My good/bad indicator is that there is no /dev/fb0 created any more. I =
have not
checked for HDMI but it is likely also missing then. Basically it =
stopped working
with v5.7-rc1 (as the basis where we add our private panel driver, some =
PMU/charger
driver, DTS on top) and bisect did report this commit.

Unfortunately I currently can't do tests on real hardware and play =
around with printk
in the code for the next weeks. Or partially reverting the patch step by =
step to see
which change has an influence.

BR,
Nikolaus

