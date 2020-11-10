Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3B452AE157
	for <lists+linux-omap@lfdr.de>; Tue, 10 Nov 2020 22:04:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726428AbgKJVEk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Nov 2020 16:04:40 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.52]:32949 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726214AbgKJVEk (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 10 Nov 2020 16:04:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1605042278;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=J3iLT4lR6dl7ChrGzU2OdJxyQhmkQ6JyK0qL/xklO1Q=;
        b=mST2VZG9n59uWodNe31jqDGddA8aWlcQvk73pZX9C6f8F/asreKVGuRIS2cS8mdGix
        nNpd8LpobtlyLUfw+YcgezYa4Wmuf1q8QFWWk2CtQbkoKSEtieBzHG1HXZPDXMQXNonG
        e+QjJ5L2tjU3u6JMxaRzB0JF8bPlJxf/sc72wEO7iZ93VeYqcLMf32uOVGIu7Eame92f
        0OxBRrzMci+mNYWXS6p6KCn4wctLJIabGvYm8utdKdIP/6bR7K9Y5k8f5p/9o0gBD1nA
        yaiowLsGeuSW5q8qYB0FGdrcR1CwtWpAN7GFhXbmlnuq4pV0uEZ191wCjvFudpYFrhr7
        bqKg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDVCUXAYLEg=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 47.3.4 DYNA|AUTH)
        with ESMTPSA id N02faawAAL4V33d
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Tue, 10 Nov 2020 22:04:31 +0100 (CET)
Subject: Re: [PATCH v3 00/56] Convert DSI code to use drm_mipi_dsi and drm_panel
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <917fe1c6-4009-7788-f815-fcc1fc2ba7df@ti.com>
Date:   Tue, 10 Nov 2020 22:04:31 +0100
Cc:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <2265AEF5-42BC-4E7B-B263-D0B93B78DE91@goldelico.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com> <61C04176-4654-4D2D-A55B-31FBB6D2E5AA@goldelico.com> <fcbc8488-5861-8e51-0f86-1ed6498083f7@ti.com> <579243AA-014A-411B-9014-F5846C9B8137@goldelico.com> <ab33baff-dd8c-2ee0-6f89-35aa4df7b9cf@ti.com> <837EA533-9946-43B3-B058-69060EC43981@goldelico.com> <08589e51-f5e6-2743-57ec-8ac509f97ff0@ti.com> <1f1afce4-c822-0fbf-1ce3-dda0064b65c6@ti.com> <67786545-23D2-444F-85B8-7A030070B317@goldelico.com> <a20f2b88-bfe6-0ab4-a19b-ba5316db6c4f@ti.com> <17F5238B-1CC3-4764-B744-C57D9CE4EB42@goldelico.com> <db0b9694-4d04-18ba-fdf0-093b5914bbf0@ti.com> <6A9407FC-69F7-4E30-B4A3-FFB2E91CAE3B@goldelico.com> <1cf563e5-2dc0-1802-86e3-3e24150f0651@ti.com> <BBC7824A-A689-4144-969C-32608A202A75@goldelico.com> <7f820fd2-820b-bfdd-a43b-174ad6b09868@ti.com> <0AF59BFD-89F2-46D3-9EB6-F47FBB52B183@goldelico.com> <AEAA7281-7B82-47A6-A0BA-EF08C56824A8@goldelico.com> <917fe1c6-4009-7788-f815-fcc1fc2ba7df@ti.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
X-Mailer: Apple Mail (2.3124)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


> Am 10.11.2020 um 17:52 schrieb Tomi Valkeinen <tomi.valkeinen@ti.com>:
>=20
> On 10/11/2020 18:49, H. Nikolaus Schaller wrote:
>=20
> I guess you have the same issue. It goes to dsi_bridge_mode_valid, =
then __dsi_calc_config, and stays
> there finding good clocks.

Yes, I could trace it down to exactly this point.

So the culprit is somehow the panel driver. Because it asks for clocks =
that the PLL driver does not want to provide...
Or is it the victim?

Here is what dmesg reports with even more printk():

[  276.970635] drm_helper_probe_single_connector_modes 12 count=3D1
[  277.003509] drm_mode_validate_pipeline 2 ret=3D0 status=3D0
[  277.038678] drm_bridge_chain_mode_valid: =
func=3Ddsi_bridge_mode_valid+0x0/0xa0 [omapdrm]
[  277.047199] dsi_bridge_mode_valid
[  277.050786] __dsi_calc_config
[  277.057270] dsi_vm_calc
[  277.073251] dss_pll_calc_a clkin=3D19200000 pll_min=3D1555386656 =
pll_max=3D1555410656 func=3Ddsi_vm_calc_pll_cb+0x0/0x48 [omapdrm]
[  277.084975] dss_pll_calc_a pll_hw_max=3D1800000000 fint_hw_min=3D150000=
 fint_hw_max=3D52000000
[  277.093637] dss_pll_calc_a n_start=3D1 n_inc=3D1 n_stop=3D128 =
pll_max'=3D1555410656
[  277.101062] dss_pll_calc_a n=3D1 clkin=3D19200000 fint=3D19200000
[  277.107152] dss_pll_calc_a m_start=3D41 m_inc=3D1 m_stop=3D40

Ok, we have to wait quite a while until the for(m;;) loop ends, because =
m_stop < m_start and m_inc is positive.

So something in the formulae in dss_pll_calc_a() does not fit or has =
unintended rounding effects.
Or the values reported by w677l_get_modes() do not fit anything.

I think these findings and ideas should help to find a fix.

BR and thanks,
Nikolaus=
