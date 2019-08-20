Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47D6D957A2
	for <lists+linux-omap@lfdr.de>; Tue, 20 Aug 2019 08:49:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728960AbfHTGtJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 20 Aug 2019 02:49:09 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.53]:16467 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726049AbfHTGtJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 20 Aug 2019 02:49:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1566283744;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=MgN3E8s/3Mj7cEN1rbdygo/AW47MY5ZHyV9Juur5Ve4=;
        b=n6ZVKF/Ew8NYHv20jCwI/8DAIgKCChmnEHej8BXFCZS/6LO3V9FvSyVl+XrqpevQoH
        TeNFurnYxns3Z/5/ZyuaVhZeuFm3M1Sh5P2gEoWZbN24Zr0RHy59lKuv8fwh88uTJm1C
        /5zqDM9CldDKgHd3BE6GwBUqMJ5x+/oLKqzBdlIbzxpjgqH+mMGugeuaXcLKFOk+z7MF
        e1yFJQDs5Qyk6qgyUYlmj/Bn+VAhyL+my5X4RqJmeyT2iTjuG5bX0k3Cmtf9g8rAfWdQ
        39y8A9henv4OBNkin6+Mq67EigF3oWBZrKiB6v1Y6xXnzEVNgcFTODwFb8U2kU/kDbkH
        EiUw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4gpw8F85YnqKQ+tuXA=="
X-RZG-CLASS-ID: mo00
Received: from [192.168.2.133]
        by smtp.strato.de (RZmta 44.26.1 DYNA|AUTH)
        with ESMTPSA id V074e8v7K6mbUB7
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Tue, 20 Aug 2019 08:48:37 +0200 (CEST)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: Lay common foundation to make PVR/SGX work without hacks on OMAP34xx, OMAP36xx, AM335x and potentially OMAP4, OMAP5
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <CAHCN7x+87xTsA3MeHy7kUWU0SU3X8HmSc2wbk5gKvYm1dRNe6A@mail.gmail.com>
Date:   Tue, 20 Aug 2019 08:48:51 +0200
Cc:     Merlijn Wajer <merlijn@wizzup.org>,
        Tony Lindgren <tony@atomide.com>,
        =?utf-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Philipp Rossak <embed3d@gmail.com>,
        moaz korena <moaz@korena.xyz>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        =?utf-8?Q?Filip_Matijevi=C4=87?= <filip.matijevic.pz@gmail.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        linux-omap <linux-omap@vger.kernel.org>,
        kernel@pyra-handheld.com,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, maemo-leste@lists.dyne.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <04809E3E-A690-4931-B949-1CFDAF407C14@goldelico.com>
References: <20180108214032.GW3872@atomide.com> <4d99c1ae-7752-949b-7e88-bc8f1dc594a2@wizzup.org> <0C51EC59-9CDC-4196-ACF9-24596C9E61B6@goldelico.com> <FA4520D5-62CB-446D-975C-A1C7B9251517@goldelico.com> <20190212205132.GO5720@atomide.com> <0b00ce0a-969f-e638-8247-c2da96cf7ce6@gmail.com> <20190213004143.GP5720@atomide.com> <480AB632-A544-41E7-95A4-DC354AEBB71A@goldelico.com> <CAKpie0SigGGsQxSU+X-Mz5boy-Xx=3wRNOcrf+F=ehFr3RBi7Q@mail.gmail.com> <092210C3-05DE-4AFB-986F-81BD8F990B67@goldelico.com> <CAKpie0RXM1UC33YFeFy-kAxfGhYGNkw4vUgNTThf-ZCAhPTVXw@mail.gmail.com> <BE23C1E4-2877-49FA-B230-F9C10691B805@goldelico.com> <CAKpie0TSo-8gmDm9_Zw4Sd+kjVVEomp8yA9Vu8qY2U2AcrQc=w@mail.gmail.com> <8A069D96-C65F-43F5-8F54-20019CFB1A8D@goldelico.com> <d0cbfaaf-813e-8803-f90b-931a38396750@wizzup.org> <3A03FF16-C203-43ED-AEEF-0260F6B3331A@goldelico.com> <3b0a5e78-c4c2-1963-bac7-b49496a1e9b9@wizzup.org> <1F942AAB-1648-46C0-ADD5-90F6898778BE@goldelico.com> <84cac9b8-0eff-33f8-464d-4f8045d7db19@wizzup.org> <BFAA7FA6-A352-476A-99F9-02EA663A6AAD@goldelico.com> <CAHCN7x+87xTsA3MeHy7kUWU0SU3X8HmSc2wbk5gKvYm1dRNe6A@mail.gmail.com>
To:     Adam Ford <aford173@gmail.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


> Am 19.08.2019 um 21:43 schrieb Adam Ford <aford173@gmail.com>:
>=20
>> Thanks to the help from the Pyra community, I was able to get a =
(binary) reference
>> implementation using DRM that works on Pyra/OMAP5. At least the =
gles1test1.
>=20
> just a question,
>=20
> If DRM is working, does that mean it works without needing the =
overhead of X?

Yes, we have to kill X11 to successfully run the gles1test1. An =
interesting question
will be how to mix both... E.g. have a 3D rendering in a window =
controlled by some
window manager.=
