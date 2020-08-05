Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E552923CC69
	for <lists+linux-omap@lfdr.de>; Wed,  5 Aug 2020 18:44:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727121AbgHEQnz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 5 Aug 2020 12:43:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727921AbgHEQmM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 5 Aug 2020 12:42:12 -0400
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5301::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C4C7C034600
        for <linux-omap@vger.kernel.org>; Wed,  5 Aug 2020 04:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1596626686;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=cy2d14Hn5YW6xysx2HDMFUxTkb2B5s2X5h6Alk1tmQE=;
        b=K+DXha+6sdrGmLAVPWCayE3diHwW9d5iaG4tRh7ua2B+nGcpUfXxLIKd/D/H6E18fj
        /SAFOnXtUM5CHH3d1ht/VAbFjWxHE3PL2egmmemqUQKAMVXo8pfJUDWgenfvIdSS/Gvm
        /EgysuqGHKNMB5TiqOOjPKlDHOduifM4J1U2OOHSEK8oZWqPTXBIJlD63yELohLEeSbl
        AsM8l0EOxDOrpgBhhqSjkrTSBHpoqsLykqkFR/uXBl+ri4CLwNMOAILm1CD08J+CA23A
        yajoxOxHdRUGdp+Y3hVN5/qzwG+aMBlWWxH7M+AnQiqEael21Hw+04CQlxPtpB81hJzQ
        JdBA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBp5hRy/t23tTZSrJjFjnMxHeRySJfbYvHg2rwqFtykqL30hQI+"
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2003:d5:8700:1900:8d31:b97b:b6e:6baa]
        by smtp.strato.de (RZmta 46.10.5 AUTH)
        with ESMTPSA id V07054w75BE6bXZ
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Wed, 5 Aug 2020 13:14:06 +0200 (CEST)
Subject: Re: module_mipi_dsi_driver panel with omapdrm?
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200805110718.zvjbmv3ftgpcudly@earth.universe>
Date:   Wed, 5 Aug 2020 13:14:05 +0200
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Jyri Sarha <jsarha@ti.com>, kernel@pyra-handheld.com,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, David Shah <dave@ds0.me>
Content-Transfer-Encoding: quoted-printable
Message-Id: <411E68FA-023E-4A21-A497-BF6345086954@goldelico.com>
References: <20200706143613.GS37466@atomide.com> <E4616E3C-2519-4421-BC75-87A5CA2BB9EF@goldelico.com> <20200707180115.GB5849@atomide.com> <ECE29C41-DFE5-4A50-9206-6FB3183824C3@goldelico.com> <6E0A9415-9AB5-48D9-9E61-12D20655D04D@goldelico.com> <EE54FB82-C18E-4B81-AB38-E9453A32406B@goldelico.com> <20200724012411.GJ21353@pendragon.ideasonboard.com> <7023EB05-DC29-4D42-84C8-F0D14B50467D@goldelico.com> <e4caecb9-59d9-942c-0996-5906617d2604@ti.com> <3326D023-8D7D-4B97-90B3-E05392A187DC@goldelico.com> <20200805110718.zvjbmv3ftgpcudly@earth.universe>
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


> Am 05.08.2020 um 13:07 schrieb Sebastian Reichel =
<sebastian.reichel@collabora.com>:
>=20
> Hi,
>=20
> On Wed, Aug 05, 2020 at 11:25:58AM +0200, H. Nikolaus Schaller wrote:
>>> Am 04.08.2020 um 14:43 schrieb Tomi Valkeinen =
<tomi.valkeinen@ti.com>:
>>> On 01/08/2020 16:43, H. Nikolaus Schaller wrote:
>>>> Fortunately David did fix the broken "reboot" for OMAP5 (when using =
timer8).
>>>> Now I could run an unattended bisect session for the MIPI DSI panel =
driver
>>>> to find as the first bad commit:
>>>>=20
>>>> commit e7e67d9a2f1dd2f938adcc219b3769f5cc3f0df7
>>>> Author: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>>> Date:   Wed Feb 26 13:24:59 2020 +0200
>>>>=20
>>>>  drm/omap: Switch the HDMI and VENC outputs to drm_bridge
>>>>=20
>>>> This was merged through v5.7-rc1. The problem persists since then =
up
>>>> to v5.8-rc7 and likely also to v5.9.
>>>>=20
>>>> What I guess from the change hunks is that this is the critical =
one:
>>>>=20
>>>> diff --git a/drivers/gpu/drm/omapdrm/dss/output.c =
b/drivers/gpu/drm/omapdrm/dss/output.c
>>>> index 9ba7cc8539a1..ce21c798cca6 100644
>>>> --- a/drivers/gpu/drm/omapdrm/dss/output.c
>>>> +++ b/drivers/gpu/drm/omapdrm/dss/output.c
>>>> @@ -60,6 +60,11 @@ int omapdss_device_init_output(struct =
omap_dss_device *out,
>>>> 	}
>>>>=20
>>>> 	if (local_bridge) {
>>>> +		if (!out->bridge) {
>>>> +			ret =3D -EPROBE_DEFER;
>>>> +			goto error;
>>>> +		}
>>>> +
>>>> 		out->next_bridge =3D out->bridge;
>>>> 		out->bridge =3D local_bridge;
>>>> 	}
>>>>=20
>>>> Since I have not seen a reference to an omap DSI bridge driver in =
upstream kernels
>>>> I would assume that out->bridge is NULL and therefore probing is =
deferred forever
>>>> and the old MIPI DSI driver (which is still there) is no longer =
operational.
>>>>=20
>>>> This is consistent with that our (old omapdrm) panel driver is no =
longer probed.
>>>=20
>>> What happens? Do you get any displays? Or no displays at all? Do
>>> you get an error print?
>>>=20
>>> As Sebastian said, this shouldn't prevent DSI from probing. I
>>> don't see anything in the commit that might affect DSI.
>>=20
>> Yes, that is indeed strange. The only potential direct reason I could =
imagine is the
>> additional test for out-bridge, but with Sebastian's explanation it =
is not
>> even called for DSI.
>>=20
>> Maybe it is a false report by git bisect because this patch enables a =
change somewhere
>> else for the first time, which affects the DSI setup indirectly.
>>=20
>> I have seen that there now is a similar, but not identical report for =
the N900 panel.
>=20
> Note, that the N900 has an SDI panel, which is different from DSI.

Yes I know. But the symptom and the -rc or patch set where it appears =
for the first time
seems to be the same. So it may have a similar common reason.

>=20
>>> Does the board have other display outputs? HDMI? If yes, could
>>> you try with HDMI disabled, e.g. set its status to "disabled" in
>>> the .dts.
>>=20
>> My good/bad indicator is that there is no /dev/fb0 created any more. =
I have not
>> checked for HDMI but it is likely also missing then. Basically it =
stopped working
>> with v5.7-rc1 (as the basis where we add our private panel driver, =
some PMU/charger
>> driver, DTS on top) and bisect did report this commit.
>>=20
>> Unfortunately I currently can't do tests on real hardware and play =
around with printk
>> in the code for the next weeks. Or partially reverting the patch step =
by step to see
>> which change has an influence.
>=20
> So it might be HDMI (or VENC) not probing successfully and
> then resulting in -EPROBE_DEFER for omapdrm with no connection to
> DSI at all. I suggest to disable all non-DSI video devices in
> devicetree and check if this results in DSI panel coming up.

Ah, ok. There is no venc on omap5 but HDMI... Good thing to test.

BR,
Nikolaus

