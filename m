Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9180161C48
	for <lists+linux-omap@lfdr.de>; Mon, 17 Feb 2020 21:25:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729829AbgBQUZ0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 17 Feb 2020 15:25:26 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.54]:18951 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727300AbgBQUZ0 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 17 Feb 2020 15:25:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1581971122;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=6k8gkstrNDEzvbYLrt4RKW9bgDvp9rSQ7Q9t/JrNADI=;
        b=FoqUDXbUGz0MgMKGoEhbWjJx3jgoA9g+W6TF9mx5qNzr5x82zTYLw+LX9eATBX0B46
        d9w8uJ3WHvylxWqNZ2fSqi28WzvhuUvm4el3M7UBS9FXDF2dxJcrybXIuXPvkSuJkWMC
        idopXzKOlRVq47s+3KgOKF8Kxb9S0rXxM5CMDbYHnTqAbDHQbgO2MEqtUjhcm+CK2GCb
        0Q0VnHJGHp/kUpNK80cQ1Mf2HxnvwluBfbXgUhzYF8Y55/Wq1ma+eAFY5DYAcHYyRzB6
        dGyLXoW3Y1vGlKVkBGHByrGUAcy+ZskafaZDpGjtJYQz2kZjZ+ddeWLFOTB16BBcYZj9
        gO4A==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDVCaXA0OXQ=="
X-RZG-CLASS-ID: mo00
Received: from mbp-13-nikolaus.fritz.box
        by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
        with ESMTPSA id U06217w1HKPDPPb
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Mon, 17 Feb 2020 21:25:13 +0100 (CET)
Subject: Re: [PATCH v3] extcon: palmas: hide error messages if gpio returns -EPROBE_DEFER
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200217201911.GA168683@lenoch>
Date:   Mon, 17 Feb 2020 21:25:32 +0100
Cc:     MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com, linux-omap@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <CEE4951F-085A-4D9C-AD15-F63C80D958EB@goldelico.com>
References: <d5c2826a5f00fcaee62f00662ae2a44dc4a5395d.1581946695.git.hns@goldelico.com> <C3D9F783-EE45-4681-93D9-C1407284CB59@goldelico.com> <20200217182906.GA140676@lenoch> <012228CC-2B49-4AAE-B574-92E44621F0D6@goldelico.com> <20200217190745.GA147152@lenoch> <017C406F-0DD9-478F-8AD5-D950A4000305@goldelico.com> <20200217201911.GA168683@lenoch>
To:     Ladislav Michl <ladis@linux-mips.org>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Ladis,

> Am 17.02.2020 um 21:19 schrieb Ladislav Michl <ladis@linux-mips.org>:
>=20
> Hi Nikolaus,
>=20
> On Mon, Feb 17, 2020 at 08:33:52PM +0100, H. Nikolaus Schaller wrote:
>> Hi Ladis,
>>=20
>>> Am 17.02.2020 um 20:07 schrieb Ladislav Michl =
<ladis@linux-mips.org>:
>>> Linux kernel prints so many lines on bootup and only few of them are
>>> valuable. Lets improve it by printing error value to give a clue
>>> why it failed.
>>=20
>> Hm. The upstream code does already print the error. This feature is =
not removed.
>> But it is also printing an error in the EPROBE_DEFER case as well, =
where it is
>> not needed or not an error.
>=20
> It seems you missed I'm printing also error _value_.

Indeed.

Well, usually there is no error so adding the error number is not of =
much
use (except for debugging)... The most likely one seems to be =
-EPROBE_DEFER.

On the omap5 boards where I have seen the error message being printed =
they were
EPROBE_DEFER.

So your proposal changes the subject (which has a very small focus).

> The rest of discussion
> would need disassembly and I'll do it once I'll be waiting for yet =
another
> long run recompile.

:)

BR and thanks,
Nikolaus

