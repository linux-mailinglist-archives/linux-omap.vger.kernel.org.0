Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02FC1A5473
	for <lists+linux-omap@lfdr.de>; Mon,  2 Sep 2019 12:52:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730493AbfIBKwK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 2 Sep 2019 06:52:10 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.164]:15406 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727951AbfIBKwJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 2 Sep 2019 06:52:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1567421522;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=PIIRQHyBHjDWfAG96VfWkalrihUvQNdQm4OYqIZRphQ=;
        b=eI2wkWSi4erK2jWXlfsfXRO3n1bmVSS0B4Tbww+RUpVVxKKc7bCXZ5nQTtdqgF6yeM
        AxR9MxZmNCTOx0QulOJyXDw5fQnQNIrYyO8gmV9mscwp/9f83sSzYta+gVZHIHpnRcrC
        StvcJMTHxIvBnu9KkRM8fzE5R0oeHKtHJCq69E6MBKGKzifxrE0/FFIptuuivaWOuCVQ
        bEoyIL2Hk5PFmlWZ+kADEgpycZSPK6Va7uNmCFiYji/SXjHsz0kVNFvEw9hF2yeIFzlA
        HprxE4yVn9ipXJR7t6QlT/3hKzJPyG9w6zgxPc4jUjqmlxrWFWfcxtvjk5ra0P2sp/RY
        LYVQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDVCaXA4ImYQ="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 44.27.0 DYNA|AUTH)
        with ESMTPSA id u036f9v82Aq1PuM
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Mon, 2 Sep 2019 12:52:01 +0200 (CEST)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: omap36 1GHz OPP
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20190817204746.5e06b9cc@lepton>
Date:   Mon, 2 Sep 2019 12:52:00 +0200
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <1D399618-067C-4108-B9A8-9948AE5E2FFF@goldelico.com>
References: <CAHCN7xJXJ__Gm3x=eAKkXuRTi1tDJocddKUzSw8oeYXQzM4tuQ@mail.gmail.com> <20190814232816.4906f903@lepton> <CAHCN7xJyhy9F6JLCG_Lz7EizNDGnA_wHgr13Xs91yo+zdp2c4Q@mail.gmail.com> <20190817204746.5e06b9cc@lepton>
To:     =?utf-8?Q?Andr=C3=A9_Roth?= <neolynx@gmail.com>,
        Adam Ford <aford173@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        =?utf-8?Q?Filip_Matijevi=C4=87?= <filip.matijevic.pz@gmail.com>,
        Sebastian Reichel <sre@kernel.org>, Pavel Machek <pavel@ucw.cz>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi all,

> Am 17.08.2019 um 20:47 schrieb Andr=C3=A9 Roth <neolynx@gmail.com>:
>=20
>=20
> Hi Adam,
>=20
>> What makes DVFS different from what cpufreq does by changing the
>> operating voltage and frequency?
>=20
> If I understood correctly, it actively measures and optimizes the
> voltages applied by cpufreq since they change with
> temperature/manufacturing differences/age. At higher frequencies
> (i.e. 1GHz) this is required to not damage the chip or reduce its
> lifetime.

I also understood that there are some CONTROL_FUSE registers in syscon
(e.g. CONTROL_FUSE_OPP1G_VDD1) to specify factory optimized values.
Maybe DVFS can/should be added to the ti-cpufreq driver?

Interestingly, the n950-n9 device tree simply adds an 1GHz OPP
at 1.375V by commit 0f4f1542ea0928f4840d308e411797c0dacac239

	=
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/ar=
ch/arm/boot/dts/omap3-n950-n9.dtsi?h=3Dv5.3-rc6#n14

This would mean that it would suffice to add the OPP1G to the
device tree, at least on the n950. But we have seen some RAM
errors on other devices when trying 1GHz.

Maybe someone owning and using a mainline kernel on n950 can
comment on reliability of this setting.

BR,
Nikolaus

