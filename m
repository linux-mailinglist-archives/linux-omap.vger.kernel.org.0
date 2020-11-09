Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 607B62AB627
	for <lists+linux-omap@lfdr.de>; Mon,  9 Nov 2020 12:09:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729045AbgKILJd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 9 Nov 2020 06:09:33 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.52]:8091 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729038AbgKILJd (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 9 Nov 2020 06:09:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1604920171;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=q7H5GEZMtbA6jUsFT4cXKJySbHW7NdZ0P4vXecXdY9g=;
        b=HSC/cMKNC51A/qrKKPm9uYs2iG1BsG4nQy15pY3rjL4+iKRbQeSHBwQtyqrpvqYVBG
        bAJ8l2A+aAPR1gRpvXliBJUDpeRZwv5CYAGO5ZAaDTAi38YIJNs73OVwFducKj/MBRhE
        PlAVSng3Hl4ytPiFa07lRKew3yrqHKb68ab81du3oB6kThcIAFD1P2E1RuiAxrvv/nBt
        2o9eBj8D5iUvYnYSmneXmF271hFG5WnL+LELQVWCIx7ysteOZSZvYIfWBMJFYQMBBvsC
        gMRbmkvtI/j5h2b6zKCccJ/yIIKn5+yMYpSfy0Tff6ZPf5F5ZUKAVdk1VCTN4+oJtk20
        I7fg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDlaVXA0JCQ=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 47.3.3 DYNA|AUTH)
        with ESMTPSA id d04888wA9B9LBSh
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Mon, 9 Nov 2020 12:09:21 +0100 (CET)
Subject: Re: [PATCH v3 00/56] Convert DSI code to use drm_mipi_dsi and drm_panel
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <1cf563e5-2dc0-1802-86e3-3e24150f0651@ti.com>
Date:   Mon, 9 Nov 2020 12:09:21 +0100
Cc:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <BBC7824A-A689-4144-969C-32608A202A75@goldelico.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com> <61C04176-4654-4D2D-A55B-31FBB6D2E5AA@goldelico.com> <fcbc8488-5861-8e51-0f86-1ed6498083f7@ti.com> <579243AA-014A-411B-9014-F5846C9B8137@goldelico.com> <ab33baff-dd8c-2ee0-6f89-35aa4df7b9cf@ti.com> <837EA533-9946-43B3-B058-69060EC43981@goldelico.com> <08589e51-f5e6-2743-57ec-8ac509f97ff0@ti.com> <1f1afce4-c822-0fbf-1ce3-dda0064b65c6@ti.com> <67786545-23D2-444F-85B8-7A030070B317@goldelico.com> <a20f2b88-bfe6-0ab4-a19b-ba5316db6c4f@ti.com> <17F5238B-1CC3-4764-B744-C57D9CE4EB42@goldelico.com> <db0b9694-4d04-18ba-fdf0-093b5914bbf0@ti.com> <6A9407FC-69F7-4E30-B4A3-FFB2E91CAE3B@goldelico.com> <1cf563e5-2dc0-1802-86e3-3e24150f0651@ti.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
X-Mailer: Apple Mail (2.3124)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


> Am 09.11.2020 um 11:34 schrieb Tomi Valkeinen <tomi.valkeinen@ti.com>:
>=20
> On 09/11/2020 12:31, H. Nikolaus Schaller wrote:
>>=20
>>> Am 09.11.2020 um 11:22 schrieb Tomi Valkeinen =
<tomi.valkeinen@ti.com>:
>>>=20
>>> On 09/11/2020 11:30, H. Nikolaus Schaller wrote:
>>>>=20
>>>>> Am 09.11.2020 um 09:04 schrieb Tomi Valkeinen =
<tomi.valkeinen@ti.com>:
>>>>>=20
>>>>> On 07/11/2020 14:19, H. Nikolaus Schaller wrote:
>>>>>=20
>>>>>> I have set up based on our complete letux-5.10-rc2 tree and maybe =
using our private config makes
>>>>>> the difference. Anyways, the driver is now probed and I can see =
the call to w677l_get_modes().
>>>>>>=20
>>>>>> I have still no image and no calls to prepare/unprepare etc. but =
now I can start to debug on omap5.
>>>>>> And hopefully we are close to push the panel driver for review. =
And in a second step some device
>>>>>> tree for the Pyra.
>>>>>>=20
>>>>>> The new tree is here: =
https://git.goldelico.com/?p=3Dletux-kernel.git;a=3Dshortlog;h=3Drefs/head=
s/work-pyra-panel
>>>>>=20
>>>>> Ok, good. Do you have a link the previous driver that works =
(omapdrm specific panel driver)? I think
>>>>> it's good to have that as a reference.
>>>>=20
>>>> Yes, here:
>>>>=20
>>>> =
https://git.goldelico.com/?p=3Dletux-kernel.git;a=3Dshortlog;h=3Drefs/head=
s/letux/panels
>>>=20
>>> Ok. The old driver uses two separate VC configurations (request_vc =
calls),
>>=20
>> yes indeed. I was not sure how to handle this with the new omapdrm =
drivers.
>>=20
>>> so it may not work with
>>> this series. I think we need to implement logic to the dsi driver to =
somehow handle this kind of setup.
>>=20
>> I see.
>> Anyways there is missing some simple thing which makes the driver not =
prepared/enabled.
>> Or is this related to VC?
>=20
> No, that's not related to the VC.

Ok, then it is worth searching for that independently. Any idea/hint =
what could be missing?

BR and thanks,
Nikolaus

