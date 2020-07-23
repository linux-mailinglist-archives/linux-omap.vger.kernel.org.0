Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A23F622A95B
	for <lists+linux-omap@lfdr.de>; Thu, 23 Jul 2020 09:09:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726025AbgGWHJw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 23 Jul 2020 03:09:52 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.163]:17773 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725774AbgGWHJw (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 23 Jul 2020 03:09:52 -0400
X-Greylist: delayed 339 seconds by postgrey-1.27 at vger.kernel.org; Thu, 23 Jul 2020 03:09:51 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1595488190;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=lijxdthcNJw4sM2o/6A/hce9mtLTIih7yLVwb56VXRY=;
        b=h9+Pj+itql+2eWvyxUFW1loGcEytmxPFmyu8x2+MZxvsp8n5KTSKArWp9YGORIEvV/
        2O8Ofe7Nhmy9SsRGyL1X6cibgLQN5DSrnbdKAtmQ1IUUp3iY3sk8aCjfXUK8YhaO9MJm
        VBWwrTzwRGxa0mW701WzQQw3hIvYBu0JS3jAPtvp9coj01JFXHD/pWg9gVxadZUbm1ZA
        b04BFIOmXLwsd9FRbZaDlBHaXh28GiAKr1EOKpDyvQjE7fYSsAgduYHtglvgVIQ/VlMZ
        REatlJ/96N11thCExf1yNWXOs5Ei7gvT/2HBDvtoMMNHeAoNRQn7sZB6QXJObyDJxtIz
        5f6g==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBp5hRw/qOxWRk4dCynuTAIum5e6RGdDh/IiVSJVFGo1HYHkoPES/e4"
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2001:16b8:262c:9100:d1ef:18fe:6389:bbf8]
        by smtp.strato.de (RZmta 46.10.5 AUTH)
        with ESMTPSA id V07054w6N73nu7e
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Thu, 23 Jul 2020 09:03:49 +0200 (CEST)
Subject: Re:module_mipi_dsi_driver panel with omapdrm?
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <6E0A9415-9AB5-48D9-9E61-12D20655D04D@goldelico.com>
Date:   Thu, 23 Jul 2020 09:03:49 +0200
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        Jyri Sarha <jsarha@ti.com>, kernel@pyra-handheld.com,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <EE54FB82-C18E-4B81-AB38-E9453A32406B@goldelico.com>
References: <F5C04FAF-0029-48F3-B0A6-5327CD911EA2@goldelico.com> <49725F81-E615-4101-81B3-0850F201D9E8@goldelico.com> <5F4C23B0-A82B-4F94-BD74-D04F6D798FC0@goldelico.com> <20200705142653.GQ37466@atomide.com> <20200705143614.GR37466@atomide.com> <E200E98D-A4F8-4270-B192-33733F4C7235@goldelico.com> <20200706143613.GS37466@atomide.com> <E4616E3C-2519-4421-BC75-87A5CA2BB9EF@goldelico.com> <20200707180115.GB5849@atomide.com> <ECE29C41-DFE5-4A50-9206-6FB3183824C3@goldelico.com> <6E0A9415-9AB5-48D9-9E61-12D20655D04D@goldelico.com>
To:     Tony Lindgren <tony@atomide.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi all,

> Am 08.07.2020 um 09:52 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>=20
> Hi again,
>=20
>> Am 07.07.2020 um 21:04 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>>=20
>> And what I would need to know before I start to write new code is
>> if is possible to operate a video mipi dsi panel with driver from
>> gpu/drm/panel together with omapdrm (v5.7 and later).
>=20

> I did a quick test on a 5.7.6 kernel with the sysc fixes as
> suggested by Tony.
>=20
> Then I overwrote the compatible entry of our display to be
> orisetech,otm8009a and configured to build the otm8009a panel driver.
>=20
> The panel driver is loaded, but not probed (no call to =
otm8009a_probe).
> It is shown in /sys/bus/mipi-dsi/drivers (and lsmod) but not =
/sys/bus/mipi-dsi/devices.
>=20
> So what should I try next?

Any suggestions if and how it is possible to use a gpu/drm/panel MIPI =
DSI
video mode panel with omapdrm (on OMAP5)?

The problem is that our old omapdrm/display driver is broken since v5.7 =
and
an experimental gpu/drm/panel driver does not probe. And I assume that
omapdrm/display will disappear completely soon.

BR and thanks,
Nikolaus

