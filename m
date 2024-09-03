Return-Path: <linux-omap+bounces-2085-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1CC969EC0
	for <lists+linux-omap@lfdr.de>; Tue,  3 Sep 2024 15:10:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 794AA1C237B1
	for <lists+linux-omap@lfdr.de>; Tue,  3 Sep 2024 13:10:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B94D1A7242;
	Tue,  3 Sep 2024 13:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="hnSFeCHQ";
	dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="QwbI2MMK"
X-Original-To: linux-omap@vger.kernel.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393441CA6B5;
	Tue,  3 Sep 2024 13:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725369023; cv=pass; b=Y+5G9zjT2CGquRT1vYRo2J2O36ftSwrdAohm+ZKxWGP5JERQ24viOZY7bFpUbAh8yaZUvW61yXzW73gCLlc9WxfVjuWOa0Mckq3xqCFoI01KyUdlK/pI2qXrEdsRv+B8ZXn8qXyUGLq3qZ8TACTMgGcBrHVRmsRAioxED8xEGZ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725369023; c=relaxed/simple;
	bh=hsxrKZ2iyIqOQY7G8J2LCkSw2Bi1TAQgL90iTIspi98=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=N8pUZge38fa1Uu49rsT1XdCXCFBNnMY0RCbag0PUk7PI0JF37V5ZG29hsfd5a1ibshgjoSYs1fHigc8HZxvTlEiFk/VMMQvOVJkzYsimXXyLW0fOHrRi6fAc6sc3ZqAdy68OFrks1R9MdPWF4lXCkT+EXOJAevFdE1P4/WRkYb0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goldelico.com; spf=pass smtp.mailfrom=goldelico.com; dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=hnSFeCHQ; dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=QwbI2MMK; arc=pass smtp.client-ip=85.215.255.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
ARC-Seal: i=1; a=rsa-sha256; t=1725368956; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=KkEsbstuGOH3dkS4n5d2HBcfjlZcB4DmyWSsPs0DLBKekRtlzAeF0kquvhNsFnCkgv
    5ghhR0hQeC43LpAGP2qjdp1bANGVfgznZhS6u7+3ybGRPZz0bkYd57fLgvHCMLhfeNpH
    SKeaVYMGnX0v3oCL6DA5TUiZ9i4LVM1jBzRYTaecO0zm8CGzzNjLvEFQ05ZIKepYSTEM
    ZRcnLxw745KkSfM6DqLwjN8Pkpfn8eixV1hA6BA2dcxmktjIglKdk6ZvbLPo5kcVKD0g
    yy0IEQXFQGAmIxUk69bVnVy3Np92fx5meJ7kAuZZ15RuPZNXONcUwXRK1rcpqVuN9nTn
    8dhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1725368956;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=bFCwmmc2QABYEEsuclxxzGi1x59obbXIfuYf6HFtzJQ=;
    b=HP7yPgwkwQSTN5QHaEkA1yhdLPzVeededKq6kV1uAVEOP0y8VOy5nZn4H2QcL5CbKj
    jAECY5/F+HbrtGYC51KkIfPnrE6ZF4+4i/+w+/cEuixZzmOaiXuNkd237mlPC8tCNUSM
    sAjvDfh14JghRkO8MAQYe9NqPpKERq+M4/zT3BFJcNTzwQ0XwwPLD5xU8W9s3dvQ4k50
    CqMX/gWj9R9I8RGTQO/YdOZQszs8LVSyzvtGiLYCP0lJ6VW6f1mpauGZGppu2vOv6aqT
    LHOlwSTRRXsjxUi2o1uX8eIfOG4LxS+HANUz4j5TGUEtSuzaq3UpJIOfDnBxYiKmCPct
    65kQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1725368956;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=bFCwmmc2QABYEEsuclxxzGi1x59obbXIfuYf6HFtzJQ=;
    b=hnSFeCHQZiaLy2JeAnfLjdc0Wkwd+7bs145Yjsb8kf0cdNw6s9kZZfKNk8cIQBCcHI
    DjqF4rcb/r49JRTxlbtf7+sbTRlhTxGfeQtYNBjhmGyRLz03xKjo8QXssJLmec7XaC3s
    MV8qfEOsKVWJ8nexNLAN/SmKTtZCtKoSYNZwbXyn7pcxooQHZ6/MryUWvNsTdWEhKC8N
    aoyG1GUSactSMeE3FvUpTMiYBIGjcNdCECQX4eoW0x+wHdNzAq2oXnBFVdQ/a3qRzX9v
    zwRYeMzEJDnzTTjTexDO9VMtRCxlYs/tv0f+TAAAiGvjMxaaBDKspIRfgflcINQ6fZQF
    DaFA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1725368956;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=bFCwmmc2QABYEEsuclxxzGi1x59obbXIfuYf6HFtzJQ=;
    b=QwbI2MMK4v5Vxg5jMDgLFJ3EdhlWdeyu89d6gW5k1UeXjqXgGbHoH8/xk++ZMVAl//
    PX1Km9XBv370BaVmEiAA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lFzL1yeDkZ"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 51.2.3 DYNA|AUTH)
    with ESMTPSA id Q984c2083D9FOKf
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Tue, 3 Sep 2024 15:09:15 +0200 (CEST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51\))
Subject: Re: clk mess on omap4460 with mpu clock
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <CAMuHMdWF4G5Uon1=6TMzBogN2CX8EuiVBMuCPtAAMPNa-DtiOw@mail.gmail.com>
Date: Tue, 3 Sep 2024 15:09:04 +0200
Cc: Linux-OMAP <linux-omap@vger.kernel.org>,
 linux-clk@vger.kernel.org,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Paul Walmsley <paul@pwsan.com>,
 Tony Lindgren <tony@atomide.com>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <21258246-D800-47DC-B1F1-C8D879BA2D71@goldelico.com>
References: <20240603234139.280629b2@aktux>
 <CAMuHMdWU74DsWEZtZQJctQQog=9UCG_1LZu5yWvyxx0Zw4LQow@mail.gmail.com>
 <20240903143357.2532258b@akair>
 <CAMuHMdWF4G5Uon1=6TMzBogN2CX8EuiVBMuCPtAAMPNa-DtiOw@mail.gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Andreas Kemnade <andreas@kemnade.info>
X-Mailer: Apple Mail (2.3776.700.51)

Hi,

> Am 03.09.2024 um 14:36 schrieb Geert Uytterhoeven =
<geert@linux-m68k.org>:
>=20
> Hi Andreas,
>=20
> On Tue, Sep 3, 2024 at 2:34=E2=80=AFPM Andreas Kemnade =
<andreas@kemnade.info> wrote:
>> Am Mon, 2 Sep 2024 15:53:07 +0200
>> schrieb Geert Uytterhoeven <geert@linux-m68k.org>:
>>> On Mon, Jun 3, 2024 at 11:41=E2=80=AFPM Andreas Kemnade
>>> <andreas@kemnade.info> wrote:
>>>> just stumbled across this on 6.10-rc1:
>>>>=20
>>>> [    1.475830] ocp:target-module@48210000:mpu:fck: device ID is
>>>> greater than 24 [    1.483154] ti-sysc ocp:target-module@48210000:
>>>> could not add child clock fck: -12

I just have my PandaES up and running today (with LetuxOS) and there I =
can't see
such a report with v6.11-rc6 and everything seems to be fine (except =
some certainly
unrelated  44000000.l3-noc:L3 Standard Error: MASTER MPU TARGET DSS =
(Read Link): At Address: 0x00006070 : Data Access in User mode during =
Functional access).

So can it be a spurious error in 6.10-rc1 and is already fixed (maybe as =
a side-effect)?
Or do we have a happy fix in our distribution kernel? Or does it depend =
on CONFIG?

I can roll back and try to build&run letux-6.10-rc1 as well.

BR,
Nikolaus


