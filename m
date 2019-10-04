Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E05B3CC06F
	for <lists+linux-omap@lfdr.de>; Fri,  4 Oct 2019 18:27:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728264AbfJDQ1O (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 4 Oct 2019 12:27:14 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.221]:16278 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728124AbfJDQ1O (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 4 Oct 2019 12:27:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1570206432;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=0/3jZE2Hpi3+YqUr6/w7aTaGAeSa0HOcpJDg6DnEKPY=;
        b=M8wSo53Yd3aTq7mn4BwjwFmSbjj1JvDeT/jKG7+Y/RaBDolRdpRdNvdd5AbR+tkl9y
        sAfRcMPfdp9O38eIwKqhlKktmPIi/yGJKoQAicEwmtVQDFwusuW8ZXrHZISfk4FJzWFC
        p00NS6AUwmB38UiZKISL9Qp2FiMoMX5xZPKiMVS46EHrNR1dOqCol4jl99ceHCnfr4b2
        A4L5EbvuOdM+lQw3NelFGC/L5UAuCVqoCUjzOc5371JLG5IpIprDhO5TJpThjZ/w9qc+
        NHL4r2Z9eNx0EpCCMc4mDzdfFSwzPnNMlxp9emcFZP2+zxeoW16tY4UuekgUj7x0rgpJ
        QF5A==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDlSYXAoFBA=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 44.28.0 DYNA|AUTH)
        with ESMTPSA id v00409v94GRCiOo
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Fri, 4 Oct 2019 18:27:12 +0200 (CEST)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: iss: camera interface omap5
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20191004161117.GO5610@atomide.com>
Date:   Fri, 4 Oct 2019 18:27:12 +0200
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <EDF29A32-77BB-4346-BBCC-C12F2BB4745E@goldelico.com>
References: <0D08B352-F0DF-45A4-8279-51B07D366AD0@goldelico.com> <20191004161117.GO5610@atomide.com>
To:     Tony Lindgren <tony@atomide.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

> Am 04.10.2019 um 18:11 schrieb Tony Lindgren <tony@atomide.com>:
>=20
> * H. Nikolaus Schaller <hns@goldelico.com> [191004 07:25]:
>> Hi Tony,
>> is there a similar node for omap5 comparable to this for omap4:
>>=20
>> =
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/ar=
ch/arm/boot/dts/omap4.dtsi?h=3Dv5.4-rc1#n176

(I just noticed there seems to be a missing empty line between 216 and =
217)

>=20
> Not sure if it's the same interface as on omap4, but at
> least TRM has "8.1.3.1 ISS Instance Summary" at 0x52000000.

Ok.

IMHO there was a patch where someone got it working a while ago so it is =
likely the same:

	https://e2e.ti.com/support/interface/f/138/t/647460

Now I wonder how it can be updated to current target-module style.

Is it correct to do it similar to omap4 and replace

	/* No child device binding, driver in staging */

by a child node that is compatible to "ti,omap4-iss".
And there define a reg record like in the example on e2e?
I.e. split into sysc registers for the target-module@52000000
and driver specific registers in the child node?

Regarding clocks they likely have to stay with the =
target-module@52000000
node, right?

And what about the dma nodes? Also keep in the target-module@52000000?

BR and thanks,
Nikolaus

