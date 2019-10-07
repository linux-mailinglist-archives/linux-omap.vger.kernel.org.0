Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4A84CE871
	for <lists+linux-omap@lfdr.de>; Mon,  7 Oct 2019 17:56:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727814AbfJGP4p (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 7 Oct 2019 11:56:45 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.82]:30784 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727791AbfJGP4p (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 7 Oct 2019 11:56:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1570463800;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=FyKZsEpJI7kWJI0Rot+lLT/EfNutbsETMRLUCZ3F92M=;
        b=EatcSIenBjqm/1WyyRTNIhxW5cXtvt75fKzQ6BCRo9ww4I+LTGBZgHx1Hd7vMs4sIe
        R5iw5y+wF4A4Fn41yB3oW4WwMZ4BA3Prh9+xmuaPcIg9PW3NwvmX8ciu6W5VMygMcKs+
        lbqWhJrcyxqx4+gmSzc7WmtGjBqU4jQESUEZGfJFTbYYArteDv+QIsSXJ1kEZPN5fes3
        G4ehiZpu9+UBcTWqUnz/Pl2Ev5orf9sP7U38cP9GcweAS1ZV7gNph+ZRJl/cmUvzeIgt
        0lbWq/lwpjoknA1rDIRJbSUM7tjGZq+RLxnQuRKXSPNU5nK5nsOpMqGKxaDnNSa889/S
        ht+Q==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmMgw47ty6c="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 44.28.0 DYNA|AUTH)
        with ESMTPSA id v00409v97FudqQY
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Mon, 7 Oct 2019 17:56:39 +0200 (CEST)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: Lay common foundation to make PVR/SGX work without hacks on OMAP34xx, OMAP36xx, AM335x and potentially OMAP4, OMAP5
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20191007155252.GQ5610@atomide.com>
Date:   Mon, 7 Oct 2019 17:56:38 +0200
Cc:     Merlijn Wajer <merlijn@wizzup.org>, Adam Ford <aford173@gmail.com>,
        Philipp Rossak <embed3d@gmail.com>,
        =?utf-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        =?utf-8?Q?Filip_Matijevi=C4=87?= <filip.matijevic.pz@gmail.com>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        moaz korena <moaz@korena.xyz>,
        James Hilliard <james.hilliard1@gmail.com>,
        kernel@pyra-handheld.com,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, maemo-leste@lists.dyne.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Tero Kristo <t-kristo@ti.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <D1CD5D93-4178-4359-AF00-FFC3AA9CA054@goldelico.com>
References: <d0cbfaaf-813e-8803-f90b-931a38396750@wizzup.org> <3A03FF16-C203-43ED-AEEF-0260F6B3331A@goldelico.com> <3b0a5e78-c4c2-1963-bac7-b49496a1e9b9@wizzup.org> <1F942AAB-1648-46C0-ADD5-90F6898778BE@goldelico.com> <84cac9b8-0eff-33f8-464d-4f8045d7db19@wizzup.org> <BFAA7FA6-A352-476A-99F9-02EA663A6AAD@goldelico.com> <CAHCN7x+87xTsA3MeHy7kUWU0SU3X8HmSc2wbk5gKvYm1dRNe6A@mail.gmail.com> <04809E3E-A690-4931-B949-1CFDAF407C14@goldelico.com> <ebb50954-b456-4dab-0765-9dfa06c67075@wizzup.org> <C3A56737-6187-4B31-8697-3A02DD164429@goldelico.com> <20191007155252.GQ5610@atomide.com>
To:     Tony Lindgren <tony@atomide.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


> Am 07.10.2019 um 17:52 schrieb Tony Lindgren <tony@atomide.com>:
>=20
> Hi,
>=20
> * H. Nikolaus Schaller <hns@goldelico.com> [191005 16:59]:
>>=20
>>=20
>> * AM335x (BeagleBoneBlack): reports a problem with =
omap_reset_deassert:
>> [  204.246706] omap_reset_deassert: timedout waiting for gfx:0
>=20
> Please try with Tero's current github branch at =
github.com/t-kristo/linux-pm.git
> 5.4-rc1-ipc from few days ago, the earlier versions had still issues.

I have seen there has been a new version today and I'll try that one =
asap.

>=20
>> * OMAP5 (Pyra): fails to enable the clocks (did work with the =
previous version)
>> [  304.140363] clock-controller:clk:0000:0: failed to enable
>> [  304.147388] PVR_K:(Error): EnableSGXClocks: pm_runtime_get_sync =
failed (16)
>=20
> Hmm no idea what might be up with this one. Did some clkctrl clock
> fixes maybe cause a regression here? Tero do you have any ideas?

BR and thanks,
Nikolaus

