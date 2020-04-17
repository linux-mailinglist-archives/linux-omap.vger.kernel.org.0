Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E4061AE019
	for <lists+linux-omap@lfdr.de>; Fri, 17 Apr 2020 16:43:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727769AbgDQOnr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 17 Apr 2020 10:43:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726707AbgDQOnr (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 17 Apr 2020 10:43:47 -0400
X-Greylist: delayed 67125 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 17 Apr 2020 07:43:46 PDT
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5D0FC061A0C;
        Fri, 17 Apr 2020 07:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=/hmksmsGyuMhDF92uqdHn8O29eanZGUNq3GHfegEg1I=; b=IvrRfNagm+RUlAWfZ02wQ4JUnd
        HlzNDaAWoekfX5NbASWZRbXVmXboLuNX5chC5Kxd2Btv6DJ3Qpt/+1YIBwsWjb4CVNwsKTZqBD4L1
        8cBSXL8XdEQAZyA9UsJqYBvBGqCVagikijx7n6ww0xx9zW7VQfQVvjo0jGmX5fUk8KtE=;
Received: from p200300ccff0bc3001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff0b:c300:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1jPSDW-0007Ge-11; Fri, 17 Apr 2020 16:43:42 +0200
Date:   Fri, 17 Apr 2020 16:43:40 +0200
From:   Andreas Kemnade <andreas@kemnade.info>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        Evgeniy Polyakov <zbr@ioremap.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Adam Ford <aford173@gmail.com>,
        "Andrew F . Davis" <afd@ti.com>, Vignesh R <vigneshr@ti.com>
Subject: Re: [PATCHv3] w1: omap-hdq: Simplify driver with PM runtime
 autosuspend
Message-ID: <20200417164340.3d9043d1@aktux>
In-Reply-To: <3197C3F0-DEB9-4221-AFBD-4F2A08C84C4C@goldelico.com>
References: <20191217004048.46298-1-tony@atomide.com>
        <7B8C7DD9-095B-48FC-9642-695D07B79E97@goldelico.com>
        <20200416184638.GI37466@atomide.com>
        <3197C3F0-DEB9-4221-AFBD-4F2A08C84C4C@goldelico.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Score: -1.0 (-)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, 17 Apr 2020 16:22:47 +0200
"H. Nikolaus Schaller" <hns@goldelico.com> wrote:

> > Am 16.04.2020 um 20:46 schrieb Tony Lindgren <tony@atomide.com>:
> >=20
> > * H. Nikolaus Schaller <hns@goldelico.com> [200416 15:04]: =20
> >> Hi Tony,
> >> it looks as if something with this patch is broken on GTA04. For v5.6 =
and v5.7-rc1.
> >>=20
> >> HDQ battery access times out after ca. 15 seconds and I get temperatur=
e of -273.1=C2=B0C...
> >>=20
> >> Reverting this patch and everything is ok again. =20
> >=20
> > Hmm OK interesting.
> >  =20
> >> What is "ti,mode" about? Do we have that (indirectly) in gta04.dtsi?
> >> Or does this patch need some CONFIGs we do not happen to have? =20
> >=20
> > Sounds like you have things working though so there should be no
> > need for having ti,mode =3D "1w" in the dts.
> >  =20
> >>> 	pm_runtime_enable(&pdev->dev);
> >>> +	pm_runtime_use_autosuspend(&pdev->dev);
> >>> +	pm_runtime_set_autosuspend_delay(&pdev->dev, 300); =20
> >=20
> > Care to check if changing pm_runtime_set_autosuspend_delay value
> > to -1 in probe makes the issue go away? Or change it manually
> > to -1 via sysfs.
> >=20
> > If that helps, likely we have a missing pm_runtime_get_sync()
> > somewhere in the driver. =20
>=20
> Yes, it does! It suffices to set it to -1 for one readout.
> Aything else I can test?
>=20
How does it depend on loaded drivers?
Is it really mainline kernel + config + devicetree or something else?

Can you reproduce the problem with init=3D/bin/bash
and then mount sysfs and modprobe omap_hdq?

Regarding pm_runtime stuff I thought I have the worst case scenario.

Regards,
Andreas
