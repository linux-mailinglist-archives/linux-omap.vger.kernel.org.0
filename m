Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0C1122BDB5
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jul 2020 07:50:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726134AbgGXFu1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Jul 2020 01:50:27 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.218]:20517 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726001AbgGXFu1 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 24 Jul 2020 01:50:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1595569825;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=+BrHSk1A4pXeDcAdbLQ4HZ359H6upvMLBpCg7heznA4=;
        b=Ny8LXwtvptnn4LSSVwPPzlzFJUKKAlMtgFzY5YoKbQsqqUJ44WKnHqCs6+wK1M3CN6
        i7oQfFlHL4yyPUCuk+499fd3AQQrbb4V/Cr6tz5lv+7dbnVsGJl/ELpGYlpMXxwTwaXl
        u0hYVvHEc6F39/vYyfjWWe6Stf+tvNT2NF9zDxn2VtzTZUoHQK3/8YLDQnRgQMrIeEZP
        IjjK7Ijd+tkmNiSNYZNB2TCWARVHvlyhGkiaumiyTIxgf74wt+TKUeh7L3JnnBUku3wb
        h653WDiT/FEoSVbbq3sb/7C7WFXSbqri3bx9eEMElK2O2BwXY1mxAMqEXsB8x7UkOAyY
        mmrQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDlSeXA4I9cA="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.10.5 DYNA|AUTH)
        with ESMTPSA id V07054w6O5oEy9t
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Fri, 24 Jul 2020 07:50:14 +0200 (CEST)
Subject: Re: module_mipi_dsi_driver panel with omapdrm?
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200724012411.GJ21353@pendragon.ideasonboard.com>
Date:   Fri, 24 Jul 2020 07:50:14 +0200
Cc:     Tony Lindgren <tony@atomide.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Jyri Sarha <jsarha@ti.com>, kernel@pyra-handheld.com,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <53AC411A-53A9-4ED2-8DCD-A88F6CF739EB@goldelico.com>
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
> host with mipi_dsi_host_register().

I see.

> omapdrm doesn't do so yet, we need
> to integrate Sebastian's "[PATCHv2 00/56] drm/omap: Convert DSI code =
to
> use drm_mipi_dsi and drm_panel" series first. I'll try to review it in
> the near future.
>=20
>> The problem is that our old omapdrm/display driver is broken since =
v5.7 and
>> an experimental gpu/drm/panel driver does not probe. And I assume =
that
>> omapdrm/display will disappear completely soon.
>=20
> Not before Sebastian's series gets integrated.

Yes, it is be very important for us since I do not want to find out why =
the
old omapdrm/display driver isn't working any more just to have it =
rewritten
again and moved to gpu/drm/panel within a very short time frame.

I would be happy to start the new panel driver and test it with =
Sebastian's
series. AFAIR Sebastian's series doesn't currently apply well to v5.8-rc =
so
it would be nice if there were a work-in-progress repo that is rebased =
every
now and then.

BR and thanks,
Nikolaus

