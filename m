Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB80D2AA504
	for <lists+linux-omap@lfdr.de>; Sat,  7 Nov 2020 13:32:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727611AbgKGMcH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 7 Nov 2020 07:32:07 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.51]:31421 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727264AbgKGMcE (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 7 Nov 2020 07:32:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1604752317;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=A9A2kGyjSNtzr6whZaCacuKSTOMm8RNHpA91jGCYY3s=;
        b=ne9NHDJ5GePL8w7KwIVI+jFTQm2BdPCP+9G6duhDuNltTT1jFW/9rGCLYdMg4vzyOq
        EGlHICfSlRlOPFZMYHUymgaJLOZXuJEX2kKo3BiPkiw94ZhcKEPI4Aq2UuH+gDY0omnD
        5e5mnUesJ2pXqnFcz7J8pEZPV+Iy7zIwLrNl6h+3T++ruJv+WsQm3E7EaOKG8D4mZxTj
        A+NxRDhkjFufiad19dQmEXyVpDYMS4m59570xtFv71tOdpvUPgvw+R2jqH5jpLzlmAhr
        FT1L9wkutrhjpc+zLbtnTcFYx4Rpl5i6FKipWWtUp79/H8EuaCcSbCaGoOvWD2SCAAbT
        mAMA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDlSVXAgNkQ=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 47.3.3 DYNA|AUTH)
        with ESMTPSA id d04888wA7CJp6rs
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Sat, 7 Nov 2020 13:19:51 +0100 (CET)
Subject: Re: [PATCH v3 00/56] Convert DSI code to use drm_mipi_dsi and drm_panel
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <1f1afce4-c822-0fbf-1ce3-dda0064b65c6@ti.com>
Date:   Sat, 7 Nov 2020 13:19:50 +0100
Cc:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <67786545-23D2-444F-85B8-7A030070B317@goldelico.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com> <61C04176-4654-4D2D-A55B-31FBB6D2E5AA@goldelico.com> <fcbc8488-5861-8e51-0f86-1ed6498083f7@ti.com> <579243AA-014A-411B-9014-F5846C9B8137@goldelico.com> <ab33baff-dd8c-2ee0-6f89-35aa4df7b9cf@ti.com> <837EA533-9946-43B3-B058-69060EC43981@goldelico.com> <08589e51-f5e6-2743-57ec-8ac509f97ff0@ti.com> <1f1afce4-c822-0fbf-1ce3-dda0064b65c6@ti.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
X-Mailer: Apple Mail (2.3124)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tomi,

> Am 06.11.2020 um 16:04 schrieb Tomi Valkeinen <tomi.valkeinen@ti.com>:
>=20
>>=20
>> I took the driver and make my omap4-sdp dts to use it. It probes for =
me, but stop after that:
>>=20
>> [  119.346374] omapdss_dss 58000000.dss: supply vdda_video not found, =
using dummy regulator
>> [  119.358398] DSS: OMAP DSS rev 4.0
>> [  119.680053] panel-dsi-cm 58004000.encoder.0: failed to get video =
timing, using defaults
>> [  119.695709] panel-dsi-cm 58004000.encoder.0: supply vpnl not =
found, using dummy regulator
>> [  119.711242] panel-dsi-cm 58004000.encoder.0: supply vddi not =
found, using dummy regulator
>> [  119.769470] panel-btl507212-w677l 58005000.encoder.0: w677l_probe
>> [  119.779388] panel-btl507212-w677l 58005000.encoder.0: w677l_probe =
ok
>> [  119.846679] omapdss_dss 58000000.dss: bound 58001000.dispc (ops =
dispc_component_ops [omapdrm])
>> [  119.858673] omapdss_dss 58000000.dss: bound 58004000.encoder (ops =
dsi_component_ops [omapdrm])
>> [  119.882629] omapdss_dss 58000000.dss: bound 58005000.encoder (ops =
dsi_component_ops [omapdrm])
>> [  119.902069] omapdss_dss 58000000.dss: bound 58006000.encoder (ops =
hdmi4_component_ops [omapdrm])
>> [  119.962066] dmm 4e000000.dmm: initialized all PAT entries
>> [  120.014770] panel-btl507212-w677l 58005000.encoder.0: =
w677l_get_modes
>>=20
>> I didn't debug yet where it's hanging. So you're not even getting the =
probe?
>=20
> Oh, it's stuck in a loop trying to calculate suitable timings. It =
doesn't find it, as I'm running on
> omap4, with just 2 datalanes instead of 4 which the panel needs. Looks =
like the code could use some
> improvement there.
>=20
> Anyway, possibly on omap5 it goes fine.

I have set up based on our complete letux-5.10-rc2 tree and maybe using =
our private config makes
the difference. Anyways, the driver is now probed and I can see the call =
to w677l_get_modes().

I have still no image and no calls to prepare/unprepare etc. but now I =
can start to debug on omap5.
And hopefully we are close to push the panel driver for review. And in a =
second step some device
tree for the Pyra.

The new tree is here: =
https://git.goldelico.com/?p=3Dletux-kernel.git;a=3Dshortlog;h=3Drefs/head=
s/work-pyra-panel

BR and thanks,
Nikolaus

