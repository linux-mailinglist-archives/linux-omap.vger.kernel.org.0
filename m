Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE6BC6C073
	for <lists+linux-omap@lfdr.de>; Wed, 17 Jul 2019 19:34:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726917AbfGQReD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 17 Jul 2019 13:34:03 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.165]:18818 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725948AbfGQReD (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 17 Jul 2019 13:34:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1563384839;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=dOZPXX2/0UU+1woBsjSlDEXl3gIGo8OmSzylGf5Wz0k=;
        b=skV6paaY29cqK31xSkvj0hUeaBV/IkN4lFR+MuC1HRPNjqaOjs8MjwbSLxkooasoOC
        HtPRxz/FcFN5YOxIyG+WeZdnk/3YHTxpEigM2sD0JBNH56UO1ole/FcnxaXTmU9nR6Ve
        Z6/fFfw/r7biyVjLvqtwRQXwqlZjt/hpSuLoHbMJMLBk6iROA82xSMhfE6f/eX+PN4cW
        3/E90TpzmqP35YoWIU5MPwSX3eOWdD1CNTx1HKay8gCmFfn2ZYVuHZamu6+by3R4X890
        /wiGfp7J8ovQ15X/MJnHgA+idSS7HY4/k5i4vdnYz9eMxlmgWyb3SsbjOY8trvUnScGV
        9RQg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDlaZXA4NYcM="
X-RZG-CLASS-ID: mo00
Received: from mbp-13-nikolaus.fritz.box
        by smtp.strato.de (RZmta 44.24 DYNA|AUTH)
        with ESMTPSA id V09459v6HHXaDXl
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Wed, 17 Jul 2019 19:33:36 +0200 (CEST)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [Letux-kernel] [PATCH v3 0/5] drm/panel-simple: Add panel parameters for ortustech-com37h3m05dtc/99dtc and sharp-lq070y3dg3b
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <CF1D9929-58D2-4E75-932A-870D11BBFBDE@goldelico.com>
Date:   Wed, 17 Jul 2019 19:33:35 +0200
Cc:     Mark Rutland <mark.rutland@arm.com>,
        devicetree <devicetree@vger.kernel.org>,
        David Airlie <airlied@linux.ie>,
        Belisko Marek <marek.belisko@gmail.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <33D92C0E-A430-4C34-A698-646F2592093D@goldelico.com>
References: <cover.1559905870.git.hns@goldelico.com> <0842FF88-D8E0-441B-837B-769C2EF6C1CB@goldelico.com> <20190625204356.GF18595@ravnborg.org> <20190626073350.GA15288@ravnborg.org> <CF1D9929-58D2-4E75-932A-870D11BBFBDE@goldelico.com>
To:     Sam Ravnborg <sam@ravnborg.org>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Sam,

> Am 26.06.2019 um 14:40 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>=20
> Hi Sam,
>=20
>> Am 26.06.2019 um 09:33 schrieb Sam Ravnborg <sam@ravnborg.org>:
>>=20
>> Hi Nikolaus.
>>=20
>>>>=20
>>>> any progress towards merging this somewhere? It did not yet arrive =
in linux-next.
>>>>=20
>>>> BTW: should also be applied to 5.2
>>> The drm bits are reviewed. The DT bits needs OK from DT people.
>>> When we have OK from DT people we can apply them all to =
drm-misc-next.
>>=20
>> I got OK on irc from Rob to process these.
>> All patches are now applied to drm-misc-next.
>=20
> Thanks for taking care of this!

I have checked but it seems they are still not merged into linux-next.

BR and thanks,
Nikolaus

